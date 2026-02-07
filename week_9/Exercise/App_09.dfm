object Form1: TForm1
  Left = 0
  Top = 0
  Caption = ' Open Port'
  ClientHeight = 565
  ClientWidth = 794
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label2: TLabel
    Left = 91
    Top = 46
    Width = 22
    Height = 15
    Caption = 'Port'
  end
  object Label3: TLabel
    Left = 283
    Top = 46
    Width = 27
    Height = 15
    Caption = 'Baud'
  end
  object BtOpen: TButton
    Left = 91
    Top = 120
    Width = 75
    Height = 25
    Caption = ' Open Port'
    TabOrder = 0
    OnClick = BtOpenClick
  end
  object EdSend: TEdit
    Left = 91
    Top = 233
    Width = 121
    Height = 23
    TabOrder = 1
    Text = 'EdSend'
  end
  object MmReceive: TMemo
    Left = 488
    Top = 49
    Width = 290
    Height = 480
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object CbbPort: TComComboBox
    Left = 91
    Top = 67
    Width = 145
    Height = 23
    ComPort = Com1
    ComProperty = cpPort
    AutoApply = True
    Text = ''
    Style = csDropDownList
    ItemIndex = -1
    TabOrder = 3
  end
  object CbbBaud: TComComboBox
    Left = 283
    Top = 67
    Width = 145
    Height = 23
    ComPort = Com1
    ComProperty = cpBaudRate
    AutoApply = True
    Text = '9600'
    Style = csDropDownList
    ItemIndex = 7
    TabOrder = 4
  end
  object BtClose: TButton
    Left = 283
    Top = 120
    Width = 75
    Height = 25
    Caption = 'BtClose'
    TabOrder = 5
    OnClick = BtCloseClick
  end
  object BtSend: TButton
    Left = 91
    Top = 272
    Width = 75
    Height = 25
    Caption = 'BtSend'
    TabOrder = 6
    OnClick = BtSendClick
  end
  object Com1: TComPort
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
    Left = 104
    Top = 344
  end
  object ComPacket1: TComDataPacket
    ComPort = Com1
    OnPacket = ComPacket1Packet
    Left = 336
    Top = 264
  end
end
