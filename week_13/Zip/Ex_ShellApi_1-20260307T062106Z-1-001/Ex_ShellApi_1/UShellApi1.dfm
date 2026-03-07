object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 391
  ClientWidth = 742
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object Bt1: TButton
    Left = 16
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Bt1'
    TabOrder = 0
    OnClick = Bt1Click
  end
  object Bt2: TButton
    Left = 128
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Bt2'
    TabOrder = 1
    OnClick = Bt2Click
  end
  object Bt3: TButton
    Left = 224
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Bt3'
    TabOrder = 2
    OnClick = Bt3Click
  end
  object Bt4: TButton
    Left = 305
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Bt4'
    TabOrder = 3
    OnClick = Bt4Click
  end
  object Bt5: TButton
    Left = 16
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Bt5'
    TabOrder = 4
    OnClick = Bt5Click
  end
  object Bt6: TButton
    Left = 97
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Bt6'
    TabOrder = 5
    OnClick = Bt6Click
  end
  object Bt8: TButton
    Left = 259
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Bt8'
    TabOrder = 6
    OnClick = Bt8Click
  end
  object Button5: TButton
    Left = 352
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Button5'
    TabOrder = 7
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 488
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Button6'
    TabOrder = 8
  end
  object Button7: TButton
    Left = 488
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Button7'
    TabOrder = 9
  end
  object Bt7: TButton
    Left = 178
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Bt7'
    TabOrder = 10
    OnClick = Bt7Click
  end
  object StatusMemo: TMemo
    Left = 32
    Top = 200
    Width = 113
    Height = 73
    Lines.Strings = (
      'StatusMemo')
    TabOrder = 11
  end
  object IdMailBox1: TIdMailBox
    Left = 224
    Top = 232
  end
  object SMTP: TIdSMTP
    SASLMechanisms = <>
    Left = 320
    Top = 152
  end
  object IdSMTPServer1: TIdSMTPServer
    Bindings = <>
    CommandHandlers = <>
    ExceptionReply.Code = '500'
    ExceptionReply.Text.Strings = (
      'Unknown Internal Error')
    Greeting.Code = '220'
    Greeting.Text.Strings = (
      'Welcome to the INDY SMTP Server')
    HelpReply.Code = ''
    MaxConnectionReply.Code = '300'
    MaxConnectionReply.Text.Strings = (
      'Too many connections. Try again later.')
    ReplyTexts = <>
    ReplyUnknownCommand.Code = '500'
    ReplyUnknownCommand.Text.Strings = (
      'Syntax Error')
    ReplyUnknownCommand.EnhancedCode.StatusClass = 5
    ReplyUnknownCommand.EnhancedCode.Subject = 5
    ReplyUnknownCommand.EnhancedCode.Details = 2
    ReplyUnknownCommand.EnhancedCode.Available = True
    ReplyUnknownCommand.EnhancedCode.ReplyAsStr = '5.5.2'
    ServerName = 'Indy SMTP Server'
    Left = 152
    Top = 144
  end
  object MailMessage: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 304
    Top = 232
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Doc|*.docx|Pic|*.jpg|All|*.*'
    Left = 232
    Top = 96
  end
end
