unit Unit2;

interface

uses
   Windows,
   Messages,
   SysUtils,
   Classes,
   Dialogs,
   Forms,
   psvPluginIntf, Grids, DBGrids, StdCtrls, DBCtrls, ExtCtrls, Controls,
  Buttons;

type

  TPluginForm = class(TpsvPluginForm)
    Panel1: TPanel;
    ActivateBtn: TSpeedButton;
    Bevel1: TBevel;
    Navigator: TDBNavigator;
    EditBtn: TButton;
    Panel3: TPanel;
    CloseBtn: TButton;
    PartsGrid: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 var
   PluginForm: TPluginForm;
implementation

{$R *.DFM}

end.