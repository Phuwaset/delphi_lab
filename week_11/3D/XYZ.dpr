program XYZ;

uses
  System.StartUpCopy,
  FMX.Forms,
  Xyz_app in 'Xyz_app.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
