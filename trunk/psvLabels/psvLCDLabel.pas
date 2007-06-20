{*******************************************************}
{                                                       }
{          psvLabels Delphi components Library          }
{                                                       }
{ Author:                                               }
{ Serhiy Perevoznyk                                     }
{ serge_perevoznyk@hotmail.com                          }
{ http://users.chello.be/ws36637/                       }
{                                                       }
{ Contributors:                                         }
{ Marchioni Valerian                                    }
{ http://www.electronic-design.be                       }
{                                                       }
{     Use, modification and distribution is allowed     }
{without limitation, warranty, or liability of any kind.}
{                                                       }
{*******************************************************}

unit psvLCDLabel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TpsvLCDLabel = class(TGraphicControl)
  private
    FBitmap  : TBitmap;
    FCaption : String;
    FColor : TColor;
    procedure SetCaption(const AValue : string);
    procedure SetColor(value : TColor);
  protected
   procedure SetName(const Value: TComponentName); override;

  public
    constructor Create(AOwner : TComponent); override;
    destructor  Destroy; override;
    procedure   Paint; override;
  published
    property Caption : string read FCaption write SetCaption;
    property Color : TColor read FColor write SetColor;
  end;

implementation

const DefaultColor = clRed;

{$R PSVFONT2.res}

{ TpsvLCDLabel }

procedure TpsvLCDLabel.SetColor(value: TColor);
var i,j:integer;
begin
  FBitmap.Handle := LoadBitmap(hInstance,'PSVFONT');
  Width := 32;
  Height := 20;
	for i:=0 to FBitmap.Width-1 do
  	for j:=0 to FBitmap.Height-1 do
    	if FBitmap.Canvas.Pixels[i, j]=DefaultColor
      	then FBitmap.Canvas.Pixels[i, j]:=value;
	FColor := value;
  Paint;
end;

constructor TpsvLCDLabel.Create(AOwner: TComponent);
begin
  inherited;
  FBitmap := TBitmap.Create;
  FBitmap.Handle := LoadBitmap(hInstance,'PSVFONT');
  Width := 32;
  Height := 20;
  ControlStyle := ControlStyle + [csSetCaption];
  FColor := DefaultColor;
end;

destructor TpsvLCDLabel.Destroy;
begin
  FBitmap.Free;
  inherited;
end;

procedure TpsvLCDLabel.Paint;
var I : integer;
    CH : char;
    k : integer;
    SrcRect, DstRect : TRect;
begin
  inherited;
  Width := 16*Length(FCaption);
  for i :=1 to Length(FCaption) do
   begin
     if FCaption[i] < ' ' then
      ch := ' ' else
       ch := FCaption[i];
     K := ord(ch) - 32;
     SrcRect := Rect(k*16 ,0, k*16 + 16,19);
     DstRect := Rect((i-1) * 16, 0, (i-1)*16 + 16 ,19);
     Canvas.CopyRect(DstRect, FBitmap.Canvas, SrcRect);
   end;
end;

procedure TpsvLCDLabel.SetCaption(const AValue: string);
begin
  if AValue <> FCaption then
   begin
    FCaption := UpperCase(AValue);
    Invalidate;
   end;
end;

procedure TpsvLCDLabel.SetName(const Value: TComponentName);
begin
  inherited;
  Caption := Value;
end;

end.
