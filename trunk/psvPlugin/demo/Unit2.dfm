object PluginForm: TPluginForm
  Left = 486
  Top = 153
  Width = 486
  Height = 443
  Caption = 'Plugin Form'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 478
    Height = 37
    HelpContext = 4
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 3
    TabOrder = 0
    object ActivateBtn: TSpeedButton
      Left = 284
      Top = 4
      Width = 85
      Height = 25
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'Backorders'
    end
    object Bevel1: TBevel
      Left = 3
      Top = 32
      Width = 472
      Height = 2
      Align = alBottom
      Shape = bsTopLine
    end
    object Navigator: TDBNavigator
      Left = 8
      Top = 4
      Width = 135
      Height = 25
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object EditBtn: TButton
      Left = 177
      Top = 4
      Width = 74
      Height = 25
      Caption = '&Edit'
      ModalResult = 1
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 377
    Width = 478
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object CloseBtn: TButton
      Left = 300
      Top = 9
      Width = 74
      Height = 25
      Cancel = True
      Caption = '&Close'
      Default = True
      ModalResult = 2
      TabOrder = 0
    end
  end
  object PartsGrid: TDBGrid
    Left = 0
    Top = 37
    Width = 478
    Height = 340
    Align = alClient
    Options = [dgTitles, dgColLines, dgRowLines, dgRowSelect]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PartNo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Description'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OnHand'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OnOrder'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BackOrd'
        Visible = True
      end>
  end
end
