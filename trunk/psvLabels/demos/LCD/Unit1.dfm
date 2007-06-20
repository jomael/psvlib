object Form1: TForm1
  Left = 268
  Top = 236
  BorderStyle = bsDialog
  Caption = 'LCD label Demo'
  ClientHeight = 71
  ClientWidth = 292
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object psvLCDLabel1: TpsvLCDLabel
    Left = 24
    Top = 16
    Width = 224
    Height = 20
    Caption = 'LCD LABEL DEMO'
  end
  object Button1: TButton
    Left = 216
    Top = 44
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 0
    OnClick = Button1Click
  end
end
