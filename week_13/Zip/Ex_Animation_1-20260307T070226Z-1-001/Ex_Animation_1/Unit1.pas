unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  GifImg, Vcl.ExtDlgs, Vcl.MPlayer;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Button2: TButton;
    Edit1: TEdit;
    OpenDialog1: TOpenDialog;
    Button3: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    MediaPlayer1: TMediaPlayer;
    Animate1: TAnimate;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
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
 if OpenDialog1.Execute then
  begin
   Edit1.Text:=OpenDialog1.FileName;
   //MediaPlayer1.DeviceType:=dtAVIVideo;
   //MediaPlayer1.Display:=Animate1;
   //MediaPlayer1.AutoEnable:=True;
   //MediaPlayer1.AutoOpen:=True;
   MediaPlayer1.FileName:='D:\Work3\Kmutnb\2022\Compro1-65\Code\week13\outpy.avi';//Edit1.Text;
   //MediaPlayer1.Open;
   //MediaPlayer1.DisplayRect:=Form1.ClientRect;
   MediaPlayer1.Play;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
if OpenPictureDialog1.Execute then
 begin
  Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
 (Image1.Picture.Graphic as TGIFImage).Animate := True;
 (Image1.Picture.Graphic as TGIFImage).AnimationSpeed:=60;
 (Image1.Picture.Graphic as TGIFImage).AnimateLoop:=glContinously;
 end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 //if MediaPlayer1.m then
 MediaPlayer1.Play;

 //Animate1.Play(0, Animate1.FrameCount, 3);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
 (Image1.Picture.Graphic as TGIFImage).Animate := False;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
 (Image1.Picture.Graphic as TGIFImage).Animate := True;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
 //ShowMessage('Alarm');


  if MessageDlg('Welcome to my Delphi application.  Exit now?',
    mtWarning, [mbYes, mbNo], 0, mbYes) = mrYes then
  begin
    MessageDlg('Exiting the Delphi application.', mtError,
      [mbOk], 0, mbOk);
    Close;
  end;
//end;
end;

end.
