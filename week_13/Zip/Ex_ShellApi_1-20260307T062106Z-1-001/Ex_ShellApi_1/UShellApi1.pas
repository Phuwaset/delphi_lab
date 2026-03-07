unit UShellApi1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ShellApi, Vcl.StdCtrls,
  IdCustomTCPServer, IdTCPServer, IdCmdTCPServer, IdExplicitTLSClientServerBase,
  IdSMTPServer, IdComponent, IdTCPConnection, IdTCPClient, IdMessageClient,
  IdSMTPBase, IdBaseComponent, IdMailBox,
  IdSMTP, IdAttachment, IdMessage, IdMessageParts, IdEMailAddress, IdAttachmentFile;

type
  TForm1 = class(TForm)
    Bt1: TButton;
    Bt2: TButton;
    Bt3: TButton;
    Bt4: TButton;
    Bt5: TButton;
    Bt6: TButton;
    Bt8: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Bt7: TButton;
    IdMailBox1: TIdMailBox;
    SMTP: TIdSMTP;
    IdSMTPServer1: TIdSMTPServer;
    MailMessage: TIdMessage;
    StatusMemo: TMemo;
    OpenDialog1: TOpenDialog;
    procedure Bt1Click(Sender: TObject);
    procedure Bt2Click(Sender: TObject);
    procedure Bt3Click(Sender: TObject);
    procedure Bt4Click(Sender: TObject);
    procedure Bt5Click(Sender: TObject);
    procedure Bt6Click(Sender: TObject);
    procedure Bt7Click(Sender: TObject);
    procedure Bt8Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

//Run Notepad
procedure TForm1.Bt1Click(Sender: TObject);
begin
 ShellExecute(Handle, 'open',
'c:\Windows\notepad.exe', nil, nil, SW_SHOWNORMAL) ;
end;

//Open SomeText.txt With Notepad
procedure TForm1.Bt2Click(Sender: TObject);
begin
ShellExecute(Handle,'open',
'c:\windows\notepad.exe',
'D:\test.txt', nil, SW_SHOWNORMAL) ;
end;

//Display the Contents of the "DelphiDownload" Folder
procedure TForm1.Bt3Click(Sender: TObject);
begin
ShellExecute(Handle,'open',
'D:\test', nil, nil, SW_SHOWNORMAL) ;
end;

//Execute a File According to Its Extension
procedure TForm1.Bt4Click(Sender: TObject);
begin
 if OpenDialog1.Execute then
  ShellExecute(Handle, 'open',PWideChar(OpenDialog1.FileName) ,nil,nil,SW_SHOWNORMAL) ;
{ShellExecute(Handle, 'open',
'D:\abc.docx',nil,nil,SW_SHOWNORMAL) ;}
end;

//Open a Website or a *.htm File With the Default Web Explorer
procedure TForm1.Bt5Click(Sender: TObject);
begin
 ShellExecute(Handle, 'open',
'http://www.google.com',nil,nil, SW_SHOWNORMAL) ;
end;

//Send an Email With the Subject and the Message Body      (Don't Worked)
procedure TForm1.Bt6Click(Sender: TObject);
var
 em_subject, em_body, em_mail:string;
begin
 em_subject := 'This is the subject line';
 em_body := 'Message body text goes here';

 em_mail := 'mailto:kmin_5@hotmail.com?subject=' +
 em_subject + '&body=' + em_body ;

 ShellExecute(Handle,'open',
 PChar(em_mail), nil, nil, SW_SHOWNORMAL) ;
end;

//Execute a Program and Wait Until It Finishes   (don't work)
procedure TForm1.Bt7Click(Sender: TObject);
var
 SEInfo: TShellExecuteInfo;
 ExitCode: DWORD;
 ExecuteFile, ParamString, StartInString: string;
begin
 ExecuteFile:='C:\Windows\System32\Calc.exe';

 FillChar(SEInfo, SizeOf(SEInfo), 0) ;
 SEInfo.cbSize := SizeOf(TShellExecuteInfo) ;
 with SEInfo do begin
 fMask := SEE_MASK_NOCLOSEPROCESS;
 Wnd := Application.Handle;
 lpFile := PChar(ExecuteFile) ;
{
ParamString can contain the
application parameters.
}
// lpParameters := PChar(ParamString) ;
{
StartInString specifies the
name of the working directory.
If ommited, the current directory is used.
}
// lpDirectory := PChar(StartInString) ;
 nShow := SW_SHOWNORMAL;
 end;
 if ShellExecuteEx(@SEInfo) then begin
 repeat
 Application.ProcessMessages;
 GetExitCodeProcess(SEInfo.hProcess, ExitCode) ;
 until (ExitCode <> STILL_ACTIVE) or
 Application.Terminated;
 ShowMessage('Calculator terminated') ;
 end
 else ShowMessage('Error starting Calc!') ;
end;

procedure TForm1.Bt8Click(Sender: TObject);        //(Don't Worked)
begin
  StatusMemo.Clear;
  //setup SMTP
  SMTP.Host := 'smtp.gmail.com';
  SMTP.Port := 25;
  //setup mail message
  MailMessage.From.Address := 'supod.k@cit.kmutnb.ac.th';
  MailMessage.Recipients.EMailAddresses := 'kmin_5@hotmail.com' + ',' + 'kmin_5@yahoo.com';
  MailMessage.Subject := 'MySubject';
  MailMessage.Body.Text := 'My Body';
  if FileExists('E:\MyWord.docx') then TIdAttachmentFile.Create(MailMessage.MessageParts, 'E:\MyWord.docx') ;
  //send mail
  try
    try
      SMTP.Connect('imap.gmail.com') ;
      SMTP.Send(MailMessage) ;
    except on E:Exception do
      StatusMemo.Lines.Insert(0, 'ERROR: ' + E.Message) ;
    end;
  finally
    if SMTP.Connected then SMTP.Disconnect;
  end;
end;

procedure TForm1.Button5Click(Sender: TObject);     //(Don't Worked)
var
IdMessage1: TIdMessage;
IdSMTP1: TIdSMTP;
Addressee: TIdEmailAddressItem ;
Attachment: TIdAttachment;
begin

 IdMessage1 := TIdMessage.Create(nil);
 IdSMTP1 := TIdSMTP.Create(nil);
 IdSMTP1.Host := 'smtp.gmail.com'; // SMTP server host name

 IdMessage1.Body.Add('Hi Chee Wee, this is the secret plans for Highlander that we talked about.');
 IdMessage1.Subject := 'This message contains an attachment';
 IdMessage1.From.Text := 'supod.k@cit.kmutnb.ac.th';
 IdMessage1.From.Name := 'min ';

 Attachment := TIdAttachmentFile.Create(IdMessage1.MessageParts, 'E:\MyWord.docx');

 Addressee := IdMessage1.Recipients.Add;
 Addressee.Address := 'kmin_5@hotmail.com'; // email address of recipient
 Addressee.Name := 'Chee Wee Chua';

 IdSMTP1.Username := 'supod.k@cit.kmutnb.ac.th'; // SMTP user name
 IdSMTP1.Password := 'SupodKaewkorn2830'; // SMTP user password
 IdSMTP1.Connect;
 IdSMTP1.Send(IdMessage1);
 IdSMTP1.Disconnect;

 Attachment.Free;
 IdMessage1.Free;
 IdSMTP1.Free;
end;

end.

(* btnSendMail Click *)


