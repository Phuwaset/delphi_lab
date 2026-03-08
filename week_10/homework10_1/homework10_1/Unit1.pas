unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Win.ScktComp;

type
  TForm3 = class(TForm)
    ClientSocket1: TClientSocket;
    BtnConnect: TButton;
    ButtonRead: TButton;
    Memo1: TMemo;
    procedure BtnConnectClick(Sender: TObject);
    procedure ButtonReadClick(Sender: TObject);
    procedure ButtonWrite1Click(Sender: TObject);
    procedure ButtonWrite0Click(Sender: TObject);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocket1Connect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocket1Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ClientSocket1Disconnect(Sender: TObject; Socket: TCustomWinSocket);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

// 1. ปุ่มเชื่อมต่อ Server
procedure TForm3.BtnConnectClick(Sender: TObject);
begin
  if ClientSocket1.Active then
  begin
    ClientSocket1.Active := False; // สั่งปิดการเชื่อมต่อ
  end
  else
  begin
    // รันบนเครื่องเดียวกัน ใช้ 127.0.0.1 ได้เลยครับ ไม่ต้องง้อ IP ของวง LAN
    ClientSocket1.Host := '127.0.0.1';
    ClientSocket1.Port := 8080;        // แก้ให้ตรงกับ Server ของคุณแล้ว
    ClientSocket1.Active := True;      // สั่งเริ่มเชื่อมต่อ
  end;
end;

// Event เมื่อเชื่อมต่อสำเร็จ
procedure TForm3.ClientSocket1Connect(Sender: TObject; Socket: TCustomWinSocket);
begin
  BtnConnect.Caption := 'Disconnect';
  Memo1.Lines.Add('Connected to Server successfully!');
end;

// Event เมื่อถูกตัดการเชื่อมต่อ
procedure TForm3.ClientSocket1Disconnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  BtnConnect.Caption := 'BtnConnect';
  Memo1.Lines.Add('Disconnected from Server.');
end;

// Event ดักจับ Error เผื่อ Server ยังไม่ได้เปิด (ป้องกันโปรแกรมเด้ง)
procedure TForm3.ClientSocket1Error(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  Memo1.Lines.Add('Connection Error! Code: ' + IntToStr(ErrorCode));
  ErrorCode := 0; // เคลียร์ Error ทิ้ง
end;

// 2. Event รับข้อมูลที่ Server (รูปขวามือ) ตอบกลับมา
procedure TForm3.ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
var
  IncomingData: string;
begin
  IncomingData := Socket.ReceiveText;
  Memo1.Lines.Add('Server says: ' + IncomingData);
end;

// 3. ปุ่มสั่งอ่าน Input0
procedure TForm3.ButtonReadClick(Sender: TObject);
begin
  if ClientSocket1.Active then
    ClientSocket1.Socket.SendText('READ_IN0')
  else
    Memo1.Lines.Add('Please connect first.');
end;

// 4. ปุ่มสั่งเขียน Output0 เป็น ON
procedure TForm3.ButtonWrite1Click(Sender: TObject);
begin
  if ClientSocket1.Active then
    ClientSocket1.Socket.SendText('WRITE_OUT0_1')
  else
    Memo1.Lines.Add('Please connect first.');
end;

// 5. ปุ่มสั่งเขียน Output0 เป็น OFF
procedure TForm3.ButtonWrite0Click(Sender: TObject);
begin
  if ClientSocket1.Active then
    ClientSocket1.Socket.SendText('WRITE_OUT0_0')
  else
    Memo1.Lines.Add('Please connect first.');
end;

end.
