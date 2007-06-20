object Form1: TForm1
  Left = 253
  Top = 103
  Width = 870
  Height = 785
  Caption = 'Demo Application'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ListView1: TListView
    Left = 0
    Top = 0
    Width = 862
    Height = 739
    Align = alClient
    Columns = <
      item
        Caption = 'Author'
        Width = 200
      end
      item
        Caption = 'Copyright'
        Width = 200
      end
      item
        Caption = 'Description'
        Width = 200
      end
      item
        Caption = 'Plugin ID'
        Width = 200
      end
      item
        Caption = 'Version'
      end
      item
        Caption = 'Plugin Name'
      end>
    TabOrder = 0
    ViewStyle = vsReport
    OnDblClick = ListView1DblClick
  end
  object psvPluginManager1: TpsvPluginManager
    Extension = 'psv'
    Params = <>
    Left = 268
    Top = 152
  end
  object MainMenu1: TMainMenu
    Left = 516
    Top = 188
    object P1: TMenuItem
      Caption = 'Plugins'
      object L1: TMenuItem
        Caption = 'Load Plugins'
        OnClick = L1Click
      end
      object U1: TMenuItem
        Caption = 'Unload Plugins'
        OnClick = U1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object C1: TMenuItem
        Caption = 'Close'
        OnClick = C1Click
      end
    end
    object F1: TMenuItem
      Caption = 'Forms'
      object S1: TMenuItem
        Caption = 'Show Modal'
        OnClick = S1Click
      end
      object S2: TMenuItem
        Caption = 'Show'
        OnClick = S2Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object A2: TMenuItem
        Caption = 'Available Forms'
        OnClick = A2Click
      end
    end
    object A1: TMenuItem
      Caption = 'Actions'
      object E1: TMenuItem
        Caption = 'Execute Action'
        OnClick = E1Click
      end
    end
  end
end
