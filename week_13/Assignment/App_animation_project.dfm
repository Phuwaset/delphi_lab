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
  TextHeight = 15
  object Img1: TImage
    Left = 32
    Top = 32
    Width = 297
    Height = 257
  end
  object BitBtn1: TBitBtn
    Left = 400
    Top = 127
    Width = 75
    Height = 25
    Caption = 'stop'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 400
    Top = 32
    Width = 75
    Height = 25
    Caption = 'open'
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 400
    Top = 80
    Width = 75
    Height = 25
    Caption = 'run'
    TabOrder = 2
    OnClick = BitBtn3Click
  end
  object Opd1: TOpenPictureDialog
    Left = 408
    Top = 248
  end
end
