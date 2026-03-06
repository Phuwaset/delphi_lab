object Form5: TForm5
  Left = 0
  Top = 0
  Caption = 'Form5'
  ClientHeight = 498
  ClientWidth = 712
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 88
    Top = 40
    Width = 31
    Height = 15
    Caption = 'Topic '
  end
  object Label2: TLabel
    Left = 248
    Top = 40
    Width = 91
    Height = 15
    Caption = 'data temperature'
  end
  object Label3: TLabel
    Left = 400
    Top = 40
    Width = 22
    Height = 15
    Caption = 'QoS'
  end
  object Label4: TLabel
    Left = 400
    Top = 124
    Width = 281
    Height = 60
    Caption = 
      #3588#3656#3634'        '#3588#3623#3634#3617#3627#3617#3634#3618'                '#3629#3608#3636#3610#3634#3618#13#10'0          At most on' +
      'ce         '#3626#3656#3591#3588#3619#3633#3657#3591#3648#3604#3637#3618#3623' '#3652#3617#3656#3626#3609#3651#3592#3623#3656#3634#3606#3638#3591#3627#3619#3639#3629#3648#3611#3621#3656#3634#13#10'1          At l' +
      'east once          '#3626#3656#3591#3595#3657#3635#3592#3609#3585#3623#3656#3634#3592#3632#3652#3604#3657#3619#3633#3610#3585#3634#3619#3618#3639#3609#3618#3633#3609#13#10'2          Exa' +
      'ctly once           '#3626#3656#3591#3606#3638#3591#3649#3609#3656#3609#3629#3609' '#3649#3621#3632#3619#3633#3610#3649#3588#3656#3588#3619#3633#3657#3591#3648#3604#3637#3618#3623
  end
  object Edit1: TEdit
    Left = 88
    Top = 72
    Width = 121
    Height = 23
    TabOrder = 0
    Text = 'sensor/temperature'
  end
  object Edit2: TEdit
    Left = 248
    Top = 72
    Width = 121
    Height = 23
    TabOrder = 1
    Text = '0'
  end
  object Edit3: TEdit
    Left = 400
    Top = 72
    Width = 121
    Height = 23
    TabOrder = 2
    Text = '1'
  end
  object Button1: TButton
    Left = 88
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Publisher'
    TabOrder = 3
    OnClick = Button1Click
  end
end
