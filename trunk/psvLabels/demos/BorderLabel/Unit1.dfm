object Form1: TForm1
  Left = 258
  Top = 275
  Width = 422
  Height = 163
  Caption = 'BorderLabel Demo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object psvBorderLabel1: TpsvBorderLabel
    Left = 16
    Top = 12
    Width = 105
    Height = 19
    Caption = 'Label without  border'
  end
  object psvBorderLabel2: TpsvBorderLabel
    Left = 16
    Top = 36
    Width = 117
    Height = 33
    Alignment = taCenter
    AutoSize = False
    Caption = 'Lowered Border'
    Layout = tlCenter
    Border = bsLowered
  end
  object psvBorderLabel3: TpsvBorderLabel
    Left = 16
    Top = 76
    Width = 117
    Height = 41
    Alignment = taCenter
    AutoSize = False
    Caption = 'Raised Border'
    Layout = tlCenter
    Border = bsRaised
  end
  object Button1: TButton
    Left = 336
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 0
    OnClick = Button1Click
  end
end
