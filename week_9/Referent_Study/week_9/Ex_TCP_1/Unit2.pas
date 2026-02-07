unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Win.ScktComp;

type
  TForm2 = class(TForm)
    ServerSocket1: TServerSocket;
    Button1: TButton;
    Edit1: TEdit;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
 ServerSocket1.Open;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
 ServerSocket1.Close;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
 ServerSocket1.Socket.Connections[0].SendText(Edit1.Text);
end;

procedure TForm2.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
 S, Cmd1, Cmd2:String;
begin
 S:=Socket.ReceiveText;
 Memo1.Lines.Add(S);

 Cmd1:=Copy(S, 1, Pos(',', S)-1);
 Cmd2:=Copy(S, Pos(',', S)+1, Length(S)-1);
 Memo1.Lines.Add(Cmd1);
 Memo1.Lines.Add(Cmd2);

 if Cmd1 = 'r' then
  Form2.Color:=ClRed
 else if Cmd1 = 'b' then
  Form2.Color:=ClBlue;

 Form2.Caption:=Cmd2;
end;

{procedure TForm2.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
begin
 Memo1.Lines.Add(Socket.ReceiveText);
end; }

end.
