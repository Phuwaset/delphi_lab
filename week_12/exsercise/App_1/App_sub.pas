unit App_sub;

interface

uses
  Winapi.Windows, Winapi.ShellAPI,
  System.SysUtils, System.Classes,
  Vcl.Forms, Vcl.StdCtrls, Vcl.Grids,
  Vcl.Controls, Vcl.ExtCtrls, Vcl.Dialogs;

type
  TForm6 = class(TForm)
    StringGrid1 : TStringGrid;
    EditHost    : TEdit;
    EditTopic   : TEdit;
    Memo1       : TMemo;
    Button1     : TButton;
    Timer1      : TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    FRunning  : Boolean;
    FRowCount : Integer;
    FLogFile  : string;
    FLastSize : Int64;
    procedure StartSubscribe;
    procedure StopSubscribe;
    procedure ReadLogFile;
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

const
  MOSQ_PATH = 'C:\Program Files\Mosquitto\mosquitto_sub.exe';

procedure TForm6.FormCreate(Sender: TObject);
begin
  FRunning  := False;
  FRowCount := 1;
  FLastSize := 0;

  // ไฟล์ log เก็บไว้ที่ Desktop
  FLogFile := GetEnvironmentVariable('USERPROFILE') +
              '\Desktop\mqtt_log.txt';

  EditHost.Text   := 'localhost';
  EditTopic.Text  := 'sensor/#';
  Button1.Caption := 'Subscribe';

  // StringGrid header
  StringGrid1.ColCount     := 3;
  StringGrid1.RowCount     := 2;
  StringGrid1.FixedRows    := 1;
  StringGrid1.Cells[0, 0] := 'Time';
  StringGrid1.Cells[1, 0] := 'Topic';
  StringGrid1.Cells[2, 0] := 'Payload';
  StringGrid1.ColWidths[0] := 80;
  StringGrid1.ColWidths[1] := 150;
  StringGrid1.ColWidths[2] := 250;

  Timer1.Interval := 500;
  Timer1.Enabled  := False;
end;

procedure TForm6.FormDestroy(Sender: TObject);
begin
  StopSubscribe;
end;

procedure TForm6.StartSubscribe;
var
  SI      : TStartupInfo;
  PI      : TProcessInformation;
  CmdLine : string;
begin
  // ลบไฟล์ log เก่าก่อน
  if FileExists(FLogFile) then
    DeleteFile(FLogFile);
  FLastSize := 0;

  CmdLine := 'cmd.exe /c ""C:\Program Files\Mosquitto\mosquitto_sub.exe"' +
             ' -h ' + EditHost.Text +
             ' -t "' + EditTopic.Text + '"' +
             ' -v >> "' + FLogFile + '""';

  FillChar(SI, SizeOf(SI), 0);
  SI.cb          := SizeOf(SI);
  SI.dwFlags     := STARTF_USESHOWWINDOW;
  SI.wShowWindow := SW_HIDE;

  UniqueString(CmdLine);

  if CreateProcess(nil, PChar(CmdLine),
                   nil, nil, False,
                   CREATE_NO_WINDOW,
                   nil, nil, SI, PI) then
  begin
    CloseHandle(PI.hThread);
    CloseHandle(PI.hProcess);

    FRunning          := True;
    Timer1.Enabled    := True;
    Button1.Caption   := 'Disconnect';
    EditHost.Enabled  := False;
    EditTopic.Enabled := False;

    Memo1.Lines.Add('[' + FormatDateTime('hh:nn:ss', Now) +
                    '] ✅ Subscribed: "' + EditTopic.Text + '"');
  end
  else
    ShowMessage('❌ CreateProcess Error: ' +
                SysErrorMessage(GetLastError));
end;
procedure TForm6.StopSubscribe;
begin
  FRunning       := False;
  Timer1.Enabled := False;

  // Kill mosquitto_sub
  ShellExecute(0, 'open', 'cmd.exe',
               '/c taskkill /F /IM mosquitto_sub.exe',
               nil, SW_HIDE);

  Button1.Caption   := 'Subscribe';
  EditHost.Enabled  := True;
  EditTopic.Enabled := True;
  Memo1.Lines.Add('[' + FormatDateTime('hh:nn:ss', Now) +
                  '] 🔌 Disconnected');
end;

procedure TForm6.ReadLogFile;
var
  F       : TFileStream;
  Buf     : TBytes;
  Lines   : TStringList;
  NewSize : Int64;
  NewData : string;
  Line    : string;
  Parts   : TArray<string>;
begin
  if not FileExists(FLogFile) then Exit;

  try
    F := TFileStream.Create(FLogFile,
           fmOpenRead or fmShareDenyNone);
    try
      NewSize := F.Size;
      if NewSize <= FLastSize then Exit;

      // อ่านเฉพาะส่วนใหม่
      F.Position := FLastSize;
      SetLength(Buf, NewSize - FLastSize);
      F.ReadBuffer(Buf[0], Length(Buf));
      FLastSize := NewSize;
    finally
      F.Free;
    end;

    NewData := TEncoding.UTF8.GetString(Buf);

    Lines := TStringList.Create;
    try
      Lines.Text := NewData;
      for Line in Lines do
      begin
        if Trim(Line) = '' then Continue;

        // mosquitto_sub -v แสดง: "topic payload"
        Parts := Trim(Line).Split([' '], 2);

        Memo1.Lines.Add('[' + FormatDateTime('hh:nn:ss', Now) +
                        '] 📥 ' + Line);

        if Length(Parts) >= 2 then
        begin
          Inc(FRowCount);
          StringGrid1.RowCount            := FRowCount + 1;
          StringGrid1.Cells[0, FRowCount] := FormatDateTime('hh:nn:ss', Now);
          StringGrid1.Cells[1, FRowCount] := Parts[0];
          StringGrid1.Cells[2, FRowCount] := Parts[1];
          StringGrid1.Row := FRowCount;
        end;
      end;
    finally
      Lines.Free;
    end;

  except
    // ไฟล์ถูกใช้งานอยู่ รอรอบหน้า
  end;
end;

procedure TForm6.Timer1Timer(Sender: TObject);
begin
  if FRunning then
    ReadLogFile;
end;

procedure TForm6.Button1Click(Sender: TObject);
begin
  if not FRunning then
    StartSubscribe
  else
    StopSubscribe;
end;

end.
