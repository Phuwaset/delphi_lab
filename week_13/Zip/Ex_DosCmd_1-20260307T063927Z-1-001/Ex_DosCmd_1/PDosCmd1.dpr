program PDosCmd1;

uses
  Vcl.Forms,
  UDosCmd1 in 'UDosCmd1.pas' {Frm1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrm1, Frm1);
  Application.Run;
end.
