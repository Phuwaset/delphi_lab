unit App_video;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, WMPLib_TLB, Vcl.StdCtrls,
  Vcl.Buttons;

type
  TForm4 = class(TForm)
    WHP: TWindowsMediaPlayer;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Opd: TOpenDialog;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.BitBtn1Click(Sender: TObject);
begin
  Opd.Filter := 'Video Files|* .mp4;* .avi; .mkv';
  if Opd.Execute then
    WHP.URL := Opd.FileName;
end;

procedure TForm4.BitBtn2Click(Sender: TObject);
begin
  WHP.controls.play;
end;

procedure TForm4.BitBtn3Click(Sender: TObject);
begin
  WHP.controls.pause;
end;

procedure TForm4.BitBtn4Click(Sender: TObject);
begin
  WHP.controls.stop;
end;

procedure TForm4.BitBtn5Click(Sender: TObject);
begin
  WHP.fullScreen:= true;
end;

end.
