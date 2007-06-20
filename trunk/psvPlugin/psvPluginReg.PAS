{*****************************************************************************
  Name           : psvPluginReg
  Author         : Perevoznyk Serhiy
  Description    : psvPlugin Registration and Experts
  History        :

  Date         By                   Description
  ----         --                   -----------
  22-07-2004      Perevoznyk Serhiy     Initial creation of the Unit.
 *****************************************************************************}
{$I psvPlugin.Inc}

Unit psvPluginReg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs,psvPluginIntf,
  {$IFDEF VERSION6}
  DesignIntf,
  DesignEditors,
  DMForm,
  {$ELSE}
  dsgnintf,
  dmdesigner,
  {$ENDIF}
  ShlObj, ToolsAPI;


const CRLF = #13#10;

type

  TPluginFolderProperty = class(TStringProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;


  TPluginExpert =  class(TNotifierObject, IOTAWizard, IOTARepositoryWizard, IOTAFormWizard)
  public
    // IOTAWizard
    function GetIDString: string;
    function GetName: string;
    function GetState: TWizardState;
    procedure Execute;
    // IOTARepositoryWizard
    function GetAuthor: string;
    function GetComment: string;
    function GetPage: string;
    {$IFDEF VERSION6}
    function GetGlyph : cardinal;
    {$ELSE}
    function GetGlyph: HICON;
    {$ENDIF}
  end;

  TPluginFormExpert =  class(TNotifierObject, IOTAWizard, IOTARepositoryWizard, IOTAFormWizard)
  public
    // IOTAWizard
    function GetIDString: string;
    function GetName: string;
    function GetState: TWizardState;
    procedure Execute;
    // IOTARepositoryWizard
    function GetAuthor: string;
    function GetComment: string;
    function GetPage: string;
    {$IFDEF VERSION6}
    function GetGlyph : cardinal;
    {$ELSE}
    function GetGlyph: HICON;
    {$ENDIF}
  end;


  TPluginDataModuleExpert =  class(TNotifierObject, IOTAWizard, IOTARepositoryWizard, IOTAFormWizard)
  public
    // IOTAWizard
    function GetIDString: string;
    function GetName: string;
    function GetState: TWizardState;
    procedure Execute;
    // IOTARepositoryWizard
    function GetAuthor: string;
    function GetComment: string;
    function GetPage: string;
    {$IFDEF VERSION6}
    function GetGlyph : cardinal;
    {$ELSE}
    function GetGlyph: HICON;
    {$ENDIF}
  end;

  TPluginProjectCreator = class(TInterfacedObject, IOTACreator, IOTAProjectCreator)
  public
    // IOTACreator
    function GetCreatorType: string;
    function GetExisting: Boolean;
    function GetFileSystem: string;
    function GetOwner: IOTAModule;
    function GetUnnamed: Boolean;
    // IOTAProjectCreator
    function GetFileName: string;
    function GetOptionFileName: string;
    function GetShowSource: Boolean;
    procedure NewDefaultModule;
    function NewOptionSource(const ProjectName: string): IOTAFile;
    procedure NewProjectResource(const Project: IOTAProject);
    function NewProjectSource(const ProjectName: string): IOTAFile;
  end;

  TPluginProjectSourceFile = class(TInterfacedObject, IOTAFile)
  private
    FSource: string;
    FProjectName : string;
  public
    function GetSource: string;
    function GetAge: TDateTime;
    constructor Create(const Source: string);
    constructor CreateNamedProject(AProjectName : string);
  end;


  TpsvSourceFile = class(TInterfacedObject, IOTAFile)
  private
    FSource: string;
  public
    function GetSource: string;
    function GetAge: TDateTime;
    constructor Create(const Source: string);
  end;

  TpsvDataModuleCreator = class(TInterfacedObject, IOTACreator, IOTAModuleCreator)
  public
    // IOTACreator
    function GetCreatorType: string;
    function GetExisting: Boolean;
    function GetFileSystem: string;
    function GetOwner: IOTAModule;
    function GetUnnamed: Boolean;
    // IOTAModuleCreator
    function GetAncestorName: string; virtual;
    function GetImplFileName: string;
    function GetIntfFileName: string;
    function GetFormName: string;
    function GetMainForm: Boolean;
    function GetShowForm: Boolean;
    function GetShowSource: Boolean;
    function NewFormFile(const FormIdent, AncestorIdent: string): IOTAFile;
    function NewImplSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile; virtual;
    function NewIntfSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
    procedure FormCreated(const FormEditor: IOTAFormEditor);
  end;

  TpsvMainModuleCreator = class(TpsvDataModuleCreator, IOTACreator, IOTAModuleCreator)
  public
    function GetAncestorName: string; override;
    function NewImplSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile; override;
  end;


  TpsvModuleCreator = class(TpsvDataModuleCreator, IOTACreator, IOTAModuleCreator)
  public
    function GetAncestorName: string; override;
    function NewImplSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile; override;
  end;

Procedure Register;

implementation

{$R psvPluginReg.RES}

{ TPluginFolderProperty }


Procedure Register;
begin
  RegisterComponents('Plugins',[TpsvPluginManager]);
  RegisterPropertyEditor(TypeInfo(String), TpsvPluginManager, 'PluginFolder',   TPluginFolderProperty);
  RegisterPackageWizard(TPluginFormExpert.Create);
  RegisterPackageWizard(TPluginDataModuleExpert.Create);
  RegisterPackageWizard(TPluginExpert.Create);
end;

function GetActiveProjectGroup: IOTAProjectGroup;
var
  ModuleServices: IOTAModuleServices;
  i: Integer;

begin
  Result := nil;
  ModuleServices := BorlandIDEServices as IOTAModuleServices;
  for i := 0 to ModuleServices.ModuleCount - 1 do
    if Succeeded(ModuleServices.Modules[i].QueryInterface(IOTAProjectGroup, Result)) then
      Break;
end;

procedure TPluginFolderProperty.Edit;
var
  BrowseInfo: TBrowseInfo;
  ItemIDList: PItemIDList;
  ItemSelected : PItemIDList;
  NameBuffer: array[0..MAX_PATH] of Char;
  WindowList: Pointer;
begin
  itemIDList := nil;
  FillChar(BrowseInfo, SizeOf(BrowseInfo), 0);
  BrowseInfo.hwndOwner := 0;
  BrowseInfo.pidlRoot := ItemIDList;
  BrowseInfo.pszDisplayName := NameBuffer;
  BrowseInfo.lpszTitle := 'Select folder';
  BrowseInfo.ulFlags := BIF_RETURNONLYFSDIRS;
  WindowList := DisableTaskWindows(0);
  try
    ItemSelected := SHBrowseForFolder(BrowseInfo);
  finally
    EnableTaskWindows(WindowList);
  end;
  if (ItemSelected <> nil) then
   begin
    SHGetPathFromIDList(ItemSelected,NameBuffer);
    SetValue(NameBuffer);
   end;
end;

function TPluginFolderProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog];
end;


///



procedure RegisterContainerModule;
begin
  RegisterCustomModule(TpsvPluginForm, TCustomModule);
  {$IFDEF VERSION5ONLY}
  RegisterCustomModule(TpsvPluginMainModule, TDataModuleDesignerCustomModule);
  RegisterCustomModule(TpsvPluginDataModule,TDataModuleDesignerCustomModule);
  {$ELSE}
  RegisterCustomModule(TpsvPluginMainModule, TDataModuleCustomModule);
  RegisterCustomModule(TpsvPluginDataModule, TDataModuleCustomModule);
  {$ENDIF}

end;



{ TpsvSourceFile }

constructor TpsvSourceFile.Create(const Source: string);
begin
  FSource := Source;
end;

function TpsvSourceFile.GetAge: TDateTime;
begin
  Result := -1;
end;

function TpsvSourceFile.GetSource: string;
begin
  Result := FSource;
end;

{ TpsvDataModuleCreator }

procedure TpsvDataModuleCreator.FormCreated(
  const FormEditor: IOTAFormEditor);
begin
//
end;

function TpsvDataModuleCreator.GetAncestorName: string;
begin
   Result := 'psvPluginDataModule';
end;

function TpsvDataModuleCreator.GetCreatorType: string;
begin
  Result := sForm;
end;

function TpsvDataModuleCreator.GetExisting: Boolean;
begin
  Result := False;
end;

function TpsvDataModuleCreator.GetFileSystem: string;
begin
  Result := '';
end;

function TpsvDataModuleCreator.GetFormName: string;
begin
  Result := '';
end;

function TpsvDataModuleCreator.GetImplFileName: string;
begin
  Result := '';
end;

function TpsvDataModuleCreator.GetIntfFileName: string;
begin
  Result := '';
end;

function TpsvDataModuleCreator.GetMainForm: Boolean;
begin
  Result := False;
end;

function TpsvDataModuleCreator.GetOwner: IOTAModule;
var
  ModuleServices: IOTAModuleServices;
  Module: IOTAModule;
  NewModule: IOTAModule;
begin
  // You may prefer to return the project group's ActiveProject instead
  Result := nil;
  ModuleServices := (BorlandIDEServices as IOTAModuleServices);
  Module := ModuleServices.CurrentModule;

  if Module <> nil then
  begin
    if Module.QueryInterface(IOTAProject, NewModule) = S_OK then
      Result := NewModule

    {$IFDEF VER130} // Delphi 5
    else if Module.GetOwnerCount > 0 then
    begin
      NewModule := Module.GetOwner(0);
    {$ELSE not VER_140} // Delphi 6+
    else if Module.OwnerModuleCount > 0 then
    begin
      NewModule := Module.OwnerModules[0];
    {$ENDIF}
      if NewModule <> nil then
        if NewModule.QueryInterface(IOTAProject, Result) <> S_OK then
          Result := nil;
    end;
  end;
end;

function TpsvDataModuleCreator.GetShowForm: Boolean;
begin
  Result := True;
end;

function TpsvDataModuleCreator.GetShowSource: Boolean;
begin
  Result := True;
end;

function TpsvDataModuleCreator.GetUnnamed: Boolean;
begin
  Result := True;
end;

function TpsvDataModuleCreator.NewFormFile(const FormIdent,
  AncestorIdent: string): IOTAFile;
begin
  Result := nil;
end;

function TpsvDataModuleCreator.NewImplSource(const ModuleIdent, FormIdent,
  AncestorIdent: string): IOTAFile;
var
   Form,
   Ancestor : string;
   st : string;
begin
   st := '';
   Form := FormIdent;
   Ancestor := AncestorIdent;
   st := 'unit ' + ModuleIdent + ';' + CRLF + CRLF +
             'interface' + CRLF + CRLF +
             'uses' + CRLF +
             '   Windows,'  + CRLF +
             '   Messages,' + CRLF +
             '   SysUtils,' + CRLF +
             '   Classes,'  + CRLF +
             '   Dialogs,'  + CRLF +
             '   Forms,'    + CRLF +
             '   psvPluginIntf;' + CRLF + CRLF +
             'type' + CRLF + CRLF +
             '  T' + Form + ' = class(T' + Ancestor + ')' + CRLF +
             '  private' + CRLF +
             '    { Private declarations }' + CRLF +
             '  public' + CRLF +
             '    { Public declarations }' + CRLF +
             '  end;' + CRLF + CRLF +
             ' var' + CRLF +
             Form + ': T' + Form + ';'+ CRLF +
             'implementation'                                        + CRLF + CRLF +
             '{$R *.DFM}'                                            + CRLF + CRLF +
             'end.';

   Result := TpsvSourceFile.Create(St);
end;

function TpsvDataModuleCreator.NewIntfSource(const ModuleIdent, FormIdent,
  AncestorIdent: string): IOTAFile;
begin
  Result := nil;
end;

{ TpsvMainModuleCreator }

function TpsvMainModuleCreator.GetAncestorName: string;
begin
   Result := 'psvPluginMainModule';
end;

function TpsvMainModuleCreator.NewImplSource(const ModuleIdent, FormIdent,
  AncestorIdent: string): IOTAFile;
var
   Form,
   Ancestor : string;
   st : string;
begin
   Form := FormIdent;
   Ancestor := AncestorIdent;
   st := 'unit ' + ModuleIdent + ';' + CRLF + CRLF +
             'interface' + CRLF + CRLF +
             'uses' + CRLF +
             '   Windows,'  + CRLF +
             '   Messages,' + CRLF +
             '   SysUtils,' + CRLF +
             '   Classes,'  + CRLF +
             '   Dialogs,'  + CRLF +
             '   Forms,'    + CRLF +
             '   psvPluginIntf;' + CRLF + CRLF +
             'type' + CRLF + CRLF +
             '  T' + Form + ' = class(T' + Ancestor + ')' + CRLF +
             '  private' + CRLF +
             '    { Private declarations }' + CRLF +
             '  public' + CRLF +
             '    { Public declarations }' + CRLF +
             '  end;' + CRLF + CRLF +
             'var' + CRLF +
             Form + ': T' + Form + ';'+ CRLF +
             'implementation'                                        + CRLF + CRLF +
             '{$R *.DFM}'                                            + CRLF + CRLF +
             'end.';

   Result := TpsvSourceFile.Create(St);
end;

{ TpsvModuleCreator }

function TpsvModuleCreator.GetAncestorName: string;
begin
   Result := 'psvPluginForm';
end;

function TpsvModuleCreator.NewImplSource(const ModuleIdent, FormIdent,
  AncestorIdent: string): IOTAFile;
var
   Form,
   Ancestor : string;
   st : string;
begin
   Form := FormIdent;
   Ancestor := AncestorIdent;
   st := 'unit ' + ModuleIdent + ';' + CRLF + CRLF +
             'interface' + CRLF + CRLF +
             'uses' + CRLF +
             '   Windows,'  + CRLF +
             '   Messages,' + CRLF +
             '   SysUtils,' + CRLF +
             '   Classes,'  + CRLF +
             '   Dialogs,'  + CRLF +
             '   Forms,'    + CRLF +
             '   psvPluginIntf;' + CRLF + CRLF +
             'type' + CRLF + CRLF +
             '  T' + Form + ' = class(T' + Ancestor + ')' + CRLF +
             '  private' + CRLF +
             '    { Private declarations }' + CRLF +
             '  public' + CRLF +
             '    { Public declarations }' + CRLF +
             '  end;' + CRLF + CRLF +
             ' var' + CRLF +
             '   '+ Form + ': T' + Form + ';'+ CRLF +
             'implementation'                                        + CRLF + CRLF +
             '{$R *.DFM}'                                            + CRLF + CRLF +
             'end.';
   Result := TpsvSourceFile.Create(St);
end;

{ TPluginExpert }

procedure TPluginExpert.Execute;
begin
  (BorlandIDEServices as IOTAModuleServices).CreateModule(TPluginProjectCreator.Create);
  (BorlandIDEServices as IOTAModuleServices).CreateModule(TpsvMainModuleCreator.Create);
  (BorlandIDEServices as IOTAModuleServices).CreateModule(TpsvModuleCreator.Create);
end;


function TPluginExpert.GetAuthor: string;
begin
  Result := 'Serhiy Perevoznyk';
end;

function TPluginExpert.GetComment: string;
begin
  Result := 'PSV Plugin Wizard';
end;

{$IFDEF VERSION6}
function TPluginExpert.GetGlyph: cardinal;
{$ELSE}
function TPluginExpert.GetGlyph: HICON;
{$ENDIF}
begin
  Result := LoadIcon(hInstance, 'PLUGINPROJECT');
end;

function TPluginExpert.GetIDString: string;
begin
  Result := 'BEC9046B-4441-4535-8ECE-C76A65E524C9';
end;

function TPluginExpert.GetName: string;
begin
  Result := 'PSV Plugin';
end;

function TPluginExpert.GetPage: string;
begin
  Result := 'New';
end;

function TPluginExpert.GetState: TWizardState;
begin
   Result := [wsEnabled];
end;

{ TPluginFormExpert }

procedure TPluginFormExpert.Execute;
begin
  (BorlandIDEServices as IOTAModuleServices).CreateModule(TpsvModuleCreator.Create);
end;

function TPluginFormExpert.GetAuthor: string;
begin
  Result := 'Serhiy Perevoznyk';
end;

function TPluginFormExpert.GetComment: string;
begin
  Result := 'Creates new PSV Plugin Form';
end;

{$IFDEF VERSION6}
function TPluginFormExpert.GetGlyph: cardinal;
{$ELSE}
function TPluginFormExpert.GetGlyph: HICON;
{$ENDIF}
begin
  Result := LoadIcon(hInstance, 'PLUGINFORM');
end;

function TPluginFormExpert.GetIDString: string;
begin
  Result := '454D8C17-4EBB-4CE4-ACF4-6CEF0C063230';
end;

function TPluginFormExpert.GetName: string;
begin
   Result := 'PSV Plugin Form';
end;

function TPluginFormExpert.GetPage: string;
begin
  Result := 'New';
end;

function TPluginFormExpert.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

{ TPluginDataModuleExpert }

procedure TPluginDataModuleExpert.Execute;
begin
  (BorlandIDEServices as IOTAModuleServices).CreateModule(TpsvDataModuleCreator.Create);
end;

function TPluginDataModuleExpert.GetAuthor: string;
begin
  Result := 'Serhiy Perevoznyk';
end;

function TPluginDataModuleExpert.GetComment: string;
begin
  Result := 'Create new psv Plugin DataModule';
end;

{$IFDEF VERSION6}
function TPluginDataModuleExpert.GetGlyph: cardinal;
{$ELSE}
function TPluginDataModuleExpert.GetGlyph: HICON;
{$ENDIF}
begin
  Result := LoadIcon(hInstance, 'PLUGINDATA');
end;

function TPluginDataModuleExpert.GetIDString: string;
begin
  Result := 'D1F9BDDD-FCF7-4796-BEC2-6F139D8E58C3';
end;

function TPluginDataModuleExpert.GetName: string;
begin
   Result := 'PSV Plugin DataModule';
end;

function TPluginDataModuleExpert.GetPage: string;
begin
  Result := 'New';
end;

function TPluginDataModuleExpert.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

{ TPluginProjectCreator }

function TPluginProjectCreator.GetCreatorType: string;
begin
  Result := sLibrary;
end;

function TPluginProjectCreator.GetExisting: Boolean;
begin
  Result := false;
end;

function TPluginProjectCreator.GetFileName: string;
var
  i: Integer;
  j: Integer;
  ProjGroup: IOTAProjectGroup;
  Found: Boolean;
  TempFileName: string;
  TempFileName2: string;
begin
  Result := GetCurrentDir + '\' + 'Project%d' + '.dpr'; { do not localize }

  ProjGroup := GetActiveProjectGroup;

  if ProjGroup <> nil then
  begin
    for j := 0 to ProjGroup.ProjectCount-1 do
    begin
      Found := False;
      TempFileName2 := Format(Result, [j+1]);

      for i := 0 to ProjGroup.ProjectCount-1 do
      begin
        try
          TempFileName := ProjGroup.Projects[i].FileName;
          if AnsiCompareFileName(ExtractFileName(TempFileName), ExtractFileName(TempFileName2)) = 0 then
          begin
            Found := True;
            Break;
          end;
        except on E: Exception do
          if not (E is EIntfCastError) then
            raise; 
        end;
      end;

      if not Found then
      begin
        Result := TempFileName2;
        Exit;
      end;
    end;
    Result := Format(Result, [ProjGroup.ProjectCount+1]);
  end
  else
    Result := Format(Result, [1]);
end;

function TPluginProjectCreator.GetFileSystem: string;
begin
   Result := '';
end;

function TPluginProjectCreator.GetOptionFileName: string;
begin
  Result := '';
end;

function TPluginProjectCreator.GetOwner: IOTAModule;
begin
  Result := GetActiveProjectGroup;
end;

function TPluginProjectCreator.GetShowSource: Boolean;
begin
  Result := true;
end;

function TPluginProjectCreator.GetUnnamed: Boolean;
begin
  Result := true;
end;

procedure TPluginProjectCreator.NewDefaultModule;
begin

end;

function TPluginProjectCreator.NewOptionSource(
  const ProjectName: string): IOTAFile;
begin
  Result := nil;
end;

procedure TPluginProjectCreator.NewProjectResource(
  const Project: IOTAProject);
begin

end;

function TPluginProjectCreator.NewProjectSource(
  const ProjectName: string): IOTAFile;
begin
  Result := TPluginProjectSourceFile.CreateNamedProject(ProjectName) as IOTAFile;
end;

{ TPluginProjectSourceFile }

constructor TPluginProjectSourceFile.Create(const Source: string);
begin
  FSource := Source;
end;

constructor TPluginProjectSourceFile.CreateNamedProject(
  AProjectName: string);
begin
  inherited Create;
  FProjectName := AProjectName;
end;

function TPluginProjectSourceFile.GetAge: TDateTime;
begin
  Result := -1;
end;

function TPluginProjectSourceFile.GetSource: string;
var
 ProjectSource : string;
begin
  ProjectSource :=
  '//psv Plugin Library'        + CRLF +
  '//Important note about DLL memory management: ShareMem must be the' + CRLF +
  '//first unit in your library''s USES clause AND your project''s (select'+ CRLF +
  '//Project-View Source) USES clause'+ CRLF +
  '{$E psv}'                     + CRLF +
  ''                             + CRLF +
  'library ' + FProjectName + ';' + CRLF +
  'uses'                         + CRLF +
  '   Sharemem,'                 + CRLF +
  '   psvPluginIntf;'           + CRLF + CRLF +
  '{$R *.RES}'                   + CRLF +
  'exports '                     + CRLF +
  '  RegisterpsvPlugin;'        + CRLF +
  ''                             + CRLF +
  'begin'                        + CRLF +
  '  Application.Initialize;'    + CRLF +
  '  Application.Run;'           + CRLF +
  'end.';
  Result := ProjectSource;
end;

Initialization
   RegisterContainerModule;

Finalization


end.
