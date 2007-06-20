{*******************************************************}
{                                                       }
{          psvLabels Delphi components Library          }
{                                                       }
{ Author:                                               }
{ Serhiy Perevoznyk                                     }
{ serge_perevoznyk@hotmail.com                          }
{                                                       }
{     Use, modification and distribution is allowed     }
{without limitation, warranty, or liability of any kind.}
{                                                       }
{*******************************************************}

unit ReMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ImgList, ToolWin;

type
  TRichTextProp = class(TForm)
    ToolBar1: TToolBar;
    Editor: TRichEdit;
    SaveButton: TToolButton;
    OpenButton: TToolButton;
    CopyButton: TToolButton;
    CutButton: TToolButton;
    ImageList1: TImageList;
    PasteButton: TToolButton;
    LeftButton: TToolButton;
    RightButton: TToolButton;
    CenterButton: TToolButton;
    FontButton: TToolButton;
    BoldButton: TToolButton;
    UnderButton: TToolButton;
    ItalicButton: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    FontSize: TEdit;
    UpDown1: TUpDown;
    FontName: TComboBox;
    OpenDialog: TOpenDialog;
    ToolButton1: TToolButton;
    FontDialog1: TFontDialog;
    procedure SaveButtonClick(Sender: TObject);
    procedure CopyButtonClick(Sender: TObject);
    procedure CutButtonClick(Sender: TObject);
    procedure PasteButtonClick(Sender: TObject);
    procedure AlignButtonClick(Sender: TObject);
    procedure OpenButtonClick(Sender: TObject);
    procedure FontSizeChange(Sender: TObject);
    procedure FontNameChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EditorSelectionChange(Sender: TObject);
    procedure BoldButtonClick(Sender: TObject);
    procedure ItalicButtonClick(Sender: TObject);
    procedure UnderButtonClick(Sender: TObject);
    procedure FontButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RichTextProp: TRichTextProp;

implementation

{$R *.DFM}

procedure TRichTextProp.SaveButtonClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TRichTextProp.CopyButtonClick(Sender: TObject);
begin
  Editor.CopyToClipboard;
end;

procedure TRichTextProp.CutButtonClick(Sender: TObject);
begin
  Editor.CutToClipboard;
end;

procedure TRichTextProp.PasteButtonClick(Sender: TObject);
begin
  Editor.PasteFromClipboard;
end;

procedure TRichTextProp.AlignButtonClick(Sender: TObject);
begin
  Editor.Paragraph.Alignment := TAlignment(TControl(Sender).Tag);
end;

procedure TRichTextProp.OpenButtonClick(Sender: TObject);
begin
  if OpenDialog.Execute then
  begin
  Editor.Lines.LoadFromFile(OpenDialog.FileName);
  Editor.SetFocus;
  end;
end;

procedure TRichTextProp.FontSizeChange(Sender: TObject);
begin
  Editor.SelAttributes.Size := StrToInt(FontSize.Text);
end;

procedure TRichTextProp.FontNameChange(Sender: TObject);
begin
  Editor.SelAttributes.Name := FontName.Items[FontName.ItemIndex];
end;

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
  FontType: Integer; Data: Pointer): Integer; stdcall;
begin
  TStrings(Data).Add(LogFont.lfFaceName);
  Result := 1;
end;

procedure TRichTextProp.FormCreate(Sender: TObject);
var DC : HDC;
begin
  DC := GetDC(0);
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(FontName.Items));
  ReleaseDC(0, DC);
  FontName.Sorted := True;
end;

procedure TRichTextProp.EditorSelectionChange(Sender: TObject);
begin
  with Editor.Paragraph do
  try
    BoldButton.Down := fsBold in Editor.SelAttributes.Style;
    ItalicButton.Down := fsItalic in Editor.SelAttributes.Style;
    UnderButton.Down := fsUnderline in Editor.SelAttributes.Style;
    FontSize.Text := IntToStr(Editor.SelAttributes.Size);
    FontName.Text := Editor.SelAttributes.Name;
    case Ord(Alignment) of
      0: LeftButton.Down := True;
      1: RightButton.Down := True;
      2: CenterButton.Down := True;
    end;
  finally
  end;

end;

procedure TRichTextProp.BoldButtonClick(Sender: TObject);
begin
  if BoldButton.Down then
    Editor.SelAttributes.Style := Editor.SelAttributes.Style + [fsBold]
  else
    Editor.SelAttributes.Style := Editor.SelAttributes.Style - [fsBold];
end;

procedure TRichTextProp.ItalicButtonClick(Sender: TObject);
begin
  if ItalicButton.Down then
    Editor.SelAttributes.Style := Editor.SelAttributes.Style + [fsItalic]
  else
    Editor.SelAttributes.Style := Editor.SelAttributes.Style - [fsItalic];
end;

procedure TRichTextProp.UnderButtonClick(Sender: TObject);
begin
  if UnderButton.Down then
    Editor.SelAttributes.Style := Editor.SelAttributes.Style + [fsUnderline]
  else
    Editor.SelAttributes.Style := Editor.SelAttributes.Style - [fsUnderline];

end;

procedure TRichTextProp.FontButtonClick(Sender: TObject);
begin
  FontDialog1.Font.Assign(Editor.SelAttributes);
  if FontDialog1.Execute then
    Editor.SelAttributes.Assign(FontDialog1.Font);
  EditorSelectionChange(Self);
  Editor.SetFocus;
end;

end.
