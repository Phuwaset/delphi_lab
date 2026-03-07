unit App_animation_project;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtDlgs, Vcl.Buttons,
  Vcl.ExtCtrls,GifImg;

type
  TForm3 = class(TForm)
    Img1: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Opd1: TOpenPictureDialog;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
 (Img1.Picture.Graphic as TGIFImage).Animate := False;
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
begin
if Opd1.Execute then
  Img1.Picture.LoadFromFile(Opd1.FileName);
end;

procedure TForm3.BitBtn3Click(Sender: TObject);
begin
  (Img1.Picture.Graphic as TGIFImage).Animate := True;
end;

end.
