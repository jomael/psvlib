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
{$IFNDEF VER130}
{$WARN SYMBOL_DEPRECATED OFF}
{$WARN SYMBOL_PLATFORM OFF}
{$ENDIF}

unit psvLinkedLabel;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, StdCtrls, Dialogs, psvBasiclbl,
  Forms;

type
  TpsvLabelPosition = (lpAbove, lpLeft);

  TpsvLinkedLabel = class(TpsvbasicLabel)
  private
    FPosition : TpsvLabelPosition;
    FControl : TWinControl;
    FObjectInstance: Pointer;
    FOldWindowProc : Pointer;
    FSpacing : integer;
    procedure SetSpacing(AValue : integer);
    procedure ControlWindowProc(var msg: TMessage);
    procedure SetControl(AValue : TWinControl);
    procedure SetPosition(const Value: TpsvLabelPosition);
  protected
    procedure Notification(AComponent: TComponent;
                Operation: TOperation); override;
    procedure MoveToPos; virtual;
    procedure Click; override;
    procedure Resize; override;
  public
    constructor Create(AOwner : tComponent); override;
    destructor  Destroy; override;
  published
    property Control : TWinControl read FControl write SetControl;
    property Position : TpsvLabelPosition read FPosition write SetPosition default lpAbove;
    property Spacing : integer read FSpacing write SetSpacing default 3;
  end;


implementation


{ TpsvLinkedLabel }


constructor TpsvLinkedLabel.Create(AOwner: tComponent);
begin
  inherited;
  FObjectInstance := MakeObjectInstance(ControlWindowProc);
  FSpacing := 3;
  FPosition := lpAbove;
end;

destructor TpsvLinkedLabel.Destroy;
begin
  if Assigned(FControl) then
     SetWindowLong (TWinControl(FControl).Handle, GWL_WNDPROC,
                            integer(FOldWindowProc));
  FreeObjectInstance(FObjectInstance);
  FObjectInstance := nil;
  inherited;
end;

procedure TpsvLinkedLabel.MoveToPos;
var
  PAbove: TPoint;
  PLeft : TPoint;
begin
  if Assigned(FControl) then
   begin
     PAbove := Point(FControl.Left, FControl.Top - Height - FSpacing);
     PLeft  := Point(FControl.Left - Width - FSpacing,
                     FControl.Top + ((FControl.Height - Height) div 2));

  case FPosition of
    lpAbove: begin
               SetBounds(PAbove.x, PAbove.y, Width, Height);
             end;
    lpLeft : begin
               SetBounds(PLeft.x, PLeft.y, Width, Height);
             end;
  end;

   end;
end;

procedure TpsvLinkedLabel.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if ( (Operation = opRemove)  and (AComponent = FControl) ) then
   begin
     FControl := nil;
   end
end;

procedure TpsvLinkedLabel.ControlWindowProc(var msg: TMessage);
begin
  if msg.Msg = WM_ENABLE then
  Enabled := FControl.Enabled;
  
  if msg.Msg = WM_MOVE then
    MoveToPos;
  if msg.Msg = WM_SIZE then
    MoveToPos;
  if msg.Msg = WM_DESTROY then
    begin
     SetWindowLong (TWinControl(FControl).Handle, GWL_WNDPROC,
                            integer(FOldWindowProc));
    end;
   msg.result := CallWindowProc (fOldWindowProc, TWinControl(FControl).Handle,
          msg.msg, msg.wParam, msg.lParam)
end;

procedure TpsvLinkedLabel.SetControl(AValue: TWinControl);
begin
  if AValue <> FControl then
   begin
     if Assigned(FControl) then
      begin
        SetWindowLong (TWinControl(FControl).Handle, GWL_WNDPROC,
                            integer(FOldWindowProc));
      end;
     FControl := AValue;
     if Assigned(FControl) then
      begin
        FControl.FreeNotification(Self);
        FOldWindowProc := TfnWndProc (SetWindowLong (TWinControl(FControl).Handle,
                                     GWL_WNDPROC, Integer (FObjectInstance)));
        MoveToPos;                             
      end;
   end;
end;



procedure TpsvLinkedLabel.SetPosition(const Value: TpsvLabelPosition);
begin
  if FPosition <> Value then
   begin
     FPosition := Value;
     if Assigned(FControl) then
      MoveToPos;
   end;
end;

procedure TpsvLinkedLabel.SetSpacing(AValue: integer);
begin
  if FSpacing <> AValue then
   begin
     FSpacing := AValue;
     if Assigned(FControl) then
      MoveToPos;
   end;
end;



procedure TpsvLinkedLabel.Click;
begin
  inherited;
  if Assigned(FControl) then
   begin
     if FControl.CanFocus then
      FControl.SetFocus;
   end;
end;

procedure TpsvLinkedLabel.Resize;
begin
  inherited;
  MoveToPos;
end;

end.
