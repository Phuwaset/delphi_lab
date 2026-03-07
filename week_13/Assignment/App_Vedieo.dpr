program App_Vedieo;

uses
  Vcl.Forms,
  App_video in 'App_video.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
