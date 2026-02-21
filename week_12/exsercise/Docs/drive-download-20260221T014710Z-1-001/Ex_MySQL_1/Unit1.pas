unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Buttons;

type
  TForm1 = class(TForm)
    FDConnection1: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit2: TEdit;
    DBNavigator1: TDBNavigator;
    FDTable1: TFDTable;
    FDTable1no: TFDAutoIncField;
    FDTable1recdate: TDateTimeField;
    FDTable1volt: TSingleField;
    FDTable1amp: TSingleField;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
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
begin
 Edit1.Text:=FloatToStr(FDTable1volt.Value);    // read
 Edit2.Text:=FloatToStr(FDTable1amp.Value);    // read
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 FDTable1.Edit;     // edit
 FDTable1recdate.Value:=Now;
 FDTable1volt.Value:=StrToFloat(Edit1.Text);
 FDTable1amp.Value:=StrToFloat(Edit2.Text);
 FDTable1.Post;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 FDTable1.Append;      // Insert at last
 FDTable1recdate.Value:=Now;
 FDTable1volt.Value:=StrToFloat(Edit1.Text);
 FDTable1amp.Value:=StrToFloat(Edit2.Text);
 FDTable1.Post;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
 FDTable1.Delete;      // Insert at current position
 //FDTable1recdate.Value:=Now;
 //FDTable1volt.Value:=StrToFloat(Edit1.Text);
 //FDTable1amp.Value:=StrToFloat(Edit2.Text);
 FDTable1.Refresh;
end;

end.
