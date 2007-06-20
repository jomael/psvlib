unit Unit1;

interface

uses
   Windows,
   Messages,
   SysUtils,
   Classes,
   Dialogs,
   Forms,
   psvPluginIntf;

type

  TpsvPluginMainModule1 = class(TpsvPluginMainModule)
    procedure psvPluginMainModule1Actions0Execute(Sender: TObject;
      AManager: TpsvPluginManager; AName: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
psvPluginMainModule1: TpsvPluginMainModule1;
implementation

{$R *.DFM}

procedure TpsvPluginMainModule1.psvPluginMainModule1Actions0Execute(
  Sender: TObject; AManager: TpsvPluginManager; AName: String);
begin
  ShowMessage('Action was executed');
end;

end.