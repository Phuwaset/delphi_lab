unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

 Type
 TMyData = record
  MyName:String;
  MyFloat:Single;
  MyInt:Integer;
 end;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
   MyData:TMyData;
   MyDataFile:TextFile;
   MyDataPath:String;


   procedure LoadMyData();
   procedure DefaultMyData();
   procedure SaveMyData();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
begin
 MyData.MyName:=Edit1.Text;
 MyData.MyFloat:=StrToFloat(Edit2.Text);
 MyData.MyInt:=StrToInt(Edit3.Text);

 SaveMyData;
end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 LoadMyData;
 Edit1.Text:=MyData.MyName;
 Edit2.Text:=FloatToStr(MyData.MyFloat);
 Edit3.Text:=IntToStr(MyData.MyInt);
end;

procedure TForm1.DefaultMyData;
begin
 MyData.MyName:='xxx';
 MyData.MyFloat:=1.23;
 MyData.MyInt:=12;

 SaveMyData;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 MyDataPath:=ExtractFilePath(Application.ExeName)+'MyFile.yyy';
end;

procedure TForm1.LoadMyData;
var
 Buff, Key, Data:String;
begin
 if FileExists(MyDataPath) then
  begin
   AssignFile(MyDataFile, MyDataPath); {Assigns the Filename}
   Reset(MyDataFile); {Opens the file for reading}

   try

    Key:='MyName = ';
    Readln(MyDataFile, Buff);
    Data:=Copy(Buff, Pos(Key, Buff)+Length(Key), Length(Buff) - Length(Key));
    MyData.MyName:=Trim(Data);

    Key:='MyFloat = ';
    Readln(MyDataFile, Buff);
    Data:=Copy(Buff, Pos(Key, Buff)+Length(Key), Length(Buff) - Length(Key));
    MyData.MyFloat:=StrToFloat(Trim(Data));

    Key:='MyInt = ';
    Readln(MyDataFile, Buff);
    Data:=Copy(Buff, Pos(Key, Buff)+Length(Key), Length(Buff) - Length(Key));
    MyData.MyInt:=StrToInt(Trim(Data));

   except
    Closefile(MyDataFile); {Closes file}
    DefaultMyData;
    ShowMessage('Program Configuration Error Program will Load Default!');
    //Close;
   end;
   Closefile(MyDataFile); {Closes file}
  end
 else
  DefaultMyData;
end;

procedure TForm1.SaveMyData;
var
 Buff:String;
begin
 AssignFile(MyDataFile, MyDataPath); {Assigns the Filename}
 ReWrite(MyDataFile); {Create a new file }
 //Append(MyDataFile); {Create a new file }

 Buff:='MyName = '+MyData.MyName;
 Writeln(MyDataFile, Buff);
 Buff:='MyFloat = '+FloatToStr(MyData.MyFloat);
 Writeln(MyDataFile, Buff);
 Buff:='MyInt = '+IntToStr(MyData.MyInt);
 Writeln(MyDataFile, Buff);

 Closefile(MyDataFile); {Closes file }
end;

end.
