{*******************************************************}
{                     PHP4Delphi                        }
{               PHP - Delphi interface                  }
{ Author:                                               }
{ Serhiy Perevoznyk                                     }
{ serge_perevoznyk@hotmail.com                          }
{ http://users.chello.be/ws36637                        }
{*******************************************************}

{ $Id: Unit1.pas,v 6.2 12/2006 delphi32 Exp $ }

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, php4delphi, StdCtrls, PHPCommon, PHPCustomLibrary, phpLibrary;

type
  TForm1 = class(TForm)
    PaintBox: TPaintBox;
    psvPHP: TpsvPHP;
    btnExecute: TButton;
    PHPEngine: TPHPEngine;
    PHPLibrary1: TPHPLibrary;
    procedure btnExecuteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure PaintBoxPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    B : TBitmap;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.btnExecuteClick(Sender: TObject);
var
  Script : TStringList;
  Steps, X, Y: integer;
  MinT, MaxT, DeltaT, T: double;
begin
  psvPHP.UseDelimiters := true;
  B.Canvas.Brush.Color := clWhite;
  B.Canvas.FillRect(B.Canvas.ClipRect);
  B.Canvas.Pen.Color := clSilver;
  B.Canvas.MoveTo(0, 256);
  B.Canvas.LineTo(512, 256);
  B.Canvas.MoveTo(256, 0);
  B.Canvas.LineTo(256, 512);
  B.Canvas.Pen.Color := clBlack;

  Script := TStringList.Create;
  Script.Add('$R1 = 90.0;');
  Script.Add('$R2 = 26.0;');
  Script.Add('$O =  70.0;');
  Script.Add('$X = ($R1+$R2)*cos($T) - ($R2+$O)*cos((($R1+$R2)/$R2)*$T) + 256;');
  Script.Add('$Y = ($R1+$R2)*sin($T) - ($R2+$O)*sin((($R1+$R2)/$R2)*$T) + 256;');

  MinT := StrToFloat(PHPEngine.Constants.Items[0].Value);
  MaxT := StrToFloat(PHPEngine.Constants.Items[1].Value);
  Steps := StrToInt(PHPEngine.Constants.Items[2].Value);
  DeltaT := (MaxT - MinT) / Steps;
  T := MinT;

  psvPHP.VariableByName('T').AsFloat := T;
  psvPHP.RunCode(Script);
  X := psvPHP.VariableByName('X').AsInteger;
  Y := psvPHP.VariableByName('Y').AsInteger;
  B.Canvas.MoveTo(X, Y);

  repeat
    T := T + DeltaT;
    psvPHP.VariableByName('T').AsFloat := T;
    psvPHP.RunCode(Script);
    X := psvPHP.VariableByName('X').AsInteger;
    Y := psvPHP.VariableByName('Y').AsInteger;
    B.Canvas.LineTo(X, Y);
    bitBlt(PaintBox.Canvas.Handle, 0, 0, PaintBox.Width, PaintBox.Height,
    B.Canvas.Handle, 0, 0, SRCCOPY);
    Application.ProcessMessages;
  until T >= MaxT;
  Script.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  PHPEngine.StartupEngine;
  B := TBitmap.Create;
  B.Width := Paintbox.Width;
  B.Height := PaintBox.Height;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  PHPEngine.ShutdownEngine;
  B.Free;
  B := nil;
end;

procedure TForm1.PaintBoxPaint(Sender: TObject);
begin
   bitBlt(PaintBox.Canvas.Handle, 0, 0, PaintBox.Width, PaintBox.Height,
   B.Canvas.Handle, 0, 0, SRCCOPY);
end;

end.
