object Form1: TForm1
  Left = 476
  Top = 333
  Width = 256
  Height = 117
  Caption = 'Web Label Demo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object psvWebLabel1: TpsvWebLabel
    Left = 16
    Top = 12
    Width = 97
    Height = 13
    Cursor = crHandPoint
    Hint = 'PeopleWare site'
    Caption = 'www.peopleware.be'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Link = 'www.peopleware.be'
    LinkType = lnHttp
  end
  object psvWebLabel2: TpsvWebLabel
    Left = 16
    Top = 36
    Width = 85
    Height = 13
    Cursor = crHandPoint
    Hint = 'PeopleWare site'
    Caption = 'www.borland.com'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Link = 'www.borland.com'
    LinkType = lnHttp
  end
  object Button1: TButton
    Left = 168
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 0
    OnClick = Button1Click
  end
end
