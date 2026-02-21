unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
 P:String;
begin
 P:=ExtractFilePath(Application.ExeName)+'xx';
 if DirectoryExists(P) then
  ShowMessage(P + ' exists already')
 else
  begin
   if CreateDir(P) then
    ShowMessage('Directory created: ' + P)
   else
    ShowMessage('Could not create ' + P);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
 P:String;
begin
 P:=ExtractFilePath(Application.ExeName)+'xx';
 if DirectoryExists(P) then
   ShowMessage(P + ' exists already')
 else
  begin
   ForceDirectories(P);
   if DirectoryExists(P) then
    ShowMessage('Directory created: ' + P)
   else
    ShowMessage('Could not create ' + P);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 Label1.Caption:=ExtractFilePath(Application.ExeName);
end;

end.
