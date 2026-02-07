unit App_09;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, CPort, CPortCtl;

type
  TForm1 = class(TForm)
    Com1: TComPort;
    BtOpen: TButton;
    Label2: TLabel;
    Label3: TLabel;
    EdSend: TEdit;
    MmReceive: TMemo;
    CbbPort: TComComboBox;
    CbbBaud: TComComboBox;
    BtClose: TButton;
    ComPacket1: TComDataPacket;
    BtSend: TButton;
    procedure BtOpenClick(Sender: TObject);
    procedure BtCloseClick(Sender: TObject);
    procedure ComPacket1Packet(Sender: TObject; const Str: string);
    procedure BtSendClick(Sender: TObject);
//    procedure ComDataPacket1Packet(Sender: TObject; const Str: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BtCloseClick(Sender: TObject);
begin
  Com1.Close;
end;

procedure TForm1.BtOpenClick(Sender: TObject);
begin
  Com1.Open;
  ComPacket1.StopString:=#13#10;
end;


procedure TForm1.BtSendClick(Sender: TObject);
begin
//  if Com1.Connected then
//    Com1.WriteStr(EdSend.Text)
  Com1.WriteStr(EdSend.Text+#13#10);
end;

procedure TForm1.ComPacket1Packet(Sender: TObject; const Str: string);
begin
  MmReceive.Lines.Add(Str);
end;

end.
