unit App_3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  FireDAC.Comp.Client, FireDAC.Phys.MySQL, FireDAC.DApt, Vcl.ExtCtrls, Vcl.DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Phys, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Phys.MySQLDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, Vcl.Buttons,
  FireDAC.Comp.DataSet, Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Bind.Grid,
  System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope;

type
  TForm4 = class(TForm)
    FDTable1: TFDTable;
    DataSource1: TDataSource;
    FDConnection1: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Edit1: TEdit; // วันที่
    Edit2: TEdit; // Volt
    Edit3: TEdit; // Amp
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    SaveFile: TButton;
    Load: TButton;
    StringGrid1: TStringGrid;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure SaveFileClick(Sender: TObject);
    procedure LoadClick(Sender: TObject);
  private
    { Private declarations }
    MyDataPath: String;
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.FormCreate(Sender: TObject);
begin
  // กำหนดที่อยู่ไฟล์ Log ไว้ที่เดียวกับตัวโปรแกรม
  MyDataPath := ExtractFilePath(ParamStr(0)) + 'MachineLog.txt';
  Edit1.Text := DateTimeToStr(Now);

  // เปิดการเชื่อมต่อฐานข้อมูล
  try
    FDTable1.Active := True;
  except
    on E: Exception do ShowMessage('DB Error: ' + E.Message);
  end;
end;

procedure TForm4.SaveFileClick(Sender: TObject);
var
  F: TextFile;
  LogLine: String;
begin
  try
    // --- 1. เพิ่มข้อมูลลง MySQL (DBGrid1 จะอัปเดตเอง) ---
    FDTable1.Append;
    FDTable1.FieldByName('redate').AsDateTime := Now;
    FDTable1.FieldByName('volt').AsFloat := StrToFloatDef(Edit2.Text, 0);
    FDTable1.FieldByName('amp').AsFloat := StrToFloatDef(Edit3.Text, 0);
    FDTable1.Post;

    // --- 2. บันทึกข้อมูลสำรองลง Text File ---
    AssignFile(F, MyDataPath);
    if FileExists(MyDataPath) then Append(F) else Rewrite(F);

    // บันทึกรูปแบบ: วันที่,Volt,Amp
    LogLine := Edit1.Text + ',' + Edit2.Text + ',' + Edit3.Text;
    Writeln(F, LogLine);
    CloseFile(F);

    ShowMessage('บันทึกข้อมูลลงฐานข้อมูลและไฟล์ Log สำเร็จ');
  except
    on E: Exception do ShowMessage('Error: ' + E.Message);
  end;
end;

procedure TForm4.LoadClick(Sender: TObject);
begin
  // ทำหน้าที่ Refresh ข้อมูลจากฐานข้อมูลมาโชว์ใน DBGrid1
  FDTable1.Close;
  FDTable1.Open;
  ShowMessage('อัปเดตข้อมูลล่าสุดจากฐานข้อมูลแล้ว');
end;

end.
