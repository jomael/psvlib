{*******************************************************}
{                                                       }
{          psvLabels Delphi components Library          }
{            PeopleWare, Belgium, 2001,2002             }
{                   www.peopleware.be                   }
{                                                       }
{ Author:                                               }
{ Serhiy Perevoznyk                                     }
{ Serhiy_Perevoznyk@peopleware.be                       }
{                                                       }
{     Use, modification and distribution is allowed     }
{without limitation, warranty, or liability of any kind.}
{                                                       }
{ Visit our site www.peopleware.be and download more    }
{            freeware Delphi components                 }
{*******************************************************}

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, psvTransLabel, RxGIF;

type
  TForm1 = class(TForm)
    Image1: TImage;
    psvTransLabel1: TpsvTransLabel;
    psvTransLabel2: TpsvTransLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Close;
end;

end.
