unit App_2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IniFiles, Vcl.StdCtrls;

type
  TForm3 = class(TForm)
    Button2: TButton;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    CheckBox1: TCheckBox;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    { Private declarations }
    iniFilePath:String;
    procedure ReadIniCfg();
    procedure WriteIniCfg();
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
 iniFilePath:=ExtractFilePath(ParamStr(0)) + 'cfg.ini';
 // save configulation ?????????????????????????????
 if not FileExists(iniFilePath) then
  WriteIniCfg   // Set Object Config as Default
 else
  ReadIniCfg;
end;

procedure TForm3.FormDestroy(Sender: TObject);
begin
  WriteIniCfg;
end;

procedure TForm3.ReadIniCfg;
var
  vIni:TIniFile;
begin
  vIni:=TIniFile.Create(iniFilePath);
  try
   Edit1.Text:=vIni.ReadString(Edit1.ClassName, 'Edit1.Text', '');
   ComboBox1.ItemIndex:=vIni.ReadInteger(ComboBox1.ClassName, 'ComboBox1.ItemIndex', 0);
   CheckBox1.Checked:=vIni.ReadBool(CheckBox1.ClassName, 'CheckBox1.Checked', False);
  finally
   vIni.Free;
  end;
end;

procedure TForm3.WriteIniCfg;
var
  vIni:TIniFile;
begin
  vIni:=TIniFile.Create(iniFilePath);
  try
   vIni.WriteString(Edit1.ClassName, 'Edit1.Text', Edit1.Text);
   vIni.WriteInteger(ComboBox1.ClassName, 'ComboBox1.ItemIndex', ComboBox1.ItemIndex);
   vIni.WriteBool(CheckBox1.ClassName, 'CheckBox1.Checked', CheckBox1.Checked);
  finally
   vIni.Free;
  end;
end;
end.
