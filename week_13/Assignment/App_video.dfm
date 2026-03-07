object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 634
  ClientWidth = 1035
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object WHP: TWindowsMediaPlayer
    Left = 176
    Top = 56
    Width = 245
    Height = 240
    TabOrder = 0
    ControlData = {
      000300000800000000000500000000000000F03F030000000000050000000000
      0000000008000200000000000300010000000B00FFFF0300000000000B00FFFF
      08000200000000000300320000000B00000008000A000000660075006C006C00
      00000B0000000B0000000B00FFFF0B00FFFF0B00000008000200000000000800
      020000000000080002000000000008000200000000000B00000042140000D813
      0000}
  end
  object BitBtn1: TBitBtn
    Left = 112
    Top = 336
    Width = 75
    Height = 25
    Caption = 'open'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 208
    Top = 336
    Width = 75
    Height = 25
    Caption = 'play'
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 304
    Top = 336
    Width = 75
    Height = 25
    Caption = 'pause'
    TabOrder = 3
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 401
    Top = 336
    Width = 75
    Height = 25
    Caption = 'stop'
    TabOrder = 4
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 498
    Top = 336
    Width = 75
    Height = 25
    Caption = 'fullScreen'
    TabOrder = 5
    OnClick = BitBtn5Click
  end
  object Opd: TOpenDialog
    Left = 504
    Top = 192
  end
end
