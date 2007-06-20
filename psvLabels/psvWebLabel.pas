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

unit psvWebLabel;

Interface

uses Windows, SysUtils, Classes, Controls, stdCtrls, Graphics, Messages,
     psvBasicLbl, ShellAPI, Forms;

type
 TURLType = (lnFile, lnFtp, lnGopher, lnHttp, lnHttps,
             lnMailto, lnNews, lnTelnet, lnWais);

 TpsvWebLabel = class(TpsvBasicLabel)
  private
    FLink: String;
    vLinkType: TURLType;
    procedure SetLinkType(Value: TURLType);
  protected
    procedure   MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
  public
    constructor Create(aOwner : TComponent); override;
  published
    property Link: String read FLink write FLink;
    property LinkType : TURLType read vLinkType write SetLinkType;
  end;



Implementation

{$R webcurs.res}


constructor TpsvWebLabel.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  FLink := 'www.peopleware.be';
  Hint  := 'PeopleWare site';
  ShowHint := true;
  Caption := 'www.peopleware.be';
  Font.Color := clNavy;
  Font.Style := Font.Style + [fsUnderline];
  Cursor := crHandPoint;
  vLinkType := lnHttp;
end;


procedure TpsvWebLabel.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
  clnFile   = 'file://';
  clnFtp    = 'ftp://';
  clnGopher = 'gopher://';
  clnHttp   = 'http://';
  clnHttps  = 'https://';
  clnMailto = 'mailto:';
  clnNews   = 'news:';
  clnTelnet = 'telnet:';
  clnWais   = 'wais:';

var
   rc : integer;
   HyperLinkType: String;


begin
   inherited;
  case vLinkType of
       lnFile   : HyperlinkType := clnFile;
       lnFtp    : HyperlinkType := clnFtp;
       lnGopher : HyperlinkType := clnGopher;
       lnHttp   : HyperlinkType := clnHttp;
       lnHttps  : HyperlinkType := clnHttps;
       lnMailto : HyperlinkType := clnMailto;
       lnNews   : HyperlinkType := clnNews;
       lnTelnet : HyperlinkType := clnTelnet;
       lnWais   : HyperlinkType := clnWais;
     end;

   rc := ShellExecute(0, 'open', PChar(HyperLinkType+FLink), nil, nil, SW_SHOWNORMAL);
   if rc <= 32 then
      raise Exception.CreateFmt('ShellExecute "%s" Failed with Error: %d', [FLink, rc]);
end;

procedure TpsvWebLabel.SetLinkType(Value: TURLType);
begin
 If Value <> vLinkType Then
     vLinkType := Value;
end;

initialization
  Screen.Cursors[crHandPoint]    := LoadCursor(hInstance,'WEB_HAND');

end.