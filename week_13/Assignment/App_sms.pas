unit App_sms;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Net.URLClient,
  System.Net.HttpClient, System.Net.HttpClientComponent, Vcl.StdCtrls,System.JSON;

type
  TForm5 = class(TForm)
    NetHTTPClient1: TNetHTTPClient;
    NetHTTPRequest1: TNetHTTPRequest;
    MemoLog: TMemo;
    BtnSend: TButton;
    procedure BtnSendClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.BtnSendClick(Sender: TObject);
var
  LHttpClient: TNetHTTPClient;
  LResponse: IHTTPResponse;
  LHeader: TNetHeaders;
  LJsonData: TJSONObject;
  LToArr: TJSONArray;
  LSource: TStringStream;
  URL: string;
begin
  URL := 'https://console.sms-kub.com/api/messages';

  // 1. สร้าง JSON Data
  LJsonData := TJSONObject.Create;
  try
    LToArr := TJSONArray.Create;
    LToArr.Add('0955134781'); // เบอร์ปลายทาง

    LJsonData.AddPair('to', LToArr);
    LJsonData.AddPair('from', 'SMS-DEMO');
    LJsonData.AddPair('message', 'ทดสอบส่ง SMS จาก Delphi');

    // 2. ตั้งค่า Header (เหมือนใน Python)
    SetLength(LHeader, 2);
    LHeader[0] := TNetHeader.Create('Content-Type', 'application/json');
    LHeader[1] := TNetHeader.Create('key', '5wsMXl4m9KS2Pld08CVnq7YRt6GffTc4');

    // เตรียม Stream สำหรับส่ง Body
    LSource := TStringStream.Create(LJsonData.ToString, TEncoding.UTF8);

    try
      // 3. ส่งคำขอแบบ POST
      LResponse := NetHTTPClient1.Post(URL, LSource, nil, LHeader);

      // 4. แสดงผลลัพธ์
      MemoLog.Lines.Add('STATUS = ' + LResponse.StatusCode.ToString);
      MemoLog.Lines.Add('RESPONSE TEXT = ' + LResponse.ContentAsString());

    finally
      LSource.Free;
    end;
  finally
    LJsonData.Free;
  end;
end;
end.
