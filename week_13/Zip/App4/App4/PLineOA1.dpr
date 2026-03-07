program PLineOA1;

uses
  Vcl.Forms,
  ULineOA1_project in '..\..\..\Assign\ULineOA1_project.pas' {Form7};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm7, Form7);
  Application.Run;
end.
