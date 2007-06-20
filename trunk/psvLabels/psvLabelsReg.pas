{*******************************************************}
{                                                       }
{          psvLabels Delphi components Library          }
{                                                       }
{ Author:                                               }
{ Serhiy Perevoznyk                                     }
{ serge_perevoznyk@hotmail.com                          }
{ http://users.chello.be/ws36637/                       }
{                                                       }
{     Use, modification and distribution is allowed     }
{without limitation, warranty, or liability of any kind.}
{                                                       }
{*******************************************************}

unit psvLabelsReg;

Interface
uses
  Windows,
  Classes,
  Forms,
  Dialogs,
  Controls,
  {$IFDEF VER130}
  DsgnIntf,
  {$ELSE}
  DesignIntf,
  DesignEditors,
  {$ENDIF}
  psvBasicLbl,
  psvWebLabel,
  psvTransLabel,
  psvLCDLabel,
  psvBorderlabel,
  psvLinkedLabel,
  reMain;

type
   TRichTextProperty = class(TClassProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    procedure Edit; override;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Labels',[TpsvBasicLabel]);
  RegisterComponents('Labels',[TpsvWebLabel]);
  RegisterComponents('Labels',[TpsvTransLabel]);
  RegisterComponents('Labels', [TpsvBorderLabel]);
  RegisterComponents('labels', [TpsvLinkedLabel]);
end;


function TRichTextProperty.GetAttributes: TPropertyAttributes;
begin
  Result := inherited GetAttributes + [paDialog] - [paSubProperties];
end;

procedure TRichTextProperty.Edit;
var
  Stream : TMemoryStream;
  Lines  : TStringList;
  V      : TStrings;
begin
  with TRichTextProp.Create(Application) do
  try
   Editor.PlainText := False;
   Stream := TMemoryStream.Create;
   V := TStrings(GetOrdValue);
   V.SaveToStream(Stream);
   Stream.Position := 0;
   Editor.Lines.LoadFromStream(Stream);
   Stream.Free;

    if ShowModal = mrOk then
    begin
      Lines := TStringList.Create;
      Stream := TMemoryStream.Create;
      Editor.Lines.SaveToStream(Stream);
      Stream.Position := 0;
      Lines.LoadFromStream(Stream);
      Stream.Free;
      SetOrdValue(Longint(Lines));
      Lines.Free;
    end;
  finally
    Free;
  end;
end;

end.