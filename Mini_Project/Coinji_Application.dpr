program Coinji_Application;

uses
  Vcl.Forms,
  Coinji_App in 'Coinji_App.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
