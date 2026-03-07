program PShellApi1;

uses
  Vcl.Forms,
  UShellApi1 in 'UShellApi1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
