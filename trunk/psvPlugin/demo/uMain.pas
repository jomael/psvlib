unit uMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  psvPluginIntf, StdCtrls, ComCtrls, Menus;

type
  TForm1 = class(TForm)
    psvPluginManager1: TpsvPluginManager;
    ListView1: TListView;
    MainMenu1: TMainMenu;
    P1: TMenuItem;
    L1: TMenuItem;
    U1: TMenuItem;
    F1: TMenuItem;
    S1: TMenuItem;
    S2: TMenuItem;
    A1: TMenuItem;
    E1: TMenuItem;
    N1: TMenuItem;
    C1: TMenuItem;
    N2: TMenuItem;
    A2: TMenuItem;
    procedure L1Click(Sender: TObject);
    procedure U1Click(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure S2Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure A2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.L1Click(Sender: TObject);
var
 cnt : integer;
 Item : TListItem;
 Info : TpsvPluginInfo;
begin
  ListView1.Items.Clear;
  psvPluginManager1.UnloadPlugins;
  psvPluginManager1.LoadPlugins;
  for cnt := 0 to psvPluginManager1.PluginCount - 1 do
   begin
     Info := psvPluginManager1.GetPluginByNumber(cnt);
     Item := ListView1.Items.Add;
     Item.Caption :=  Info.Author;
     Item.SubItems.Add(Info.Copyright);
     Item.SubItems.Add(Info.Description);
     Item.SubItems.Add(Info.ID);
     Item.SubItems.Add(Info.Version);
     Item.SubItems.Add(Info.PluginName);
   end;
end;

procedure TForm1.U1Click(Sender: TObject);
begin
  psvPluginManager1.UnloadPlugins;
  ListView1.Items.Clear;
end;

procedure TForm1.ListView1DblClick(Sender: TObject);
var
 PluginNumber : integer;
begin
   if ListView1.Selected <> nil then
    begin
      PluginNumber := ListView1.Selected.Index;
      psvPluginManager1.ShowAboutBox(psvPluginManager1.GetPluginID(PluginNumber));
    end;
end;

procedure TForm1.S1Click(Sender: TObject);
var
 Info : TpsvPluginInfo;
begin
  Info := psvPluginManager1.GetPluginByNumber(0);
  if info <> nil then
  psvPluginManager1.ShowFormModal(psvPluginManager1.GetPluginID(0), 'PluginForm');
end;

procedure TForm1.S2Click(Sender: TObject);
var
 Info : TpsvPluginInfo;
begin
  Info := psvPluginManager1.GetPluginByNumber(0);
  if info <> nil then
  psvPluginManager1.ShowForm(psvPluginManager1.GetPluginID(0), 'PluginForm');
end;

procedure TForm1.E1Click(Sender: TObject);
var
 Info : TpsvPluginInfo;
begin
  Info := psvPluginManager1.GetPluginByNumber(0);
  if info <> nil then
  psvPluginManager1.Execute('{9DBB9C33-CF68-4868-A3FF-B65D844D3551}', 'MyAction');
end;

procedure TForm1.C1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.A2Click(Sender: TObject);
var
 SL : TStringList;
begin
  SL := TStringList.Create;
  psvPluginManager1.GetPluginFormNames('{9DBB9C33-CF68-4868-A3FF-B65D844D3551}', SL);
  ShowMessage(SL.Text);
  Sl.Free;
end;

end.
