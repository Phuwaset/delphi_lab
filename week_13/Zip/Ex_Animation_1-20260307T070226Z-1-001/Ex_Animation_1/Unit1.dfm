object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 347
  ClientWidth = 796
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 443
    Top = 24
    Width = 289
    Height = 113
  end
  object Button1: TButton
    Left = 112
    Top = 291
    Width = 75
    Height = 25
    Caption = 'Load'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 504
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Load'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 96
    Top = 264
    Width = 345
    Height = 21
    TabOrder = 2
  end
  object Button3: TButton
    Left = 208
    Top = 291
    Width = 75
    Height = 25
    Caption = 'Play'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 612
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 528
    Top = 255
    Width = 75
    Height = 25
    Caption = 'Run'
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 632
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Button6'
    TabOrder = 6
    OnClick = Button6Click
  end
  object MediaPlayer1: TMediaPlayer
    Left = 96
    Top = 192
    Width = 253
    Height = 30
    DeviceType = dtAVIVideo
    DoubleBuffered = True
    Display = Animate1
    FileName = 'D:\Work3\Kmutnb\2022\Compro1-65\Code\week13\outpy.avi'
    Visible = False
    ParentDoubleBuffered = False
    TabOrder = 7
  end
  object Animate1: TAnimate
    Left = 96
    Top = 32
    Width = 209
    Height = 137
    AutoSize = False
  end
  object OpenDialog1: TOpenDialog
    Left = 16
    Top = 256
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 480
    Top = 288
  end
end
