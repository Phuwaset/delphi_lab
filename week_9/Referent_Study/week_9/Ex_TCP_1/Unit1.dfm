object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 286
  ClientWidth = 589
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 10
    Height = 13
    Caption = 'IP'
  end
  object Label2: TLabel
    Left = 16
    Top = 56
    Width = 20
    Height = 13
    Caption = 'Port'
  end
  object Button1: TButton
    Left = 0
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Open'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 153
    Top = 93
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Data Send'
  end
  object Memo1: TMemo
    Left = 280
    Top = 8
    Width = 289
    Height = 257
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object Button2: TButton
    Left = 81
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 162
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Send'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Edit2: TEdit
    Left = 8
    Top = 21
    Width = 121
    Height = 21
    TabOrder = 5
    Text = '127.0.0.1'
  end
  object Edit3: TEdit
    Left = 8
    Top = 69
    Width = 121
    Height = 21
    TabOrder = 6
    Text = '2000'
  end
  object ClientSocket1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnRead = ClientSocket1Read
    Left = 216
    Top = 16
  end
end
