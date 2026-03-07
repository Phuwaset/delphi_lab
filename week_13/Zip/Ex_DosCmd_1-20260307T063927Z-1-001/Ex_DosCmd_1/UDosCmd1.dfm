object Frm1: TFrm1
  Left = 0
  Top = 0
  Caption = 'butt'
  ClientHeight = 382
  ClientWidth = 647
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object Lb1: TLabel
    Left = 32
    Top = 16
    Width = 47
    Height = 13
    Caption = 'Command'
  end
  object Lb2: TLabel
    Left = 184
    Top = 8
    Width = 30
    Height = 13
    Caption = 'Result'
  end
  object Bt1: TButton
    Left = 24
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Bt1'
    TabOrder = 0
    OnClick = Bt1Click
  end
  object Mm1: TMemo
    Left = 184
    Top = 27
    Width = 265
    Height = 185
    TabOrder = 1
  end
  object Ed1: TEdit
    Left = 24
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'python E:/test.py'
  end
end
