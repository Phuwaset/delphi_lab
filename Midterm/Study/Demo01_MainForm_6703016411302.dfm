object Form1: TForm1
  Left = 192
  Top = 122
  Caption = 'Form1'
  ClientHeight = 653
  ClientWidth = 1041
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  Scaled = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 14
  object ImPreView1: TImage
    Left = 10
    Top = 20
    Width = 500
    Height = 300
    Stretch = True
  end
  object ImCap1: TImage
    Left = 544
    Top = 176
    Width = 229
    Height = 225
  end
  object Label1: TLabel
    Left = 544
    Top = 34
    Width = 90
    Height = 32
    Caption = 'BarCode'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object EdBarcode: TEdit
    Left = 544
    Top = 72
    Width = 449
    Height = 40
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clCrimson
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = 'ScanBarCode....'
    OnChange = EdBarcodeChange
  end
  object CbCam1: TComboBox
    Left = 544
    Top = 123
    Width = 181
    Height = 22
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 1
    Text = 'CbCam1'
    OnChange = CbCam1Change
  end
end
