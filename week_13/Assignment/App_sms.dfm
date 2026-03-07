object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'Form5'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object MemoLog: TMemo
    Left = 240
    Top = 64
    Width = 345
    Height = 169
    Lines.Strings = (
      'MemoLog')
    TabOrder = 0
  end
  object BtnSend: TButton
    Left = 384
    Top = 296
    Width = 75
    Height = 25
    Caption = 'BtnSend'
    TabOrder = 1
    OnClick = BtnSendClick
  end
  object NetHTTPClient1: TNetHTTPClient
    UserAgent = 'Embarcadero URI Client/1.0'
    Left = 48
    Top = 120
  end
  object NetHTTPRequest1: TNetHTTPRequest
    Client = NetHTTPClient1
    Left = 48
    Top = 208
  end
end
