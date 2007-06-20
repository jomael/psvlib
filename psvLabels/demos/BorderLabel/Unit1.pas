unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, psvBasiclbl, psvBorderLabel;

type
  TForm1 = class(TForm)
    Button1: TButton;
    psvBorderLabel1: TpsvBorderLabel;
    psvBorderLabel2: TpsvBorderLabel;
    psvBorderLabel3: TpsvBorderLabel;
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
