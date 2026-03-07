program App_Alram_Application;

uses
  Vcl.Forms,
  App_Alram in 'App_Alram.pas' {FrMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrMain, FrMain);
  Application.Run;
end.
