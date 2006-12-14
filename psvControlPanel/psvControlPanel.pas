{*******************************************************}
{                TControlPanel component                }
{                     version 2.0                       }
{ Author:                                               }
{ Serhiy Perevoznyk                                     }
{ serge_perevoznyk@hotmail.com                          }
{                                                       }
{     Use, modification and distribution is allowed     }
{without limitation, warranty, or liability of any kind.}
{                                                       }
{*******************************************************}
{$WARNINGS OFF}
unit psvControlPanel;

interface

uses
  Windows, Messages, SysUtils, Classes,  Controls, Forms, Dialogs,
  ComCtrls, Graphics;

type
  TCPlApplet =  function (hwndCPl: THandle; uMsg: DWORD; lParam1, lParam2: Longint): Longint; stdcall;

  TAppletData = class
  public
    AppletHandle : THandle;
    Number       : integer;
    Proc         : TCPLApplet;
    lData        : LongInt;
  end;

  TAppletListData = class
  private
    FImage : TIcon;
    FFileName : string;
    FNumber   : integer;
    AppletHandle : THandle;
    lData        : longint;
    Proc         : TCPLApplet;
    FCaption     : string;
    FDescription : string;
  public
    constructor Create;
    destructor  Destroy; override;
    procedure   Execute;
    property    Image : TIcon read FImage;
    property    FileName : string read FFileName;
    property    Number : integer  read FNumber;
    property    Caption : string read FCaption;
    property    Description : string read FDescription;
  end;

  TAppletList = class(TList)
  protected
    procedure Notify(Ptr: Pointer; Action: TListNotification); override;
    function GetItem(Index: Integer): TAppletListData;
    procedure SetItem(Index: Integer; AObject: TAppletListData);
    procedure GetItemInfo(AFileName : string);
  public
    constructor Create;
    procedure Load(AFolderName : string);
    function Add(AObject: TAppletListData): Integer;
    function Remove(AObject: TAppletListData): Integer;
    function IndexOf(AObject: TAppletListData): Integer;
    procedure Insert(Index: Integer; AObject: TAppletListData);
    property Items[Index: Integer]: TAppletListData read GetItem write SetItem; default;
  end;

  TControlPanel = class(TListView)
  private
    FImages : TImageList;
    FSmallImages : TImageList;
    FFolder : string;
    FActive : boolean;
    SearchRec  : TSearchRec;
    procedure SetFolder(const Value: string);
    procedure SetActive(const Value: boolean);
  protected
    procedure FillItems; virtual;
    procedure ClearItems; virtual;
    procedure GetItemInfo(AName : string); virtual;
    procedure ExecuteApplet(Sender : TObject);
    procedure DragAppletOver(Sender, Source: TObject; X, Y: Integer;
                  State: TDragState; var Accept: Boolean);
    procedure AppletDragDrop(Sender, Source: TObject; X, Y: Integer);
  public
    constructor Create(AOwner : TComponent); override;
    destructor  Destroy; override;
    procedure   Execute;
  published
    property Folder : string read FFolder write SetFolder;
    property Active : boolean read FActive write SetActive default false;
    property Align;
    property ViewStyle;
    property BiDiMode;
    property BorderStyle;
    property BorderWidth;
    property Color;
    property Ctl3D;
    property DragCursor;
    property Font;
    property FlatScrollBars;
    property ReadOnly default False;
    property ParentColor default False;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop default True;
    property Visible;
  end;

procedure Register;

implementation

const
  CPL_DYNAMIC_RES = 0;
  CPL_INIT = 1;
  CPL_GETCOUNT = 2;
  CPL_INQUIRE = 3;
  CPL_SELECT = 4;
  CPL_DBLCLK = 5;
  CPL_STOP = 6;
  CPL_EXIT = 7;
  CPL_NEWINQUIRE = 8;
  CPL_STARTWPARMS = 9;
  CPL_SETUP = 200;

type

  PCPLInfo = ^tagCPLInfo;
  tagCPLINFO = packed record
     idIcon: Integer;  // icon resource id, provided by CPlApplet()
     idName: Integer;  // name string res. id, provided by CPlApplet()
     idInfo: Integer;  // info string res. id, provided by CPlApplet()
     lData : Longint;  // user defined data
  end;
  TCPLInfo = tagCPLINFO;


  PNewCPLInfoA = ^tagNEWCPLINFOA;
  tagNEWCPLINFOA = packed record
    dwSize:        DWORD;   // similar to the commdlg
    dwFlags:       DWORD;
    dwHelpContext: DWORD;   // help context to use
    lData:         Longint; // user defined data
    hIcon:         HICON;   // icon to use, this is owned by CONTROL.EXE (may be deleted)
    szName:        array[0..31] of AnsiChar;    // short name
    szInfo:        array[0..63] of AnsiChar;    // long name (status line)
    szHelpFile:    array[0..127] of AnsiChar;   // path to help file to use
  end;
  TNewCPLInfoA = tagNEWCPLINFOA;

  PNewCPLInfoW = ^TNewCPLInfoW;
  tagNEWCPLINFOW = packed record
    dwSize:        DWORD;   // similar to the commdlg
    dwFlags:       DWORD;
    dwHelpContext: DWORD;   // help context to use
    lData:         Longint; // user defined data
    hIcon:         HICON;   // icon to use, this is owned by CONTROL.EXE (may be deleted)
    szName:        array[0..31] of WideChar;    // short name
    szInfo:        array[0..63] of WideChar;    // long name (status line)
    szHelpFile:    array[0..127] of WideChar;   // path to help file to use
  end;
  TNewCPLInfoW = tagNEWCPLINFOW;

  TNewCpl = record
   case integer of
    0 : (NewCplInfoA : TNewCplInfoA);
    1 : (NewCplInfoW : TNewCplInfoW);
  end;

procedure Register;
begin
  RegisterComponents('Win32', [TControlPanel]);
end;

function DirectoryExists(const Directory: string): Boolean;
var
  Code: Integer;
begin
  Code := GetFileAttributes(PChar(Directory));
  Result := (Code <> -1) and (FILE_ATTRIBUTE_DIRECTORY and Code <> 0);
end;

{ TControlPanel }

procedure TControlPanel.AppletDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  if ( (Sender = Self) and (Source = Self) ) then
   begin
     (Source as TControlPanel).Selected.SetPosition(Point(X,Y));
     Arrange( arDefault	 );	
   end;

end;

procedure TControlPanel.ClearItems;
var
 I : integer;
begin
  FImages.Clear;
  FSmallImages.Clear;
  for i := 0 to Items.Count - 1 do
  begin
    if Assigned(Items[i].Data) then
     begin
       TAppletData(Items[i].Data).Proc(Self.Handle, CPL_STOP,
       TAppletData(Items[i].Data).Number, TAppletData(Items[i].Data).lData);
     end;
  end;

  for i := 0 to Items.Count - 1 do
     begin
       if Assigned(Items[i].data) then
        begin
          if TAppletData(Items[i].Data).AppletHandle > 0 then
           begin
             TAppletData(Items[i].Data).Proc(Self.Handle, CPL_EXIT, 0, 0);
             FreeLibrary(TAppletData(Items[i].Data).AppletHandle);
           end;
          TAppletData(Items[i].Data).Free;
          Items[i].Data := nil;
        end;
     end;
  Self.Items.Clear;
  Invalidate;
end;

constructor TControlPanel.Create(AOwner: TComponent);
var
 Column : TListColumn;
begin
  inherited;
  FImages := TImageList.Create(Self);
  FImages.Width := 32;
  FImages.Height := 32;
  FSmallImages := TImageList.Create(Self);
  Self.LargeImages := FImages;
  Self.SmallImages := FSmallImages;
  Self.ViewStyle := vsIcon;
  OnDblClick := ExecuteApplet;
  DragMode := dmAutomatic;
  OnDragOver := DragAppletOver;
  OnDragDrop := AppletDragDrop;
  Column := Columns.Add;
  Column.Caption := 'Name';
  Column.Width := 200;
  Column := Columns.Add;
  Column.Caption := 'Description';
  Column.Width := 250;
end;

destructor TControlPanel.Destroy;
begin
  Active := false;
  FImages.Free;
  FSmallImages.Free;
  inherited;
end;

procedure TControlPanel.DragAppletOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  if (Sender = Self) then
   Accept := true;
end;

procedure TControlPanel.Execute;
begin
  ExecuteApplet(Self);
end;

procedure TControlPanel.ExecuteApplet(Sender: TObject);
begin
  if not Active then
   Exit;
  if Assigned(Self.ItemFocused) then
   begin
     TAppletData(ItemFocused.Data).Proc(0, CPL_DBLCLK,
       TAppletData(ItemFocused.Data).Number, TAppletData(ItemFocused.Data).lData);
   end;
end;

procedure TControlPanel.FillItems;
var
  FolderName : string;
  FileName   : string;
begin
  FolderName := IncludeTrailingBackSlash(FFolder);
  if DirectoryExists(FolderName) then
   begin
     if FindFirst(FolderName + '*.cpl', faAnyFile, SearchRec) = 0 then
      begin
        FileName := FolderName + SearchRec.Name;
        GetItemInfo(FileName);
        while FindNext(SearchRec) = 0 do
         begin
           FileName := FolderName + SearchRec.Name;
           GetItemInfo(FileName);
         end;
      end;
    FindClose(SearchRec);
   end;
end;

procedure TControlPanel.GetItemInfo(AName: string);
var
 Info     : TCPLInfo;
 NewCpl   : TNewCpl;
 AHandle  : THandle;
 AppletProc : TCPlApplet;
 Item : TListItem;
 Icon : TIcon;
 IconNumber : integer;
 TotalApplets : integer;
 counter      : integer;
 WND : THandle;

begin
 if SearchRec.Attr and faDirectory = 0 then
  begin
    WND := Self.Handle;
    AHandle := LoadLibrary(PChar(AName));
    if AHandle > 0 then
      begin
        @AppletProc := GetProcAddress(AHandle, 'CPlApplet');
        if Assigned(AppletProc) then
          begin
            AppletProc(WND, CPL_INIT, 0, 0);
            TotalApplets := AppletProc(WND, CPL_GETCOUNT, 0, 0);
            for counter := 0 to TotalApplets -1 do
              begin
                FillChar(NewCpl, SizeOf(NewCpl),0);
                AppletProc(WND, CPL_NEWINQUIRE, counter, integer(@NewCpl));

                if NewCpl.NewCplInfoA.dwSize = SizeOf(tagNEWCPLINFOW) then
                 begin
                   Item := Self.Items.Add;
                   Item.Caption := NewCpl.NewCplInfoW.szName;
                   Item.SubItems.Add(NewCpl.NewCplInfoW.szInfo);
                   Icon := TIcon.Create;
                   Icon.Handle := Newcpl.NewCplInfoW.hIcon;
                   IconNumber := FImages.AddIcon(Icon);
                   FSmallImages.AddIcon(Icon);
                   Icon.Free;
                   Item.ImageIndex := IconNumber;
                   Item.Data := TAppletData.Create;
                   if counter = 0 then
                    TAppletData(Item.Data).AppletHandle := AHandle
                     else
                       TAppletData(Item.Data).AppletHandle := 0;

                  TAppletData(Item.Data).Number := counter;
                  TAppletData(Item.Data).Proc := AppletProc;
                  TAppletData(Item.Data).lData := NewCpl.NewCplInfoW.lData;
                end
                 else
                   begin
                     if NewCpl.NewCplInfoA.dwSize <> SizeOf(tagNEWCPLINFOA) then
                       begin
                         AppletProc(WND, CPL_INQUIRE, counter, Integer(@Info));
                         LoadString(AHandle, Info.idName, NewCpl.NewCplInfoA.szName, 32);
                         LoadString(AHandle, Info.idInfo, NewCpl.NewCplInfoA.szInfo, 64);
                         Icon := TIcon.Create;
                         Icon.Handle := LoadIcon(AHandle, PChar(Info.idIcon));
                        NewCpl.NewCplInfoA.lData := Info.lData;
                       end
                         else
                          begin
                             Icon := TIcon.Create;
                             Icon.Handle := Newcpl.NewCplInfoA.hIcon;
                          end;
                     Item := Self.Items.Add;
                     Item.Caption := NewCpl.NewCplInfoA.szName;
                     Item.SubItems.Add(NewCpl.NewCplInfoA.szInfo);
                     IconNumber := FImages.AddIcon(Icon);
                     FSmallImages.AddIcon(Icon);
                     Icon.Free;
                     Item.ImageIndex := IconNumber;
                     Item.Data := TAppletData.Create;
                     if Counter = 0 then
                      TAppletData(Item.Data).AppletHandle := AHandle
                       else
                         TAppletData(Item.Data).AppletHandle := 0;

                     TAppletData(Item.Data).Number := counter;
                     TAppletData(Item.Data).Proc := AppletProc;
                     TAppletData(Item.Data).lData := newCpl.NewCplInfoA.lData;
              end;

          end;
        end;
     end;
 end;
end;

procedure TControlPanel.SetActive(const Value: boolean);
begin
  if FActive <> Value then
   begin
     FActive := Value;
     if FActive then
      FillItems
       else
         ClearItems;
   end;
end;

procedure TControlPanel.SetFolder(const Value: string);
begin
  if FFolder <> Value then
   begin
     FFolder := Value;
     Active := false;
   end;
end;

{ TAppletList }

function TAppletList.Add(AObject: TAppletListData): Integer;
begin
  Result := inherited Add(AObject);
end;

constructor TAppletList.Create;
begin
  inherited Create;
end;

function TAppletList.GetItem(Index: Integer): TAppletListData;
begin
  Result := inherited Items[Index];
end;

procedure TAppletList.GetItemInfo(AFileName: string);
var
 Info     : TCPLInfo;
 NewCpl   : TNewCpl;
 AHandle  : THandle;
 AppletProc : TCPlApplet;
 Item : TAppletListData;
 Icon : TIcon;
 TotalApplets : integer;
 counter      : integer;
 WND : THandle;
begin
    WND := GetFocus;
    AHandle := LoadLibrary(PChar(AFileName));
    if AHandle > 0 then
      begin
        @AppletProc := GetProcAddress(AHandle, 'CPlApplet');
        if Assigned(AppletProc) then
          begin
            AppletProc(WND, CPL_INIT, 0, 0);
            TotalApplets := AppletProc(WND, CPL_GETCOUNT, 0, 0);
            for counter := 0 to TotalApplets -1 do
              begin
                FillChar(NewCpl, SizeOf(NewCpl),0);
                AppletProc(WND, CPL_NEWINQUIRE, counter, integer(@NewCpl));

                if NewCpl.NewCplInfoA.dwSize = SizeOf(tagNEWCPLINFOW) then
                 begin
                   Item := TAppletListData.Create;
                   Add(Item);
                   Item.FCaption := NewCpl.NewCplInfoW.szName;
                   Item.FDescription := NewCpl.NewCplInfoW.szInfo;
                   Icon := TIcon.Create;
                   Icon.Handle := Newcpl.NewCplInfoW.hIcon;
                   Item.FImage.Assign(Icon);
                   Icon.Free;
                   if counter = 0 then
                    Item.AppletHandle := AHandle
                     else
                       Item.AppletHandle := 0;

                  Item.FNumber := counter;
                  Item.Proc := AppletProc;
                  Item.lData := NewCpl.NewCplInfoW.lData;
                end
                 else
                   begin
                     if NewCpl.NewCplInfoA.dwSize <> SizeOf(tagNEWCPLINFOA) then
                       begin
                         AppletProc(WND, CPL_INQUIRE, counter, Integer(@Info));
                         LoadString(AHandle, Info.idName, NewCpl.NewCplInfoA.szName, 32);
                         LoadString(AHandle, Info.idInfo, NewCpl.NewCplInfoA.szInfo, 64);
                         Icon := TIcon.Create;
                         Icon.Handle := LoadIcon(AHandle, PChar(Info.idIcon));
                        NewCpl.NewCplInfoA.lData := Info.lData;
                       end
                         else
                          begin
                             Icon := TIcon.Create;
                             Icon.Handle := Newcpl.NewCplInfoA.hIcon;
                          end;
                     Item := TAppletListData.Create;
                     Add(Item);
                     Item.FCaption := NewCpl.NewCplInfoA.szName;
                     Item.FDescription := NewCpl.NewCplInfoA.szInfo;
                     Item.FImage.Assign(Icon);
                     Icon.Free;
                     if Counter = 0 then
                      Item.AppletHandle := AHandle
                       else
                         Item.AppletHandle := 0;

                     Item.FNumber := counter;
                     Item.Proc := AppletProc;
                     Item.lData := newCpl.NewCplInfoA.lData;
              end;

          end;
        end;
     end;
end;


function TAppletList.IndexOf(AObject: TAppletListData): Integer;
begin
  Result := inherited IndexOf(AObject);
end;

procedure TAppletList.Insert(Index: Integer; AObject: TAppletListData);
begin
  inherited Insert(Index, AObject);
end;

procedure TAppletList.Load(AFolderName: string);
var
 SearchRec : TSearchRec;
 FileName  : string;
begin
  Clear;
  AFolderName := IncludeTrailingBackSlash(AFolderName);
  if DirectoryExists(AFolderName) then
   begin
     if FindFirst(AFolderName + '*.cpl', faArchive, SearchRec) = 0 then
      begin
        FileName := AFolderName + SearchRec.Name;
        GetItemInfo(FileName);
        while FindNext(SearchRec) = 0 do
         begin
           FileName := AFolderName + SearchRec.Name;
           GetItemInfo(FileName);
         end;
      end;
    FindClose(SearchRec);
   end;
end;

procedure TAppletList.Notify(Ptr: Pointer; Action: TListNotification);
begin
    if Action = lnDeleted then
      TObject(Ptr).Free;
  inherited Notify(Ptr, Action);
end;

function TAppletList.Remove(AObject: TAppletListData): Integer;
begin
  Result := inherited Remove(AObject);
end;

procedure TAppletList.SetItem(Index: Integer; AObject: TAppletListData);
begin
  inherited Items[Index] := AObject;
end;

{ TAppletListData }

constructor TAppletListData.Create;
begin
  inherited;
  FImage := TIcon.Create;
end;

destructor TAppletListData.Destroy;
begin
  FImage.Free;
  Proc(GetFocus, CPL_STOP, Number, lData);
  if AppletHandle > 0 then
    begin
      Proc(GetFocus, CPL_EXIT, 0, 0);
      FreeLibrary(AppletHandle);
    end;
  inherited;
end;

procedure TAppletListData.Execute;
begin
  Proc(0, CPL_DBLCLK,   Number, lData);
end;


end.
