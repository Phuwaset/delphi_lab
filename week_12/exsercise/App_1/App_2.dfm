object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
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
    Height = 23
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
