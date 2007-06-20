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
unit psvBorderLabel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, psvBasiclbl;

type
  TpsvBorderStyle = (bsNone, bsRaised, bsLowered );

  TpsvBorderLabel = class(TpsvBasicLabel)
  private
   Color1  : TColor;
   Color2  : TColor;
   Temp    : TColor;
   FBorder : TpsvBorderStyle;
   procedure SetBorderStyle(Value : TpsvBorderStyle);
   procedure WMPaint( var Msg: TWMPaint ); message wm_Paint;
   procedure DrawBorderRect(const R : TRect);
  protected
    procedure DoDrawText(var Rect: TRect; Flags: Longint); override;
     procedure AdjustBounds; override;
  public
    constructor Create( AOwner: TComponent ); override;
  published
    property Border : TpsvBorderStyle read FBorder write SetBorderStyle default bsNone;
  end;


implementation

{ TpsvBorderLabel }

procedure TpsvBorderLabel.DrawBorderRect(const R: TRect);
begin
  Canvas.Pen.Color := Color1;
  Canvas.PolyLine([Point(R.Left, R.Bottom), Point(R.Left, R.Top),Point(R.Right, R.Top)]);
  Canvas.Pen.Color := Color2;
  Canvas.PolyLine([Point(R.Right, R.Top), Point(R.Right, R.Bottom), Point(R.Left, R.Bottom)]);
end;

constructor TpsvBorderLabel.Create(AOwner: TComponent);
begin
  inherited;
  FBorder := bsNone;
end;

procedure TpsvBorderLabel.SetBorderStyle(Value: TpsvBorderStyle);
begin
  if Value <> FBorder then
  begin
    FBorder := Value;
    Invalidate;
  end;
end;

procedure TpsvBorderLabel.WMPaint(var Msg: TWMPaint);
begin
  inherited;
  if FBorder <> bsNone then
  begin
    if FBorder = bsLowered then
     begin
       Color1 := clBtnShadow;
       Color2 := clBtnHighlight;
     end
       else
          begin
            Color1 := clBtnHighlight;
            Color2 := clBtnShadow;
          end;

    case FBorder of
      bsLowered: DrawBorderRect(Rect( 0, 0, Width-1, Height-1));
      bsRaised:  begin
                   Temp := Color1;
                   Color1 := Color2;
                   DrawBorderRect(Rect(1, 1, Width - 1, Height - 1));
                   Color2 := Temp;
                   Color1 := Temp;
                   DrawBorderRect(Rect(0, 0, Width - 2, Height - 2));
                end;
      else
        begin
          Canvas.Brush.Style := bsClear;
          Canvas.Pen.Color := Color;
          Canvas.Rectangle( 0, 0, Width, Height );
        end;
      end;
  end;

end;



procedure TpsvBorderLabel.AdjustBounds;
const
  WordWraps: array[Boolean] of Word = (0, DT_WORDBREAK);
var
  DC: HDC;
  X: Integer;
  Rect: TRect;
  AAlignment: TAlignment;
begin
  if not (csReading in ComponentState) and AutoSize then
  begin
    Rect := ClientRect;
    DC := GetDC(0);
    Canvas.Handle := DC;
    DoDrawText(Rect, (DT_EXPANDTABS or DT_CALCRECT) or WordWraps[WordWrap]);
    Canvas.Handle := 0;
    ReleaseDC(0, DC);
    X := Left;
    AAlignment := Alignment;
    if UseRightToLeftAlignment then ChangeBiDiModeAlignment(AAlignment);
    if AAlignment = taRightJustify then Inc(X, Width - Rect.Right);
    SetBounds(X, Top, Rect.Right+4, Rect.Bottom+4);
  end;
end;



procedure TpsvBorderLabel.DoDrawText(var Rect: TRect; Flags: Longint);
var
  Text: string;
begin
  Text := GetLabelText;
  OffsetRect(Rect, 2, 2);
  if (Flags and DT_CALCRECT <> 0) and ((Text = '') or ShowAccelChar and
    (Text[1] = '&') and (Text[2] = #0)) then Text := Text + ' ';
  if not ShowAccelChar then Flags := Flags or DT_NOPREFIX;
  Flags := DrawTextBiDiModeFlags(Flags);
  Canvas.Font := Font;
  if not Enabled then
  begin
    OffsetRect(Rect, 1, 1);
    Canvas.Font.Color := clBtnHighlight;
    DrawText(Canvas.Handle, PChar(Text), Length(Text), Rect, Flags);
    OffsetRect(Rect, -1, -1);
    Canvas.Font.Color := clBtnShadow;
    DrawText(Canvas.Handle, PChar(Text), Length(Text), Rect, Flags);
  end
  else
    DrawText(Canvas.Handle, PChar(Text), Length(Text), Rect, Flags);
end;

end.
