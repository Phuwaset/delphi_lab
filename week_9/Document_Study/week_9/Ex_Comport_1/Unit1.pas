unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, CPort, CPortCtl;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    ComPort1: TComPort;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    ComComboBox1: TComComboBox;
    Label1: TLabel;
    ComDataPacket1: TComDataPacket;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ComPort1RxChar(Sender: TObject; Count: Integer);
    procedure ComDataPacket1Packet(Sender: TObject; const Str: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
 ComDataPacket1.StopString:=#13#10;
 ComPort1.Open;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 ComPort1.Close;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 if ComPort1.Connected then
  ComPort1.WriteStr(Edit1.Text)
end;

procedure TForm1.ComDataPacket1Packet(Sender: TObject; const Str: string);
begin
 Memo1.Lines.Add(Str);
end;

procedure TForm1.ComPort1RxChar(Sender: TObject; Count: Integer);
var
 S:String;
begin
 ComPort1.ReadStr(S, Count);
 Memo1.Lines.Add(S);
end;

end.
