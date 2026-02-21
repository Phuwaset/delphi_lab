object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 366
  ClientWidth = 602
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object Button2: TButton
    Left = 64
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 0
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
  object ComboBox1: TComboBox
    Left = 152
    Top = 32
    Width = 57
    Height = 21
    ItemIndex = 0
    TabOrder = 2
    Text = '0'
    Items.Strings = (
      '0'
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9')
  end
  object CheckBox1: TCheckBox
    Left = 240
    Top = 34
    Width = 97
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 3
  end
end
