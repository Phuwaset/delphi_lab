unit App_1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, ShellApi;

type
  TFrMain = class(TForm)
    Btn1: TBitBtn;
    Btn2: TBitBtn;
    Btn3: TBitBtn;
    Btn4: TBitBtn;
    procedure Btn1Click(Sender: TObject);
    procedure Btn2Click(Sender: TObject);
    procedure Btn3Click(Sender: TObject);
    procedure Btn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrMain: TFrMain;

implementation

{$R *.dfm}

procedure TFrMain.Btn1Click(Sender: TObject);
begin
 ShellExecute(Handle, 'open',
'c:\Windows\notepad.exe', nil, nil, SW_SHOWNORMAL) ;
end;

procedure TFrMain.Btn2Click(Sender: TObject);
begin
ShellExecute(Handle,'open',
'c:\windows\notepad.exe',
'D:\test.txt', nil, SW_SHOWNORMAL) ;
end;

procedure TFrMain.Btn3Click(Sender: TObject);
begin
 ShellExecute(Handle, 'open',
'http://www.google.com',nil,nil, SW_SHOWNORMAL) ;
end;

procedure TFrMain.Btn4Click(Sender: TObject);
begin
ShellExecute(Handle, 'open', 'c:\windows\Videos\V1.mp4', nil, nil, SW_SHOWNORMAL);
end;

end.
