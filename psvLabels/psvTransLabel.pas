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

unit psvTransLabel;

interface

uses
  Windows, Messages, Classes, Graphics, Controls, Forms, ExtCtrls,
  SysUtils, StdCtrls;

type
  TpsvTransLabel = class(TPaintBox)
  private
    FAlignment : TAlignment;
    FLayout: TTextLayout;
    FMist : boolean;
    FTransparency: byte;
    FWordWrap: Boolean;
    TempBmp : TBitmap;
    procedure SetWordWrap(Value: Boolean);
    procedure SetLayout(Value: TTextLayout);
    procedure SetAlignment(Value: TAlignment);
    procedure TakeImageBitmap;
    procedure SetTransparency(Value: byte);
    procedure DrawCaption;
    procedure SetMist(Value : boolean);
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
  public
    constructor Create(aOwner: TComponent); override;
    destructor  Destroy; override;
    procedure   Paint; override;
  published
    property Alignment: TAlignment read FAlignment write SetAlignment
      default taLeftJustify;
    property Transparency: byte read FTransparency write SetTransparency;
    property Caption;
    property Mist : boolean read FMist write SetMist default true;
    property Layout: TTextLayout read FLayout write SetLayout default tlTop;
    property WordWrap: Boolean read FWordWrap write SetWordWrap default False;
  end;



implementation

type
  PRGBArray = ^TRGBArray;
  TRGBArray = Array[word] of TRGBTriple;

constructor TpsvTransLabel.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  FTransparency := 60;
  Color     := clGreen;
  TempBmp   := TBitmap.Create;
  TempBmp.PixelFormat := pf24bit;
  TempBmp.Height := Height;
  TempBmp.Width := Width;
  FMist := True;
  FAlignment := taLeftJustify;
  FWordWrap := False;
  FLayout := tlTop;
end;

destructor TpsvTransLabel.Destroy;
begin
  TempBmp.Free;
  inherited Destroy;
end;


procedure TpsvTransLabel.Paint;
begin
  inherited Paint;
   TakeImageBitmap;
   BitBlt(Canvas.Handle, 0, 0, Width, Height,
          TempBmp.Canvas.Handle, 0,0, SrcCopy);
end;

procedure TpsvTransLabel.DrawCaption;
const
  Alignments: array[TAlignment] of Word = (DT_LEFT, DT_RIGHT, DT_CENTER);
  WordWraps: array[Boolean] of Word = (0, DT_WORDBREAK);
var
  OldBkMode : integer;
  Flag : LongInt;
  R : TRect;
  CalcRect : TRect;
begin
  Flag := DT_NOPREFIX or DT_EXPANDTABS or WordWraps[FWordWrap] or Alignments[FAlignment];
  Flag := DrawTextBiDiModeFlags(Flag);

  R := ClientRect;
  if FLayout <> tlTop then
    begin
      CalcRect := R;
      DrawText(TempBmp.Canvas.Handle,PChar(Caption),Length(Caption),CalcRect, Flag or DT_CALCRECT);
      if FLayout = tlBottom then OffsetRect(R, 0, Height - CalcRect.Bottom)
      else OffsetRect(R, 0, (Height - CalcRect.Bottom) div 2);
    end;


  TempBmp.Canvas.Font.Assign(Font);

  OldBkMode := SetBkMode(TempBmp.Canvas.Handle,
                         TRANSPARENT);
  DrawText(TempBmp.Canvas.Handle,PChar(Caption),Length(Caption),R,flag);
  SetBkMode(TempBmp.Canvas.Handle,
            OldBkMode);
end;



procedure TpsvTransLabel.TakeImageBitmap;
var
  DC: hDC;
  SL: PRGBArray;
  X, Y: Integer;
  LPoint: Tpoint;
  RVal,
  GVal,
  BVal : byte;
  TR,
  TG,
  TB   : integer;
begin

  LPoint := ClientToScreen(point(Left,Top));
  TempBmp.Width := Width;
  TempBmp.Height := Height;
  DC := GetDC(0);
  BitBlt(TempBmp.Canvas.Handle, 0, 0,
         Width, Height, DC, LPoint.X - Left,LPoint.Y - Top, SrcCopy);
  ReleaseDC(0, DC);

  if FMist then
    DrawCaption;
  RVal := GetRValue(Color);
  GVal := GetGValue(Color);
  BVal := GetBValue(Color);


  TR   := (100-FTransparency) * RVal;
  TG   := (100-FTransparency) * GVal;
  TB   := (100-FTransparency) * BVal;

  for Y := 0 to Height - 1 do
   begin
    SL := TempBmp.ScanLine[Y];
    for X := 0 to Width - 1 do
     begin
      try
       SL[X].rgbtRed := (FTransparency * SL[X].rgbtRed + TR) div 100;
       SL[X].rgbtGreen := (FTransparency * SL[X].rgbtGreen + TG) div 100;
       SL[X].rgbtBlue := (FTransparency * SL[X].rgbtBlue + TB) div 100;
      except
      end;
     end
   end;

   if (not FMist) then
     DrawCaption;
end;

procedure TpsvTransLabel.SetTransparency(Value: byte);
begin
  if FTransparency <> Value then
   begin
    if Value > 100 then
     Raise Exception.Create('Value must be between 0 and 100');
    FTransparency := Value;
    Invalidate;
   end;
end;


procedure TpsvTransLabel.SetMist(Value : boolean);
begin
 if Value <> FMist then
  begin
   FMist := Value;
   Invalidate;
  end;
end;

procedure TpsvTransLabel.CMTextChanged(var Message: TMessage);
begin
  Invalidate;
end;

procedure TpsvTransLabel.SetAlignment(Value: TAlignment);
begin
  if FAlignment <> Value then
  begin
    FAlignment := Value;
    Invalidate;
  end;
end;


procedure TpsvTransLabel.SetLayout(Value: TTextLayout);
begin
  if FLayout <> Value then
  begin
    FLayout := Value;
    Invalidate;
  end;
end;

procedure TpsvTransLabel.SetWordWrap(Value: Boolean);
begin
  if FWordWrap <> Value then
  begin
    FWordWrap := Value;
    Invalidate;
  end;
end;

end.
