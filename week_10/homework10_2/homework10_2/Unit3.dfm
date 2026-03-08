object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Chart1: TChart
    Left = 119
    Top = 24
    Width = 400
    Height = 250
    Title.Text.Strings = (
      'TChart')
    TabOrder = 0
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series1: TLineSeries
      HoverElement = [heCurrent]
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object Series2: TLineSeries
      HoverElement = [heCurrent]
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object StringGrid1: TStringGrid
    Left = 169
    Top = 280
    Width = 212
    Height = 120
    ColCount = 3
    TabOrder = 1
  end
  object BtnOpen: TButton
    Left = 61
    Top = 408
    Width = 75
    Height = 25
    Caption = 'BtnOpen'
    TabOrder = 2
    OnClick = BtnOpenClick
  end
  object BtnClose: TButton
    Left = 179
    Top = 408
    Width = 75
    Height = 25
    Caption = 'BtnClose'
    TabOrder = 3
    OnClick = BtnCloseClick
  end
  object ComPort1: TComPort
    BaudRate = br9600
    Port = 'COM21'
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
    Left = 49
    Top = 70
  end
  object ComDataPacket1: TComDataPacket
    ComPort = ComPort1
    StopString = '#13#10'
    OnPacket = ComDataPacket1Packet
    Left = 47
    Top = 137
  end
end
