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

unit psvBasiclbl;

interface

uses Windows, SysUtils, Classes, Controls, stdCtrls, Graphics, Messages;

Type
  TpsvBasicLabel = class(TCustomLabel)
  private
    FFocusColor,   FSaveColor: TColor;
    FOnMouseEnter, FOnMouseLeave: TNotifyEvent;
  protected
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure CMMouseEnter(var Msg: TMessage); message CM_MouseEnter;
    procedure CMMouseLeave(var Msg: TMessage); message CM_MouseLeave;
    procedure Loaded; override;
  public
    constructor Create(aOwner : TComponent); override;
    property SavedColor : TColor read FSaveColor;
  published
    property FocusColor: TColor read FFocusColor write FFocusColor default clRed;
    property OnMouseEnter: TNotifyEvent read FOnMouseEnter write FOnMouseEnter;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
    property Align;
    property Alignment;
    property Anchors;
    property AutoSize;
    property BiDiMode;
    property Caption;
    property Color;
    property Constraints;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property FocusControl;
    property Font;
    property ParentBiDiMode;
    property ParentColor;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowAccelChar;
    property ShowHint;
    property Transparent;
    property Layout;
    property Visible;
    property WordWrap;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
  end;


implementation


constructor TpsvBasicLabel.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  FFocusColor := clRed;
  FSaveColor := Font.Color;
end;


procedure TpsvBasicLabel.Loaded;
begin
 inherited;
 FSaveColor := Font.Color;
end;

procedure TpsvBasicLabel.CMFontChanged(var Message: TMessage);
begin
  inherited;
  if Font.Color <> FFocusColor then
    FSaveColor := Font.Color;
end;

procedure TpsvBasicLabel.CMMouseEnter(var Msg: TMessage);
begin
  Font.Color := FFocusColor;
  if Assigned(FOnMouseEnter) then OnMouseEnter(Self);
end;

procedure TpsvBasicLabel.CMMouseLeave(var Msg: TMessage);
begin
  Font.Color := FSaveColor;
  if Assigned(FOnMouseLeave) then OnMouseLeave(Self);
end;


end.
