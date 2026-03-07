object FrMain: TFrMain
  Left = 0
  Top = 0
  Caption = 'FrMain'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 48
    Top = 48
    Width = 25
    Height = 15
    Caption = 'WAV'
  end
  object Label2: TLabel
    Left = 48
    Top = 100
    Width = 26
    Height = 15
    Caption = 'Beep'
  end
  object Label3: TLabel
    Left = 48
    Top = 164
    Width = 43
    Height = 15
    Caption = 'MPlayer'
  end
  object Label4: TLabel
    Left = 312
    Top = 104
    Width = 118
    Height = 15
    Caption = #3648#3626#3637#3618#3591#3651#3594#3657' '#3648#3617#3639#3656#3629#3585#3604#3612#3636#3604' '#3627#3619#3639#3629' '#3595#3634#3623
  end
  object Label5: TLabel
    Left = 312
    Top = 44
    Width = 60
    Height = 15
    Caption = #3648#3626#3637#3618#3591#3649#3592#3657#3591#3648#3605#3639#3629#3609
  end
  object Button1: TButton
    Left = 120
    Top = 40
    Width = 75
    Height = 25
    Caption = 'play'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 224
    Top = 40
    Width = 75
    Height = 25
    Caption = 'stop'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 120
    Top = 96
    Width = 75
    Height = 25
    Caption = 'msgDeep'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 224
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Beep'
    TabOrder = 3
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 120
    Top = 160
    Width = 75
    Height = 25
    Caption = 'open'
    TabOrder = 4
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 224
    Top = 160
    Width = 75
    Height = 25
    Caption = 'play'
    TabOrder = 5
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 328
    Top = 160
    Width = 75
    Height = 25
    Caption = 'stop'
    TabOrder = 6
    OnClick = Button7Click
  end
  object MediaPlayer: TMediaPlayer
    Left = 158
    Top = 272
    Width = 253
    Height = 30
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 7
  end
  object Opd: TOpenDialog
    Left = 464
    Top = 184
  end
end
