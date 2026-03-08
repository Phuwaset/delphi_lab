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
  object ButtonRead: TButton
    Left = 299
    Top = 50
    Width = 75
    Height = 25
    Caption = 'ButtonRead'
    TabOrder = 0
    OnClick = ButtonReadClick
  end
  object Button2: TButton
    Left = 299
    Top = 162
    Width = 75
    Height = 25
    Caption = 'ButtonWrite0'
    TabOrder = 1
    OnClick = ButtonWrite0Click
  end
  object Button3: TButton
    Left = 299
    Top = 102
    Width = 75
    Height = 25
    Caption = 'ButtonWrite1'
    TabOrder = 2
    OnClick = ButtonWrite1Click
  end
  object BtnConnect: TButton
    Left = 204
    Top = 50
    Width = 75
    Height = 25
    Caption = 'BtnConnect'
    TabOrder = 3
    OnClick = BtnConnectClick
  end
  object Memo1: TMemo
    Left = 400
    Top = 89
    Width = 186
    Height = 163
    Lines.Strings = (
      'Memo1')
    TabOrder = 4
  end
  object ClientSocket1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Host = '192.168.1.100'
    Port = 8080
    OnConnect = ClientSocket1Connect
    Left = 132
    Top = 67
  end
end
