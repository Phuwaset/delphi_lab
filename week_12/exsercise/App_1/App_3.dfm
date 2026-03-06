object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 491
  ClientWidth = 726
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 48
    Top = 259
    Width = 24
    Height = 15
    Caption = 'Date'
  end
  object Label2: TLabel
    Left = 48
    Top = 315
    Width = 20
    Height = 15
    Caption = 'Volt'
  end
  object Label3: TLabel
    Left = 52
    Top = 371
    Width = 26
    Height = 15
    Caption = 'Amp'
  end
  object Label4: TLabel
    Left = 280
    Top = 184
    Width = 43
    Height = 15
    Caption = 'TDBGrid'
  end
  object Label5: TLabel
    Left = 312
    Top = 16
    Width = 59
    Height = 15
    Caption = 'TStringGrid'
  end
  object DBNavigator1: TDBNavigator
    Left = 360
    Top = 161
    Width = 240
    Height = 25
    DataSource = DataSource1
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 280
    Top = 216
    Width = 320
    Height = 161
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object Edit1: TEdit
    Left = 48
    Top = 280
    Width = 121
    Height = 23
    TabOrder = 2
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 48
    Top = 336
    Width = 121
    Height = 23
    TabOrder = 3
    Text = 'Edit2'
  end
  object Edit3: TEdit
    Left = 48
    Top = 392
    Width = 121
    Height = 23
    TabOrder = 4
    Text = 'Edit3'
  end
  object SaveFile: TButton
    Left = 64
    Top = 440
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 5
    OnClick = SaveFileClick
  end
  object Load: TButton
    Left = 160
    Top = 440
    Width = 113
    Height = 25
    Caption = 'Load / Refresh'
    TabOrder = 6
    OnClick = LoadClick
  end
  object StringGrid1: TStringGrid
    Tag = 4
    Left = 384
    Top = 16
    Width = 320
    Height = 120
    ColCount = 4
    FixedCols = 0
    RowCount = 12
    TabOrder = 7
    ColWidths = (
      64
      112
      64
      64)
    ColAligments = (
      1
      0
      1
      1)
  end
  object FDTable1: TFDTable
    Active = True
    IndexFieldNames = 'no'
    Connection = FDConnection1
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'mtt_1.machine_1'
    Left = 200
    Top = 80
  end
  object DataSource1: TDataSource
    DataSet = FDTable1
    Left = 304
    Top = 80
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=mtt_1'
      'User_Name=root'
      'Password=pppppppp'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    Left = 80
    Top = 88
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\AppServ\MySQL\lib\libmysql.dll'
    Left = 72
    Top = 184
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = FDTable1
    ScopeMappings = <>
    Left = 552
    Top = 416
  end
  object BindingsList1: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 20
    Top = 5
    object LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = BindSourceDB1
      GridControl = StringGrid1
      Columns = <>
    end
  end
end
