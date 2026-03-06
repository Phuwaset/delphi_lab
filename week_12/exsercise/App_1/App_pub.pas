unit App_pub;

interface

uses
  Winapi.Windows, Winapi.ShellAPI,
  System.SysUtils,
  Vcl.Forms, Vcl.StdCtrls, Vcl.Controls, Vcl.Dialogs, System.Classes;

type
  TForm5 = class(TForm)
    Edit1   : TEdit;    // Topic
    Edit2   : TEdit;    // Payload
    Edit3   : TEdit;    // QoS
    Button1 : TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;  // Publish
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.FormCreate(Sender: TObject);
begin
  Edit1.Text := 'sensor/temperature';
  Edit2.Text := '25.4';
  Edit3.Text := '1';
  Button1.Caption := 'Publish';
end;

procedure TForm5.Button1Click(Sender: TObject);
var
  Cmd : string;
begin
  Cmd := Format('mosquitto_pub -h localhost -t "%s" -m "%s" -q %s',
                [Edit1.Text, Edit2.Text, Edit3.Text]);

  ShellExecute(Handle, 'open', 'cmd.exe',
               PChar('/c ' + Cmd),
               PChar('C:\Program Files\Mosquitto'),
               SW_HIDE);

  ShowMessage('📤 Published!'#13#10 +
              'Topic  : ' + Edit1.Text + #13#10 +
              'Payload: ' + Edit2.Text);
end;

end.
