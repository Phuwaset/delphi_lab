unit USendMail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdSMTP, Vcl.StdCtrls, IdMessage, IdSSL, IdSSLOpenSSL,
  IdExplicitTLSClientServerBase;

  {Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, DBClient, Vcl.StdCtrls, ppCtrls, ppPrnabl, ppClass,
  ppBands, ppCache, ppDB, ppDesignLayer, ppParameter, ppDBPipe, ppComm,
  ppRelatv, ppProd, ppReport, QImport3, QImport3Xlsx, Vcl.ExtCtrls, Vcl.DBCtrls,
  Math, Printers, Vcl.OleCtrls, Excel2000, Vcl.OleServer, Vcl.Buttons,
  VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series,
  VCLTee.TeeProcs, VCLTee.Chart, IdSMTP, IdComponent, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdBaseComponent,
  IdMessage, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdMessageClient, IdSMTPBase, Excel2010, Vcl.ExtDlgs, IdServerIOHandler; }

type
 TEmailDetail = record
  User, Pass, FromAddr, ToAddr, Subject, Body, Info, FilePath:String;
end;

type
  TForm6 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
   myEmailDetail:TEmailDetail;
   procedure SendEmail(myEmailDetail: TEmailDetail);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

{ TForm6 }

procedure TForm6.Button1Click(Sender: TObject);
begin
 myEmailDetail.User:=inputbox('E-mail details',
 'Please type your username', 'xxx@cit.kmutnb.ac.th');
 myEmailDetail.Pass:=inputbox('E-mail details',
 'Please type your password', 'xxx');
 myEmailDetail.Subject:=inputbox('E-mail details',
 'Please type your subject', 'Subject');
 myEmailDetail.FromAddr:=myEmailDetail.User;
 myEmailDetail.ToAddr:=inputbox('E-mail details',
 'Please type Send to Email', 'xxx@hotmail.com');
 myEmailDetail.Body:=inputbox('E-mail details',
 'Please type your Body', 'test body');

 SendEmail(myEmailDetail);

end;

procedure TForm6.SendEmail(myEmailDetail: TEmailDetail);
var
 IdSMTP : TIdSMTP;
 IdMessage : TIdMessage;
 AuthSSL : TIdSSLIOHandlerSocketOpenSSL;
begin
 IdSMTP := TIdSMTP.Create(nil);
 try
  IdMessage := TIdMessage.Create(nil);
   try
    AuthSSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
     try
      IdSMTP.Host := 'smtp.gmail.com';
      IdSMTP.Port := 587;//465
      IdSMTP.AuthType := satDefault;
      IdSMTP.Username := myEmailDetail.User;
      IdSMTP.Password := myEmailDetail.Pass;
      IdSMTP.IOHandler := AuthSSL;
      IdSMTP.UseTLS := utUseExplicitTLS;
      AuthSSL.SSLOptions.Method := sslvSSLv23;
      AuthSSL.SSLOptions.Mode := sslmClient;
      IdSMTP.AuthType := satDefault;

      IdSMTP.Connect;
      if IdSMTP.Authenticate then
       begin
        IdMessage.AttachmentEncoding:='MIME';
        IdMessage.Encoding := mePlainText; // worked
        IdMessage.ContentType:='text/plain';
        IdMessage.CharSet:= 'utf-8';			// need to set Charset after ContentType (Protect it change after set Contentype)
        IdMessage.From.Address := myEmailDetail.FromAddr;
        IdMessage.Recipients.EMailAddresses := myEmailDetail.ToAddr;
        IdMessage.Subject := UTF8Encode(myEmailDetail.Subject);
        IdMessage.Body.Text := UTF8Encode(myEmailDetail.Body);
        IdSMTP.Send(IdMessage);
       end;

     finally
      FreeAndNil(AuthSSL);
     end;
   finally
    IdSMTP.Disconnect;
    FreeAndNil(IdMessage);
   end;
 finally
  FreeAndNil(IdSMTP);
 end;
end;


end.
