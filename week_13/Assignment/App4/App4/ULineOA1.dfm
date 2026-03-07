object Form7: TForm7
  Left = 0
  Top = 0
  Caption = 'Form7'
  ClientHeight = 390
  ClientWidth = 990
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object Label1: TLabel
    Left = 17
    Top = 8
    Width = 112
    Height = 13
    Caption = 'YOUR_ACCESS_TOKEN'
  end
  object Label2: TLabel
    Left = 17
    Top = 67
    Width = 52
    Height = 13
    Caption = 'GROUP_ID'
  end
  object Button1: TButton
    Left = 24
    Top = 136
    Width = 98
    Height = 25
    Caption = 'Send by Http (ok)'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 136
    Top = 136
    Width = 105
    Height = 25
    Caption = 'Send by Indy (ok)'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 17
    Top = 29
    Width = 976
    Height = 21
    TabOrder = 2
    Text = 
      'PUTM1CUb0O0LM9OZtwNaK/BpA5Rdu4gZ4l5u7AGW7geENcaRLkIlYiqY/IgwTqA5' +
      '5kRowaVxaO0c6BSHoxfGG1egPk0MbdGnxm5a8iavOFXBMGJXVoCWvJleUtOyaP/W' +
      'VrfzxT9Xt0yM0n5Uo++RSgdB04t89/1O/w1cDnyilFU='
  end
  object Edit2: TEdit
    Left = 17
    Top = 94
    Width = 723
    Height = 21
    TabOrder = 3
    Text = 'Ue587e542c744f2de308985beac70f92d'
  end
  object IdHTTP1: TIdHTTP
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 304
    Top = 240
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 128
    Top = 232
  end
end
