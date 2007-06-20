{*****************************************************************************
  Name           : psvPluginIntf
  Author         : Perevoznyk Serhiy
  Description    : PSV Plugins Framework
  History        :

  Date         By                   Description
  ----         --                   -----------
  23-07-2004      Perevoznyk Serhiy     Initial creation of the Unit.
 *****************************************************************************}

{$I psvPlugin.Inc}

Unit psvPluginIntf;

interface

uses
   Windows,
   SysUtils,
   Classes,
   messages,
   controls,
   ComObj,
   Forms,
   Menus,
   Dialogs,
   StdCtrls,
   ExtCtrls,
   FileCtrl,
   DB,
   ShellAPI;

const
  WM_UNLOADPLUGIN = WM_USER + 1234;

type

   TpsvPluginManager = class;

   TOnPluginExecute = procedure(Sender : TObject; AManager : TpsvPluginManager; AName : string) of object;
   TOnGetPluginsList = procedure(Sender : TObject; AList : TStrings) of object;

   TpsvPluginAction = class(TCollectionItem)
   private
     FName      : string;
     FCaption   : string;
     FHint      : string;
     FOnExecute: TOnPluginExecute;
   protected
     function    GetDisplayName : string; override;
   public
     constructor Create(Collection : TCollection); override;
     destructor  Destroy; override;
     procedure   Assign(Source: TPersistent); override;
   published
     property    Caption   : string read FCaption write FCaption;
     property    Hint      : string read FHint write FHint;
     property    Name      : string read FName write FName;
     property    OnExecute : TOnPluginExecute read FOnExecute write FOnExecute;
   end;

   TpsvPluginActions = class(TCollection)
   private
     FOwner   : TPersistent;
     function    GetItem(Index: Integer): TpsvPluginAction;
     procedure   SetItem(Index: Integer; Value: TpsvPluginAction);
   protected
     function    GetOwner: TPersistent; override;
   public
     constructor Create(AOwner : TPersistent);
     function    Add: TpsvPluginAction;
     function    ActionByName(AName : string) : TpsvPluginAction;
     property    Items[Index: Integer]: TpsvPluginAction read GetItem write SetItem; default;
   end;

   TpsvPluginForm = class(TForm)
    private
     FBeforeExecute : TNotifyEvent;
     FAfterExecute  : TNotifyEvent;
     procedure WMUnloadPlugin(var Message : TMessage); message WM_UNLOADPLUGIN;
    protected
     procedure CreateParams(var Params : TCreateParams); override;
    public
     constructor Create(AOwner: TComponent); override;
     destructor  Destroy; override;
    published
     property BeforeExecute : TNotifyEvent  read FBeforeExecute write FBeforeExecute;
     property AfterExecute  : TNotifyEvent  read FAfterExecute  write FAfterExecute;
   end;

   TpsvPluginFormClass = class of TpsvPluginForm;


   TpsvPluginDataModule = class(TDataModule)
   public
     constructor Create(AOwner : TComponent); override;
     destructor  Destroy; override;
   end;


   TpsvPluginMainModule = class(TpsvPluginDataModule)
    private
      FAuthor          : string;
      FCopyright       : string;
      FDescription     : string;
      FPluginID        : string;
      FVersion         : string;
      FOnInitialize    : TNotifyEvent;
      FOnConfigure     : TNotifyEvent;
      FOnAboutInfo     : TNotifyEvent;
      FOnExecute       : TOnPluginExecute;
      FActions         : TpsvPluginActions;
    procedure SetActions(const Value: TpsvPluginActions);
   protected
      procedure Loaded; override;
   public
      Constructor Create(AOwner : TComponent); override;
      destructor  Destroy; override;
   published
      property Actions         : TpsvPluginActions read FActions write SetActions;
      property Version         : string read FVersion write FVersion;
      property Author          : String read FAuthor write FAuthor;
      property Description     : string read FDescription write FDescription;
      property Copyright       : string read FCopyright write FCopyright;
      property PluginID        : string read FPluginID write FPluginID;
      property OnInitialize    : TNotifyEvent read FOnInitialize  write FOnInitialize;
      property OnConfigure     : TNotifyEvent read FOnConfigure   write FOnConfigure;
      property OnAboutInfo     : TNotifyEvent read FOnAboutInfo   write FOnAboutInfo;
      property OnExecute       : TOnPluginExecute read FOnExecute write FOnExecute;
   end;

   TpsvPluginMainModuleClass = class of TpsvPluginMainModule;

   TpsvPluginApplication = class(TComponent)
   private
      FAppHandle       : THandle;
      FApplication     : TApplication;
      FScreen          : TScreen;
      FComponentClass  : TComponentClass;
      FFormList        : TList;
      FDataModules     : TList;
      FAuthor          : string;
      FCopyright       : string;
      FDescription     : string;
      FPluginID        : string;
      FOnInitialize    : TNotifyEvent;
      FOnConfigure     : TNotifyEvent;
      FOnAboutInfo     : TNotifyEvent;
      FOnExecute       : TOnPluginExecute;
      FVersion         : string;
      FClassList       : TStringList;
      FMainModule      : TpsvPluginMainModule;
      function   GetFormsCount : integer;
      function   GetForm(Index: Integer): TForm;
      procedure  OnExceptionHandler(Sender: TObject; E: Exception);
   protected
      procedure DoHandleException(E: Exception); dynamic;
      procedure DoAboutInfo(Sender : TObject);
      procedure DoPluginExecute(AName : string; AManager : TpsvPluginManager); virtual;
      procedure AddForm(AForm : TpsvPluginForm);
   public
      constructor Create(AOwner : TComponent); override;
      destructor  Destroy; override;
      procedure   CreateForm(InstanceClass: TComponentClass; var Reference); virtual;
      procedure   RegisterForm(AForm : TpsvPluginFormClass);
      procedure   Initialize; virtual;
      procedure   Run; virtual;
      procedure   Configure;  virtual;
      procedure   About; virtual;
      procedure   Init(HostApp : TApplication; AManager : TpsvPluginManager); virtual;
      procedure   Execute(AName : string; AManager : TpsvPluginManager); virtual;
      function    FormByName(AName : string) : TpsvPluginForm;
      function    GetAction(AName : string)  : TpsvPluginAction;
      procedure   ShowFormModal(AFormName : string; AManager : TpsvPluginManager); virtual;
      procedure   ShowForm(AFormName : string; AManager : TpsvPluginmanager); virtual;
      procedure   ShowChildForm(AFormName : string; AManager : TpsvPluginmanager); virtual;
      procedure   GetActionsList(AList : TStrings; AManager : TpsvPluginManager);
      procedure   GetFormList(AList : TStrings; AManager : TpsvPluginManager);
      property    FormsCount : integer read GetFormsCount;
      property    Form[index : integer] : TForm read GetForm;
      property    FormsList  : TList read FFormList;
      property    MainModule : TpsvPluginMainModule read FMainModule;
   published
      property Version         : string read FVersion write FVersion;
      property Author          : string read FAuthor write FAuthor;
      property Description     : string read FDescription write FDescription;
      property Copyright       : string read FCopyright write FCopyright;
      property PluginID        : string read FPluginID write FPluginID;
      property OnInitialize    : TNotifyEvent read FOnInitialize write FOnInitialize;
      property OnConfigure     : TNotifyEvent read FOnConfigure write FOnConfigure;
      property OnAboutInfo     : TNotifyEvent read FOnAboutInfo write FOnAboutInfo;
      property OnExecute       : TOnPluginExecute read FOnExecute write FOnExecute;
   end;



   TpsvPluginInfo = class
   public
     PluginName  : String;
     Handle      : THandle;
     ID          : string;
     Author      : string;
     Copyright   : string;
     Description : string;
     Version     : string;
     Application : TpsvPluginApplication;
   end;

   TOnCheckPluginSecurity = procedure (ASender : TObject; APluginInfo : TpsvPluginInfo; var Success : boolean) of object;

   TpsvPluginManager = class(TComponent)
   private
      FOnCheckSecurity  : TOnCheckPluginSecurity;
      FOnGetPluginsList : TOnGetPluginsList;
      FPlugins         : TList;
      FPluginFolder    : string;
      FOnBeforeLoad    : TNotifyEvent;
      FOnAfterLoad     : TNotifyEvent;
      FParams          : TParams;
      FExtension         : String;
      FApplicationHandle : THandle;
      FApplication       : TApplication;
      FScreen            : TScreen;
      procedure SetExtension(Value : String);
      procedure SetPluginFolder(Value : string);
      procedure SetParams(Value : TParams);
   protected
      procedure DoBeforeLoad; dynamic;
      procedure DoAfterLoad;  dynamic;
      procedure DoUnloadPlugin(Index : integer); virtual;
      function  GetApplicationHandle : THandle;
      function  GetApplication : TApplication;
      function  GetScreen : TScreen;
      function  GetPluginCount : integer;
   public
      CAtom : TAtom;
      constructor Create(AOwner : TComponent); override;
      destructor  Destroy; override;
      procedure   LoadPlugin(Filename : string); virtual;
      procedure   LoadPlugins; virtual;
      procedure   UnloadPlugin(PluginID : string); virtual;
      procedure   UnloadPlugins; virtual;
      procedure   Execute(PluginID : string; AName : string);
      procedure   ShowAboutBox(PluginID : string); virtual;
      procedure   Configure(PluginID : string); virtual;
      function    GetPluginInfo(PluginID : string) : TpsvPluginInfo;
      function    GetPluginNumber(PluginID : string) : integer;
      function    GetPluginByNumber(ANumber : integer) : TpsvPluginInfo;
      function    GetPluginID(ANumber : integer) : string;
      procedure   GetPluginActionNames(PluginID : string; AList : TStrings);
      procedure   GetPluginFormNames(PluginID : string; AList : TStrings);
      procedure   ShowForm(PluginID : string; FormName : string);
      procedure   ShowFormModal(PluginID : string; FormName : string);
      procedure   ShowChildForm(PluginID : string; FormName : string);
      property    ApplicationHandle : THandle read FApplicationHandle;
      property    MainApplication : TApplication read FApplication;
      property    MainScreen : TScreen read FScreen;
      property    PluginCount : integer read GetPluginCount;
   published
      property Extension    : String read FExtension write SetExtension;
      property OnBeforeLoad : TNotifyEvent read FOnBeforeLoad write FOnBeforeLoad;
      property OnAfterLoad  : TNotifyEvent read FOnAfterLoad  write FOnAfterLoad;
      property PluginFolder : string read FPluginFolder write SetPluginFolder;
      property Params       : TParams read FParams write SetParams;
      property OnGetPluginsList : TOnGetPluginsList read FOnGetPluginsList write FOnGetPluginsList;
      property OnCheckSecurity : TOnCheckPluginSecurity read FOnCheckSecurity write FOnCheckSecurity;
   end;


var
  Application: TpsvPluginApplication = nil;

function RegisterPSVPlugin : TpsvPluginApplication;


implementation

function BuildFileList(const Path: string; const Attr: Integer; const List: TStrings): Boolean;
var
  SearchRec: TSearchRec;
  R: Integer;
  idx : integer;
begin
  Assert(List <> nil);
  R := FindFirst(Path, Attr, SearchRec);
  Result := R = 0;
  try
    if Result then
    begin
      while R = 0 do
      begin
        if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') then
         begin
           idx := List.Add(SearchRec.Name);
           List.Objects[idx] := Pointer(SearchRec.Size);
         end;
        R := FindNext(SearchRec);
      end;
      Result := R = ERROR_NO_MORE_FILES;
    end;
  finally
    SysUtils.FindClose(SearchRec);
  end;
end;

constructor TpsvPluginApplication.Create(AOwner : TComponent);
begin
 inherited Create(AOwner);
 FFormList     := TList.Create;
 FDataModules  := TList.Create;
 FAuthor       := 'Serhiy Perevoznyk';
 FDescription  := 'PSV Plugin';
 FCopyright    := '(c) Serhiy Perevoznyk';
 FPluginID     := CreateClassID;
 FVersion      := '2.0';
 FClassList    := TStringList.Create;
end;

procedure TpsvPluginApplication.DoHandleException(E: Exception);
begin
end;

procedure TpsvPluginApplication.OnExceptionHandler(Sender: TObject; E: Exception);
begin
  DoHandleException(E);
end;


function  TpsvPluginApplication.FormByName(AName : string) : TpsvPluginForm;
var
 C : TpsvPluginFormClass;
 Instance : TComponent;
begin
  Result := nil;
  if FClassList.IndexOf(AName) > -1 then
   begin
     C := TpsvPluginFormClass(GetClass('T' + AName));
     Instance := TComponent(C.NewInstance);
     Result := TpsvPluginForm(Instance.Create(Forms.Application));
   end;
end;

procedure TpsvPluginApplication.Execute(AName : string; AManager : TpsvPluginManager);
var
    F : TpsvPluginForm;
    Action : TpsvPluginAction;
begin
  if not Assigned(AManager)then
    Exit;

  if Assigned(FOnExecute) then
   begin
     FOnExecute(Self, AManager, AName);
     Exit;
   end;

  Action := GetAction(AName);
  if Assigned(Action) then
   begin
     if Assigned(Action.FOnExecute) then
      Action.FOnExecute(Self, AManager, AName);
     Exit;
   end;

  Forms.Application.Handle := Amanager.ApplicationHandle;
  F := FormByName(AName);
  Forms.Application.Handle := FAppHandle;

  if Assigned(F.BeforeExecute) then
    F.BeforeExecute(Self);
    
  F.ShowModal;

  if Assigned(F.AfterExecute) then
      F.AfterExecute(Self);
end;

procedure TpsvPluginApplication.CreateForm(InstanceClass: TComponentClass;
  var Reference);
begin
  RegisterClass(InstanceClass);
  if InstanceClass.InheritsFrom(TpsvPluginForm) then
    RegisterForm(TpsvPluginFormClass(InstanceClass));
  if ( InstanceClass.InheritsFrom(TpsvPluginMainModule) and (FMainModule = nil) ) then
  begin
    if (FComponentClass = nil) or (FComponentClass <> InstanceClass) then
      FComponentClass := TComponentClass(InstanceClass);
    FMainModule := TpsvPluginMainModule(FComponentClass.Create(Self));
  end;
end;

destructor TpsvPluginApplication.Destroy;
begin
  while FFormList.Count > 0 do
   begin
     try
       TpsvPluginForm(FFormList[0]).Free;
     except
     end;
   end;

  while FDataModules.Count > 0 do
   begin
     try
       TpsvPluginDataModule(FDataModules[0]).Free;
     except
     end;
   end;

  FFormList.Free;
  FDataModules.Free;
  FClassList.Free;
  if Assigned(FApplication) then
   Forms.Application := FApplication;
  Forms.Application.OnException := nil;
  if Assigned(FScreen) then
   Forms.Screen := FScreen;
  inherited Destroy;
end;



procedure TpsvPluginApplication.Initialize;
begin
end;

function TpsvPluginApplication.GetFormsCount : integer;
begin
  Result := FFormList.Count;
end;

procedure TpsvPluginApplication.Init(HostApp : TApplication; AManager : TpsvPluginManager);
begin
  if FAppHandle = 0 then
    FAppHandle := Forms.Application.Handle;
  if Assigned(FOnInitialize) then
   FOnInitialize(Self);
end;



procedure TpsvPluginApplication.Configure;
begin
 if (assigned(FOnConfigure)) then
    FOnConfigure(Self);
end;


procedure TpsvPluginApplication.DoAboutInfo(Sender : TObject);
begin
  About;
end;

procedure TpsvPluginApplication.About;
var
 Wnd: HWnd;
 Icon: HIcon;
begin
 if assigned(FOnAboutInfo) then
   FOnAboutInfo(Self)
     else
       begin
         Wnd := 0;
         Icon := LoadIcon(0, IDI_APPLICATION);
         ShellAbout(Wnd, PChar(FDescription + '#'),
         PChar('Copyright '+ FCopyright), Icon);
       end;
end;


procedure TpsvPluginApplication.Run;
begin
  Forms.Application.OnException := OnExceptionHandler;
end;


function TpsvPluginApplication.GetForm(Index: Integer): TForm;
begin
  Result := TForm(FFormList.Items[Index]);
end;



destructor TpsvPluginForm.Destroy;
var
 idx : integer;
begin
  if Application.FFormList.Count > 0 then
   begin
     idx := Application.FFormList.IndexOf(Self);
     if idx > -1 then
       Application.FFormList.Delete(idx);
   end;
  inherited Destroy;
end;

constructor TpsvPluginDataModule.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  Application.FDataModules.Add(Self);
end;


destructor TpsvPluginDataModule.Destroy;
begin
  Application.FDataModules.Delete(Application.FDataModules.IndexOf(Self));
  inherited Destroy;
end;


procedure InitApplication;
begin
  Application := TpsvPluginApplication.Create(nil);
end;

procedure DoneApplication;
begin
  Forms.Application.Handle := Application.FAppHandle;
  Application.Free;
  Application := nil;
end;

function RegisterPSVPlugin : TpsvPluginApplication;
begin
  Result := Application;
end;


constructor TpsvPluginManager.Create(AOwner : TComponent);
var
 AtomText: array[0..31] of Char;
begin
   inherited ;
   StrFmt(AtomText, 'ControlOfs%.8X%.8X', [HInstance, GetCurrentThreadID]);
   CAtom:=GlobalFindAtom(AtomText);
   FExtension := 'psv';
   FParams := TParams.Create(Self);
   FPlugins := TList.Create;
end;



procedure TpsvPluginManager.ShowAboutBox(PluginID : string);
var
 PluginInfo : TpsvPluginInfo;
begin
  PluginInfo := GetPluginInfo(PluginID);
  if Assigned(PluginInfo) then
   PluginInfo.Application.About;
end;

procedure TpsvPluginManager.Configure;
var
 PluginInfo : TpsvPluginInfo;
begin
  PluginInfo := GetPluginInfo(PluginID);
  if Assigned(PluginInfo) then
   PluginInfo.Application.Configure;
end;


procedure TpsvPluginManager.SetExtension(Value : String);
begin
   if (FExtension <> Value) then
   begin
      if (length(Value) > 3) or (length(Value) < 1) then
         raise Exception.Create('Extension must be between 1 and 3 characters')
      else
         FExtension := Value;
   end;
end;


procedure TpsvPluginManager.DoBeforeLoad;
begin
   if Assigned(FOnBeforeLoad) then
      FOnBeforeLoad(Self);
end;

procedure TpsvPluginManager.DoAfterLoad;
begin
   if Assigned(FOnAfterLoad) then
      FOnAfterLoad(Self);
end;

procedure TpsvPluginManager.SetPluginFolder(Value : string);
begin
 if Value <> EmptyStr then
  begin
    if not DirectoryExists(Value) then
     Raise Exception.Create('Folder ' + Value + ' does not exists');
    FPluginFolder := IncludeTrailingBackslash(Value);
  end;
end;

type
  PluginRegProc = function : TpsvPluginApplication;

procedure TpsvPluginManager.LoadPlugin(Filename : string);
 var
  RegProc : PluginRegProc;
  PluginHandle : THandle;
  PluginApplication : TpsvPluginApplication;
  PluginInfo : TpsvPluginInfo;
  S : boolean;
begin
  DoBeforeLoad;

  PluginHandle := LoadLibrary(Pchar(IncludeTrailingBackSlash(FPluginFolder) + FileName));

  if PluginHandle = 0 then
    Raise Exception.Create('Error loading Plugin "' + Filename + '"');

  RegProc := PluginRegProc(GetProcAddress(PluginHandle, 'RegisterPSVPlugin'));
   if not Assigned(RegProc) then
      Raise Exception.Create('"' + Filename + '" is not a valid plugin');

  PluginApplication := RegProc;

  PluginApplication.Init(Forms.Application, Self);
  PluginInfo := TpsvPluginInfo.Create;
  PluginInfo.PluginName := FileName;
  PluginInfo.Handle := PluginHandle;
  PluginInfo.ID := PluginApplication.PluginID;
  PluginInfo.Author := PluginApplication.Author;
  PluginInfo.Description := PluginApplication.Description;
  PluginInfo.Copyright := PluginApplication.Copyright;
  PluginInfo.Version := PluginApplication.Version;
  PluginInfo.Application := PluginApplication;

  S := true;
  if Assigned(FOnCheckSecurity) then
   FOnCheckSecurity(Self, PluginInfo, S);

  FPlugins.Add(PluginInfo);

  if not S then
    UnloadPlugin(PluginInfo.ID)
      else
        DoAfterLoad;
end;


procedure TpsvPluginManager.Execute(PluginID : string; AName : string);
var
 PluginInfo : TpsvPluginInfo;
 App : TpsvPluginApplication;
begin
  FApplicationHandle := GetApplicationHandle;
  PluginInfo := GetPluginInfo(PluginID);
  if Assigned(PluginInfo) then
   begin
     App := PluginInfo.Application;
     if Assigned(App) then
      App.Execute(AName, Self);
   end;
end;

destructor TpsvPluginManager.Destroy;
begin
   UnloadPlugins;
   FPlugins.Free;
   FParams.Free;
   inherited Destroy;
end;


procedure TpsvPluginManager.SetParams(Value : TParams);
begin
  FParams.Assign(Value);
end;

Function Str2Real(S : string) : Real;
  var
    Code: Integer;
    SLen : Integer;
    R : real;
  begin
    SLen:=Length(S);
    while S[SLen] = ' ' do
      Dec(SLen);
    S:=Copy(S,1,SLen);
    Val(S, R, Code);
    if Code <> 0 then
        raise EConvertError.Create('Invalid number')
    else
      Str2Real := R;
end;


Function Real2Str(r:Real):String;
VAR
 s:String;
Begin
 STR(r:3:1,s);
 s:=Trim(s);
 Real2Str:=s;
End;

constructor TpsvPluginMainModule.Create(AOwner : TComponent);
begin
  FAuthor       := 'Perevoznyk';
  FDescription  := 'PSV Plugin';
  FCopyright    := DateToStr(Date)+' (c) Serhiy Perevoznyk' ;
  if (csDesigning in ComponentState) then
    FPluginID     := CreateClassID;
  FVersion      := '2.0';
  FActions := TpsvPluginActions.Create(Self);
  inherited;
end;

destructor TpsvPluginMainModule.Destroy;
begin
  FActions.Free;
  inherited;
end;

procedure TpsvPluginMainModule.Loaded;
begin
  inherited;
   if (csDesigning in ComponentState) then
    begin
      FVersion := Real2Str( Str2Real(FVersion) + 0.1);
      Application.Version := FVersion;
    end;

   if FDescription <> EmptyStr then
    Application.Description := FDescription;

   if FAuthor <> EmptyStr then
    Application.Author := FAuthor;

   if FCopyright <> EmptyStr then
     Application.Copyright := FCopyright;

   Application.PluginID := FPluginID;
   if Assigned(FOnInitialize) then
    Application.OnInitialize := FOnInitialize;
   if Assigned(FOnConfigure) then
    Application.OnConfigure := FOnConfigure;
   if Assigned(FOnAboutInfo) then
    Application.OnAboutInfo := FOnAboutInfo;
end;



procedure TpsvPluginForm.CreateParams(var Params: TCreateParams);
begin
  inherited;
 if (FormStyle <> fsMDIChild) then
  begin
    with Params do
     Style := Style or WS_POPUP;
  end;
end;

procedure TpsvPluginApplication.DoPluginExecute(AName: string; AManager : TpsvPluginManager);
begin

end;

procedure TpsvPluginApplication.ShowForm(AFormName: string; AManager : TpsvPluginmanager);
var
 F : TpsvPluginForm;
 C : TpsvPluginFormClass;
 Instance : TComponent;
begin
  if FClassList.IndexOf(AFormName) > -1 then
   begin
     C := TpsvPluginFormClass(GetClass('T' + AFormName));
     Instance := TComponent(C.NewInstance);
     Forms.Application.Handle := AManager.FApplicationHandle;
     F := TpsvPluginForm(Instance.Create(Forms.Application));
     F.Show;
     Forms.Application.Handle := FAppHandle;
   end;
end;

procedure TpsvPluginApplication.ShowFormModal(AFormName: string; AManager : TpsvPluginManager);
var
 F : TpsvPluginForm;
 C : TpsvPluginFormClass;
 Instance : TComponent;
begin
  if FClassList.IndexOf(AFormName) > -1 then
   begin
     C := TpsvPluginFormClass(GetClass('T' + AFormName));
     Instance := TComponent(C.NewInstance);
     Forms.Application.Handle := AManager.FApplicationHandle;
     F := TpsvPluginForm(Instance.Create(Forms.Application));
     Forms.Application.Handle := FAppHandle;
     F.ShowModal;
   end;
end;

{ TpsvPluginAction }

procedure TpsvPluginAction.Assign(Source: TPersistent);
begin
  if Source is TpsvPluginAction then
  begin
    FName    := TpsvPluginAction(Source).Name;
    FCaption := TpsvPluginAction(Source).Caption;
    FHint    := TpsvPluginAction(Source).Hint;
    Exit;
  end;
  inherited Assign(Source);
end;

constructor TpsvPluginAction.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FName   := DisplayName;
end;

destructor TpsvPluginAction.Destroy;
begin
  inherited;
end;

function TpsvPluginAction.GetDisplayName: string;
begin
  if FName = EmptyStr then
    Result := inherited GetDisplayName
      else
       Result := FName;
end;

{ TpsvPluginActions }

function TpsvPluginActions.ActionByName(AName: string): TpsvPluginAction;
var
 i : integer;
begin
  Result := nil;
  for i := 0 to Count - 1 do
   begin
     if SameText(AName, Items[i].Name) then
      begin
        Result := Items[i];
        break;
      end;
   end;
end;

function TpsvPluginActions.Add: TpsvPluginAction;
begin
  Result := TpsvPluginAction(inherited Add);
end;

constructor TpsvPluginActions.Create(AOwner: TPersistent);
begin
   inherited Create(TpsvPluginAction);
   FOwner := AOwner;
end;

function TpsvPluginActions.GetItem(Index: Integer): TpsvPluginAction;
begin
  Result := TpsvPluginAction(inherited GetItem(Index));
end;

function TpsvPluginActions.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

procedure TpsvPluginActions.SetItem(Index: Integer;
  Value: TpsvPluginAction);
begin
  inherited SetItem(Index, Value)
end;

procedure TpsvPluginMainModule.SetActions(const Value: TpsvPluginActions);
begin
  FActions.Assign(Value);
end;

function TpsvPluginManager.GetPluginInfo(
  PluginID: string): TpsvPluginInfo;
var
 i : integer;
begin
  Result := nil;
  for i := 0 to FPlugins.Count - 1 do
   begin
     if SameText(TpsvPluginInfo(FPlugins[i]).ID , PluginID) then
      begin
        Result := TpsvPluginInfo(FPlugins[i]);
        break;
      end;
   end;
end;


procedure TpsvPluginManager.LoadPlugins;
var
 AFileList : TStringList;
 i : integer;
begin
  AFileList := TStringList.Create;
  try
   if Assigned(FOnGetPluginsList) then
    FOnGetPluginsList(Self, AFileList)
     else
       begin
         if Trim(FPluginFolder) = '' then
          FPluginFolder := ExtractFilePath(ParamStr(0));
         BuildFileList(IncludeTrailingBackSlash(FPluginFolder) + '*.' + FExtension, faArchive, AFileList);
       end;
    for i := 0 to AFileList.Count - 1 do
     LoadPlugin(AFileList[i]);
   finally
     AFileList.Free;
   end;
end;


procedure TpsvPluginManager.UnloadPlugins;
var I : integer;
begin
  For I := 0 to FPlugins.Count -1 do
   DoUnloadPlugin(0);
end;

procedure TpsvPluginManager.UnloadPlugin(PluginID: string);
var
 I : integer;
begin
  I := GetPluginNumber(PluginID);
  if I >= 0 then
   begin
     DoUnloadPlugin(I);
   end;
end;

procedure TpsvPluginManager.DoUnloadPlugin(Index: integer);
var
 i : integer;
 L : TList;
begin
  L := TList.Create;
  try
   for i := 0 to Screen.FormCount - 1 do
    begin
      L.Add(Screen.Forms[i]);
    end;


   for i := 0 to L.Count - 1 do
    begin
      SendMessage(TForm(L[i]).Handle, WM_UNLOADPLUGIN, 0, 0);
    end;

  finally
    L.Free;
  end;
   
  try
   FreeLibrary(TpsvPluginInfo(FPlugins.Items[Index]).Handle);
  finally
   TpsvPluginInfo(FPlugins.Items[Index]).Application := nil;
   TpsvPluginInfo(FPlugins.Items[Index]).Free;
   FPlugins.Delete(Index);
  end;
end;

function TpsvPluginManager.GetPluginNumber(PluginID: string): integer;
var
 i : integer;
begin
  Result := -1;
  for i := 0 to FPlugins.Count - 1 do
   begin
     if SameText(TpsvPluginInfo(FPlugins[i]).ID , PluginID) then
      begin
        Result := i;
        break;
      end;
   end;
end;

function TpsvPluginManager.GetPluginByNumber(
  ANumber: integer): TpsvPluginInfo;
begin
  if FPlugins.Count > 0 then
  Result := TpsvPluginInfo(FPlugins[ANumber])
   else
     Result := nil;
end;

function TpsvPluginManager.GetPluginCount: integer;
begin
  Result := FPlugins.Count;
end;

function TpsvPluginApplication.GetAction(
  AName: string): TpsvPluginAction;
begin
  Result := nil;
  if Assigned(FMainModule) then
   Result := FMainModule.Actions.ActionByName(AName);
end;

procedure TpsvPluginApplication.RegisterForm(AForm: TpsvPluginFormClass);
var
 FormName : string;
begin
  RegisterClass(AForm);
  FormName := AForm.ClassName;
  if FormName[1] = 'T' then
   Delete(FormName, 1, 1);
  FClassList.Add(FormName);
end;

procedure TpsvPluginManager.GetPluginActionNames(PluginID : string; AList: TStrings);
var
 PluginInfo : TpsvPluginInfo;
 App : TpsvPluginApplication;
begin
  FApplicationHandle := GetApplicationHandle;
  PluginInfo := GetPluginInfo(PluginID);
  if Assigned(PluginInfo) then
   begin
     App := PluginInfo.Application;
     if Assigned(App) then
      App.GetActionsList(AList, Self);
   end;
end;

function TpsvPluginManager.GetPluginID(ANumber: integer): string;
var
 PluginInfo : TpsvPluginInfo;
begin
  PluginInfo := GetPluginByNumber(ANumber);
  if Assigned(PluginInfo) then
   Result := PluginInfo.ID
    else
      Result := '';
end;


function TpsvPluginManager.GetApplicationHandle: THandle;
begin
  Result := Forms.Application.Handle;
end;

procedure TpsvPluginManager.ShowForm(PluginID, FormName: string);
var
 PluginInfo : TpsvPluginInfo;
 App : TpsvPluginApplication;
begin
  FApplicationHandle := GetApplicationHandle;
  PluginInfo := GetPluginInfo(PluginID);
  if Assigned(PluginInfo) then
   begin
     App := PluginInfo.Application;
     if Assigned(App) then
      App.ShowForm(FormName, Self);
   end;
end;

procedure TpsvPluginManager.ShowFormModal(PluginID, FormName: string);
var
 PluginInfo : TpsvPluginInfo;
 App : TpsvPluginApplication;
begin
  FApplicationHandle := GetApplicationHandle;
  PluginInfo := GetPluginInfo(PluginID);
  if Assigned(PluginInfo) then
   begin
     App := PluginInfo.Application;
     if Assigned(App) then
      App.ShowFormModal(FormName, Self);
   end;
end;

procedure TpsvPluginApplication.ShowChildForm(AFormName: string;
  AManager: TpsvPluginmanager);
var
 F : TpsvPluginForm;
 C : TpsvPluginFormClass;
 Instance : TComponent;
begin
  if FClassList.IndexOf(AFormName) > -1 then
   begin
     C := TpsvPluginFormClass(GetClass('T' + AFormName));
     Instance := TComponent(C.NewInstance);
     if not Assigned(FApplication) then
       FApplication := Forms.Application;
     Forms.Application := AManager.MainApplication;
     if not Assigned(FScreen) then
       FScreen := Forms.Screen;
     Forms.Screen := AManager.MainScreen;
     F := TpsvPluginForm(Instance.Create(Forms.Application));
     SetProp(F.Handle, MakeIntAtom(AManager.CAtom), THandle(F));
   end;
end;

procedure TpsvPluginManager.ShowChildForm(PluginID, FormName: string);
var
 PluginInfo : TpsvPluginInfo;
 App : TpsvPluginApplication;
begin
  FApplicationHandle := GetApplicationHandle;
  FApplication := GetApplication;
  FScreen := GetScreen;
  PluginInfo := GetPluginInfo(PluginID);
  if Assigned(PluginInfo) then
   begin
     App := PluginInfo.Application;
     if Assigned(App) then
      App.ShowChildForm(FormName, Self);
   end;
end;



function TpsvPluginManager.GetApplication: TApplication;
begin
  Result := Forms.Application;
end;


procedure TpsvPluginApplication.AddForm(AForm: TpsvPluginForm);
begin
   FFormList.Add(AForm);
end;

constructor TpsvPluginForm.Create(AOwner: TComponent);
begin
  inherited;
  if FormStyle <> fsMDIChild then
  Application.AddForm(Self);
end;

function TpsvPluginManager.GetScreen: TScreen;
begin
  Result := Forms.Screen;
end;

procedure TpsvPluginForm.WMUnloadPlugin(var Message: TMessage);
begin
  if FormStyle = fsMDIChild then
   Self.Free;
end;

procedure TpsvPluginApplication.GetActionsList(AList: TStrings;
  AManager: TpsvPluginManager);
var
 i : integer;
begin
  if not Assigned(AList) then
   Exit;

  if not Assigned(Application.MainModule) then
   Exit;
  for i := 0 to Application.MainModule.Actions.Count - 1 do
   begin
     AList.Add(Application.MainModule.Actions[i].Name);
   end;
end;

procedure TpsvPluginApplication.GetFormList(AList: TStrings;
  AManager: TpsvPluginManager);
var
 I : integer;
 St : string;
begin
  if not Assigned(AList) then
   Exit;

  if not Assigned(MainModule) then
   Exit;

  for i := 0 to FClassList.Count - 1 do
   begin
     St := FClassList[i];
     AList.Add(St);
   end;
end;

procedure TpsvPluginManager.GetPluginFormNames(PluginID: string;
  AList: TStrings);
var
 PluginInfo : TpsvPluginInfo;
 App : TpsvPluginApplication;
begin
  FApplicationHandle := GetApplicationHandle;
  PluginInfo := GetPluginInfo(PluginID);
  if Assigned(PluginInfo) then
   begin
     App := PluginInfo.Application;
     if Assigned(App) then
      App.GetFormList(AList, Self);
   end;
end;

initialization
  InitApplication;

finalization
  DoneApplication;


end.

