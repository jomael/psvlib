program LibraryDemo;

uses
  Forms,
  Unit1 in 'Unit1.pas' {frmLibDemo};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmLibDemo, frmLibDemo);
  Application.Run;
end.
