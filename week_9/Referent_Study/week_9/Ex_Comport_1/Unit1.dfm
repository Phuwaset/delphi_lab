object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 268
  ClientWidth = 681
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
    Top = 40
    Width = 20
    Height = 13
    Caption = 'Port'
  end
  object Memo1: TMemo
    Left = 376
    Top = 8
    Width = 289
    Height = 241
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Open'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 104
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 208
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Send'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Edit1: TEdit
    Left = 216
    Top = 77
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'Data Send'
  end
  object ComComboBox1: TComComboBox
    Left = 8
    Top = 69
    Width = 145
    Height = 21
    ComPort = ComPort1
    ComProperty = cpPort
    AutoApply = True
    Text = ''
    Style = csDropDownList
    ItemIndex = -1
    TabOrder = 5
  end
  object ComPort1: TComPort
    BaudRate = br9600
    Port = 'COM1'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    StoredProps = [spBasic]
    TriggersOnRxChar = False
    OnRxChar = ComPort1RxChar
    Left = 224
    Top = 16
  end
  object ComDataPacket1: TComDataPacket
    ComPort = ComPort1
    OnPacket = ComDataPacket1Packet
    Left = 200
    Top = 168
  end
end
