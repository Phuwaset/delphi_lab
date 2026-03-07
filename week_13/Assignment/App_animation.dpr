program App_animation;

uses
  Vcl.Forms,
  App_animation_project in 'App_animation_project.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
