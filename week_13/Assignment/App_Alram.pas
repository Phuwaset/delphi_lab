unit App_Alram;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,MMSystem, Vcl.MPlayer;

type
  TFrMain = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MediaPlayer: TMediaPlayer;
    Opd: TOpenDialog;
    Label4: TLabel;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrMain: TFrMain;

implementation

{$R *.dfm}

procedure TFrMain.Button1Click(Sender: TObject);
begin
  PlaySound('D:\alarm.wav', 0, SND_ASYNC or SND_FILENAME);
end;

procedure TFrMain.Button2Click(Sender: TObject);
begin
  PlaySound(nil,0,0);
end;

procedure TFrMain.Button3Click(Sender: TObject);
begin
  MessageBeep(MB_TOPMOST);
end;

procedure TFrMain.Button4Click(Sender: TObject);
begin
  Beep;
end;

procedure TFrMain.Button5Click(Sender: TObject);
begin
  Opd.Filter := 'Audio Files|* .mp3;* .wav; .mid|All Fil*';
  if Opd.Execute then
  begin
    MediaPlayer.Close;
    MediaPlayer.FileName := Opd.FileName;
    MediaPlayer.Open;
  end;
end;

procedure TFrMain.Button6Click(Sender: TObject);
begin
  MediaPlayer.Play;
end;

procedure TFrMain.Button7Click(Sender: TObject);
begin
  MediaPlayer.Stop;
end;

end.
