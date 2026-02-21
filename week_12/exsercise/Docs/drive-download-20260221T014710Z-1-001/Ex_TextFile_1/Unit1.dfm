object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 283
  ClientWidth = 670
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 13
  object Button1: TButton
    Left = 40
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 152
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Load'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'abc'
  end
  object Edit2: TEdit
    Left = 152
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 3
    Text = '123.45'
  end
  object Edit3: TEdit
    Left = 288
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 4
    Text = '456'
  end
end
