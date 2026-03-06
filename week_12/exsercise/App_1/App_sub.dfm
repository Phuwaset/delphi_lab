object Form6: TForm6
  Left = 0
  Top = 0
  Caption = 'Form6'
  ClientHeight = 495
  ClientWidth = 933
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object StringGrid1: TStringGrid
    Left = 144
    Top = 56
    Width = 320
    Height = 120
    ColCount = 4
    TabOrder = 0
  end
  object Memo1: TMemo
    Left = 400
    Top = 280
    Width = 473
    Height = 161
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object EditHost: TEdit
    Left = 136
    Top = 216
    Width = 121
    Height = 23
    TabOrder = 2
    Text = 'EditHost'
  end
  object EditTopic: TEdit
    Left = 136
    Top = 264
    Width = 121
    Height = 23
    TabOrder = 3
    Text = 'EditTopic'
  end
  object Button1: TButton
    Left = 144
    Top = 328
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 528
    Top = 160
  end
end
