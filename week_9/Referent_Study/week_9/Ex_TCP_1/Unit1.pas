unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Win.ScktComp, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    ClientSocket1: TClientSocket;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit3: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
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
 ClientSocket1.Host:=Edit2.Text;
 ClientSocket1.Port:=StrToInt(Edit3.Text);
 ClientSocket1.Open;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 ClientSocket1.Close;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 ClientSocket1.Socket.SendText(Edit1.Text);
end;

procedure TForm1.ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
begin
 Memo1.Lines.Add(Socket.ReceiveText);
end;

end.
