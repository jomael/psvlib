object Form1: TForm1
  Left = 404
  Top = 217
  BorderStyle = bsDialog
  Caption = 'PHP Graph demo'
  ClientHeight = 531
  ClientWidth = 630
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBox: TPaintBox
    Left = 0
    Top = 0
    Width = 512
    Height = 512
    OnPaint = PaintBoxPaint
  end
  object btnExecute: TButton
    Left = 524
    Top = 4
    Width = 75
    Height = 25
    Caption = '&Execute'
    TabOrder = 0
    OnClick = btnExecuteClick
  end
  object psvPHP: TpsvPHP
    Variables = <
      item
        Name = 'X'
        Value = '0'
      end
      item
        Name = 'Y'
        Value = '0'
      end
      item
        Name = 'T'
        Value = '0'
      end>
    Left = 236
    Top = 36
  end
  object PHPEngine: TPHPEngine
    Constants = <
      item
        Name = 'MinT'
        Value = '0'
      end
      item
        Name = 'MaxT'
        Value = '82'
      end
      item
        Name = 'Steps'
        Value = '2000'
      end>
    ReportDLLError = False
    Left = 172
    Top = 212
  end
  object PHPLibrary1: TPHPLibrary
    Functions = <>
    Left = 404
    Top = 172
  end
end
