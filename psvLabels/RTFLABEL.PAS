{*******************************************************}
{                                                       }
{          psvLabels Delphi components Library          }
{                                                       }
{ Author:                                               }
{ Serhiy Perevoznyk                                     }
{ serge_perevoznyk@hotmail.com                          }
{ http://users.chello.be/ws36637/                       }
{                                                       }
{     Use, modification and distribution is allowed     }
{without limitation, warranty, or liability of any kind.}
{                                                       }
{*******************************************************}

{$IFNDEF VER130}
{$WARN SYMBOL_DEPRECATED OFF}
{$WARN SYMBOL_PLATFORM OFF}
{$ENDIF}

unit RTFLabel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, RichEdit, ComCtrls;

type
  TpsvRTFLabel = class(TPaintBox)
  private
    { Private declarations }
    TakeNeed     : boolean;
    TempBmp      : TBitmap;
    FScrollPixels: integer;
    FWindowHandle: HWND;
    FLineNum     : Integer;
    FCounter     : integer;
    FActive      : boolean;
    AnimTimer    : TTimer;
    FRepetitions : integer;
    FText        : TStringList;
    FRichEdit    : TRichEdit;
    FTransparent : boolean;
    FBitmap      : TBitmap;
    procedure WMWindowPosChanged(var Message: TWMWindowPosChanged); message WM_WINDOWPOSCHANGED;
    procedure TextChanged(Sender : TObject);
    procedure SetRepetitions(const Value : integer);
    procedure SetText(const Value: TStringList);
    procedure SetActive(const Value : boolean);
    procedure SetInterval(Value : Integer);
    function  GetInterval : Integer;
    procedure WindProc(var Msg: TMessage);
    procedure SetTransparent(Value : boolean);
    procedure SizeCalculate;
    procedure SetWordWrap(Value : boolean);
    function  GetWordWrap : boolean;
    function  PrintToCanvas(FromChar, ToChar : integer) : Longint;
    procedure SetScrollPixels(Value : integer);
    procedure LoadToRTF;
  protected
    procedure TimerTick(Sender : TObject);
    procedure TakeImageBitmap;
  public
    { Public declarations }
    constructor Create(AOwner : TComponent); override;
    destructor  Destroy; override;
    procedure   Paint; override;
    function    PrintToBitmap(ABitmap : TBitmap) : Longint;
  published
    { Published declarations }
    property Active      : Boolean read FActive write SetActive  default false ;
    property Text        : TStringList read FText write SetText;
    property Interval    : Integer read GetInterval write SetInterval default 100;
    property Repetitions : integer read FRepetitions write SetRepetitions default 0;
    property Transparent : boolean read FTransparent write SetTransparent default true;
    property WordWrap    : boolean read GetWordWrap write SetWordWrap;
    property ScrollPixels: integer read FScrollPixels write SetScrollPixels default 1;
    property OnClick;
    property OnDblClick;
    property OnMouseDown;
    property OnMouseUp;
    property OnMouseMove;
    property Visible;
    property Action;
    property Align;
  end;


implementation

constructor TpsvRTFLabel.Create(AOwner: TComponent);
begin
  inherited;
  FWindowHandle := AllocateHWnd(WindProc);
  Canvas.Brush.Style := bsClear;
  Width   := 100;
  Height  := 100;
  FBitmap := TBitmap.Create;
  FBitmap.Transparent := True;
  FBitmap.Width  := Width;
  FBitmap.Height := Height;

  TempBmp   := TBitmap.Create;
  TempBmp.PixelFormat := pf24bit;
  TempBmp.Height := Height;
  TempBmp.Width := Width;

  FTransparent   := true;
  FText          := TStringList.Create;
  FText.OnChange := TextChanged;
  FRichEdit      := TRichEdit.Create(Self);
  FRichEdit.ParentWindow := FWindowHandle;
  FRichEdit.Visible := False;
  FRichedit.Width := 0;
  FRichedit.Height := 0;
  FRichEdit.WordWrap := False;
  FRichEdit.BorderStyle := bsNone;
  FRichEdit.PlainText := false;
  Canvas.Brush.Style := bsClear;
  AnimTimer:=TTimer.Create(Self);
  AnimTimer.Interval:= 100;
  AnimTimer.OnTimer:=TimerTick;
  AnimTimer.Enabled:=False;
  Active:=False;
  FRepetitions := 0;
  FCounter := 0;
  FScrollPixels := 1;
  FLineNum := 0;
  TakeNeed := False;
end;

destructor TpsvRTFLabel.Destroy;
begin
  AnimTimer.Enabled := False;
  AnimTimer.Free;
  Ftext.Free;
  FRichEdit.Free;
  FBitmap.Free;
  TempBmp.Free;
  DeallocateHWnd(FWindowHandle);
  inherited;
end;



procedure TpsvRTFLabel.SetScrollPixels(Value : integer);
begin
  if Value <> fScrollPixels then
    begin
      Active := False;
      FScrollPixels := Value;
    end;
end;


procedure TpsvRTFLabel.SizeCalculate;
var I, J, K : integer;
begin
  FBitmap.Width := Width;
  FBitmap.Height := height;
  I := 0;
  J := 0;
  K := FRichEdit.GetTextLen;
  if K = 0 then
     exit;
  while not (K <= J) do
    begin
      Inc(I);
      J := PrintToCanvas(J,-1);
    end;
  FBitmap.Canvas.Brush.Style := bsSolid;
  FBitmap.Canvas.FillRect(FBitmap.Canvas.ClipRect);

  if i = 1 then I := 2;
  FBitmap.Height := Height * I;

  FBitmap.Canvas.FillRect(FBitmap.Canvas.ClipRect);

end;


procedure TpsvRTFLabel.SetWordWrap(Value : boolean);
begin
  if Value <> WordWrap then
   begin
     Active := False;
     FRichEdit.WordWrap := Value;
   end;
end;

function TpsvRTFLabel.GetWordWrap : boolean;
begin
  Result := FRichEdit.WordWrap;
end;

procedure TpsvRTFLabel.SetTransparent(Value : boolean);
begin
  if Value <> FTransparent then
   begin
    FTransparent := Value;
    TakeNeed := true;
    invalidate;
  end;
end;

procedure TpsvRTFLabel.LoadToRTF;
 var Stream : TMemoryStream;
begin
  Stream := TmemoryStream.Create;
  Text.SaveToStream(Stream);
  Stream.Position := 0;
  FRichEdit.Lines.LoadFromStream(Stream);
  Stream.Free;
end;

procedure TpsvRTFLabel.SetActive(const Value : boolean);
begin
  FActive := Value;
  AnimTimer.Enabled:=Value;
  if not Value then FLineNum := 0
    else
       begin
        TakeNeed := true;
       end;
  Invalidate;
end;


procedure TpsvRTFLabel.SetRepetitions(const Value : integer);
begin
 if Value <> frepetitions then
  begin
    Active := False;
    FRepetitions := Value;
  end;
end;

procedure TpsvRTFLabel.SetInterval(Value : Integer);
begin
  AnimTimer.Interval:=Value;
  Invalidate;
end;

function TpsvRTFLabel.GetInterval : Integer;
begin
  Result:=AnimTimer.Interval;
end;

procedure TpsvRTFLabel.TimerTick(Sender : TObject);
begin
  if Assigned(FText) then
    begin
     Inc(FLineNum);

     if (FLineNum*FScrollPixels >= FBitmap.Height) then
      begin
       FLineNum:=0;
       if FRepetitions > 0 then
        begin
          inc(FCounter);
          if FCounter = FRepetitions then
            Active := False;
        end;
      end;

     Paint;
   end;

end;

function  TpsvRTFLabel.PrintToCanvas(FromChar, ToChar : integer) : Longint;
var
  range    : tformatrange;
begin
  if FBitmap.Height = 0 then
    raise Exception.Create('Cannot draw on empty bitmap');

  FillChar(Range, SizeOf(TFormatRange), 0);
  Range.hdc        := FBitmap.Canvas.handle;
  Range.hdcTarget  := FBitmap.Canvas.Handle;
  Range.rc.left    := 0;
  Range.rc.top     := 0;
  Range.rc.right   := FBitmap.Width * 1440 div Screen.PixelsPerInch;
  Range.rc.Bottom  := FBitmap.Height * 1440 div Screen.PixelsPerInch;
  Range.chrg.cpMax := ToChar;
  Range.chrg.cpMin := FromChar;
  Result := SendMessage(FRichedit.Handle, EM_FORMATRANGE, 1, Longint(@Range));
  SendMessage(FRichEdit.handle, EM_FORMATRANGE, 0,0);
end;

function  TpsvRTFLabel.PrintToBitmap(ABitmap : TBitmap) : Longint;
var
  range    : tformatrange;
begin
  FillChar(Range, SizeOf(TFormatRange), 0);
  Range.hdc        := ABitmap.Canvas.handle;
  Range.hdcTarget  := ABitmap.Canvas.Handle;
  Range.rc.left    := 0;
  Range.rc.top     := 0;
  Range.rc.right   := ABitmap.Width * 1440 div Screen.PixelsPerInch;
  Range.rc.Bottom  := ABitmap.Height * 1440 div Screen.PixelsPerInch;
  Range.chrg.cpMax := -1;
  Range.chrg.cpMin := 0;
  Result := SendMessage(FRichedit.Handle, EM_FORMATRANGE, 1, Longint(@Range));
  SendMessage(FRichEdit.handle, EM_FORMATRANGE, 0,0);
end;

procedure TpsvRTFLabel.Paint;
var
  ResBmp    : TBitmap;
  Dist      : integer;
begin

  if TakeNeed then
    begin
      TakeImageBitmap;
      LoadToRTF;
      SizeCalculate;
      printToCanvas(0,-1);
      TakeNeed := false;
    end;

  Canvas.CopyMode := cmSRCCOPY;

  ResBmp := TBitmap.Create;

   if FTransparent then
        ResBmp.Assign(TempBmp)
          else
            begin
              ResBmp.Width := Width;
              ResBmp.Height := Height;
              ResBmp.Canvas.Brush.Style := bsSolid;
              ResBmp.Canvas.Brush.Color := Color;
              ResBmp.Canvas.FillRect(resBmp.Canvas.ClipRect);
            end;

  Dist := FLineNum * ScrollPixels;

  if  ( not FActive) then
  BitBlt(ResBmp.Canvas.Handle, 0, 0, ResBmp.Width, ResBmp.Height,
     FBitmap.Canvas.Handle, 0, Dist, srcAND)

  else

  BitBlt(ResBmp.Canvas.Handle, 0, Canvas.ClipRect.Bottom - Dist, ResBmp.Width, ResBmp.Height + Dist,
    FBitmap.Canvas.Handle, 0, 0, srcAND);

  Canvas.Draw(0,0,resBmp);
   ResBmp.Free;

end;

procedure TpsvRTFLabel.SetText(const Value: TStringList);
begin
  if FActive then
    SetActive(False);
  FText.Assign(Value);
  TakeNeed := true;
  Invalidate;
end;


procedure TpsvRTFLabel.WindProc(var Msg: TMessage);
begin
 with msg do
  Result := DefWindowProc(FWindowHandle, Msg, wParam, lParam);
end;


procedure TpsvRTFLabel.TakeImageBitmap;
var
  DC: hDC;
  LPoint: Tpoint;
begin

  LPoint := ClientToScreen(point(Left,Top));
  TempBmp.Width := Width;
  TempBmp.Height := Height;
  DC := GetDC(0);
  BitBlt(TempBmp.Canvas.Handle, 0, 0,
         Width, Height, DC, LPoint.X - Left,LPoint.Y - Top, SrcCopy);
  ReleaseDC(0, DC);
end;


procedure TpsvRTFLabel.WMWindowPosChanged(var Message: TWMWindowPosChanged);
begin
 inherited;
 TakeNeed := true;
end;


procedure TpsvRTFLabel.TextChanged(Sender : TObject);
begin
  TakeNeed := true;
  Invalidate;
end;



end.
