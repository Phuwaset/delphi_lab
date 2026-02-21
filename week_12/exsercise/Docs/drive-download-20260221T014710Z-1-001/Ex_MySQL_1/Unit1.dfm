object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 421
  ClientWidth = 1018
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 408
    Top = 8
    Width = 409
    Height = 249
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Edit1: TEdit
    Left = 66
    Top = 280
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '12.3'
  end
  object Button1: TButton
    Left = 368
    Top = 278
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 208
    Top = 219
    Width = 75
    Height = 25
    Caption = 'edit'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 312
    Top = 219
    Width = 75
    Height = 25
    Caption = 'insert'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 472
    Top = 352
    Width = 75
    Height = 25
    Caption = 'Delete'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Edit2: TEdit
    Left = 224
    Top = 280
    Width = 121
    Height = 21
    TabOrder = 6
    Text = '21.5'
  end
  object DBNavigator1: TDBNavigator
    Left = 80
    Top = 168
    Width = 240
    Height = 25
    DataSource = DataSource1
    TabOrder = 7
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'User_Name=root'
      'Database=mtt'
      'Server=127.0.0.1'
      'DriverID=MySQL'
      'Password=pppppppp')
    Left = 88
    Top = 16
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\AppServ\MySQL\lib\libmysql.dll'
    Left = 88
    Top = 88
  end
  object DataSource1: TDataSource
    DataSet = FDTable1
    Left = 312
    Top = 24
  end
  object FDTable1: TFDTable
    IndexFieldNames = 'no'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'mc1'
    TableName = 'mc1'
    Left = 224
    Top = 24
    object FDTable1no: TFDAutoIncField
      FieldName = 'no'
      Origin = 'no'
    end
    object FDTable1recdate: TDateTimeField
      FieldName = 'recdate'
      Origin = 'recdate'
      Required = True
    end
    object FDTable1volt: TSingleField
      FieldName = 'volt'
      Origin = 'volt'
      Required = True
    end
    object FDTable1amp: TSingleField
      FieldName = 'amp'
      Origin = 'amp'
      Required = True
    end
  end
end
