unit ULineOA1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Net.HttpClient, System.Net.URLClient, System.JSON,
  Vcl.StdCtrls, System.NetConsts, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP,Winapi.MMSystem;
const

 YOUR_ACCESS_TOKEN = 'xxx';
 GROUP_ID = 'xxxx';
type
  TForm7 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    IdHTTP1: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

{$R *.dfm}


procedure SendLineMessage(const AccessToken, ToUserId: string; const MsgType: string);
var
  HttpClient: THTTPClient;
  JsonObj: TJSONObject;
  Msgs: TJSONArray;
  Msg: TJSONObject;
  Response: IHTTPResponse;
begin
  HttpClient := THTTPClient.Create();
  try
    HttpClient.CustomHeaders['Authorization'] := 'Bearer ' + AccessToken;
    HttpClient.ContentType := 'application/json';

    // สร้าง JSON
    JsonObj := TJSONObject.Create;
    try
      JsonObj.AddPair('to', ToUserId);
      Msgs := TJSONArray.Create;
      JsonObj.AddPair('messages', Msgs);

      if MsgType = 'text' then
      begin
        Msg := TJSONObject.Create;
        Msg.AddPair('type', 'text');
        Msg.AddPair('text', 'Hello Delphi!');
        Msgs.AddElement(Msg);
      end
      else if MsgType = 'image' then
      begin
        Msg := TJSONObject.Create;
        Msg.AddPair('type', 'image');
        Msg.AddPair('originalContentUrl', 'https://www.minrobots.com/index_files/image004.jpg');
        Msg.AddPair('previewImageUrl', 'https://www.minrobots.com/index_files/image004.jpg');
        Msgs.AddElement(Msg);
      end
      else if MsgType = 'video' then
      begin
        Msg := TJSONObject.Create;
        Msg.AddPair('type', 'video');
        Msg.AddPair('originalContentUrl', 'https://example.com/video.mp4');
        Msg.AddPair('previewImageUrl', 'https://example.com/preview.jpg');
        Msgs.AddElement(Msg);
      end
      else if MsgType = 'sticker' then
      begin
        Msg := TJSONObject.Create;
        Msg.AddPair('type', 'sticker');
        Msg.AddPair('packageId', '1');
        Msg.AddPair('stickerId', '1');
        Msgs.AddElement(Msg);
      end;

      Response := HttpClient.Post(
        'https://api.line.me/v2/bot/message/push',
        TStringStream.Create(JsonObj.ToJSON, TEncoding.UTF8)
      );

      ShowMessage(Response.StatusText);
      if Response.StatusCode = 200 then
        ShowMessage('hello!')
      else
        ShowMessage('q: ' + Response.StatusText);
    finally
      JsonObj.Free;
    end;

  finally
    HttpClient.Free;
  end;
end;

procedure SendLineMessage_Indy(const AccessToken, ToUserId, MsgType: string);
var
  Http: TIdHTTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
  JsonObj, Msg: TJSONObject;
  Msgs: TJSONArray;
  Stream: TStringStream;
  Response: string;
begin
  Http := TIdHTTP.Create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  try
    // ตั้งค่า SSL
    Http.IOHandler := SSL;
    SSL.SSLOptions.Method := sslvTLSv1_2;
    SSL.SSLOptions.Mode := sslmUnassigned;

    Http.Request.CustomHeaders.Values['Authorization'] := 'Bearer ' + AccessToken;
    Http.Request.ContentType := 'application/json';
    Http.Request.CharSet := 'utf-8';

    // สร้าง JSON payload
    JsonObj := TJSONObject.Create;
    Msgs := TJSONArray.Create;
    Msg := TJSONObject.Create;
    try
      JsonObj.AddPair('to', ToUserId);
      JsonObj.AddPair('messages', Msgs);

      if MsgType = 'text' then
      begin
        Msg.AddPair('type', 'text');
        Msg.AddPair('text', 'Hello Delphi!');
      end
      else if MsgType = 'image' then
      begin
        Msg.AddPair('type', 'image');
        Msg.AddPair('originalContentUrl', 'https://minlands.com/453536_0.jpg');
        Msg.AddPair('previewImageUrl', 'https://minlands.com/453536_0.jpg');
      end
      else if MsgType = 'video' then
      begin
        Msg.AddPair('type', 'video');
        Msg.AddPair('originalContentUrl', 'https://example.com/video.mp4');
        Msg.AddPair('previewImageUrl', 'https://example.com/preview.jpg');
      end
      else if MsgType = 'sticker' then
      begin
        Msg.AddPair('type', 'sticker');
        Msg.AddPair('packageId', '1');
        Msg.AddPair('stickerId', '1');
      end;

      Msgs.AddElement(Msg);

      Stream := TStringStream.Create(JsonObj.ToJSON, TEncoding.UTF8);
      try
        Response := Http.Post('https://api.line.me/v2/bot/message/push', Stream);
        ShowMessage('hi' + Response);
      finally
        Stream.Free;
      end;
    finally
      JsonObj.Free;
    end;

  except
    on E: Exception do
      ShowMessage('Hello: ' + E.Message);
  end;

  Http.Free;
  SSL.Free;
end;


procedure TForm7.Button1Click(Sender: TObject);
begin
  //SendLineMessage(YOUR_ACCESS_TOKEN, GROUP_ID, 'text');

  //SendLineMessage(YOUR_ACCESS_TOKEN, GROUP_ID, 'image');

  //SendLineMessage(YOUR_ACCESS_TOKEN, GROUP_ID, 'video');

  //SendLineMessage(YOUR_ACCESS_TOKEN, GROUP_ID, 'sticker');
  SendLineMessage(Edit1.Text, Edit2.Text, 'text');
end;

procedure TForm7.Button2Click(Sender: TObject);
begin
 //SendLineMessage_Indy(YOUR_ACCESS_TOKEN, GROUP_ID, 'text');
 //SendLineMessage_Indy(YOUR_ACCESS_TOKEN, GROUP_ID, 'image');
 SendLineMessage_Indy(Edit1.Text, Edit2.Text, 'image');
end;

end.
