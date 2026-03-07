program App_SMS_Send;

uses
  Vcl.Forms,
  App_sms in 'App_sms.pas' {Form5};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
