//psv Plugin Library
{$E psv}

library DemoPlugin;
uses
  Sharemem,
  psvPluginIntf,
  Unit1 in 'Unit1.pas' {psvPluginMainModule1: TpsvPluginMainModule},
  Unit2 in 'Unit2.pas' {PluginForm},
  Unit3 in 'Unit3.pas' {psvPluginForm3},
  Unit4 in 'Unit4.pas' {psvPluginForm4};

{$R *.RES}
exports 
  RegisterpsvPlugin;

begin
  Application.Initialize;
  Application.CreateForm(TpsvPluginMainModule1, psvPluginMainModule1);
  Application.CreateForm(TPluginForm, PluginForm);
  Application.CreateForm(TpsvPluginForm3, psvPluginForm3);
  Application.CreateForm(TpsvPluginForm4, psvPluginForm4);
  Application.Run;
end.