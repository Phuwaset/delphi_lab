unit Demo01_MainForm_6703016411302;


interface



uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,
  VFrames, Vcl.StdCtrls,JPEG;

type
  TForm1 = class(TForm)
    ImPreView1: TImage;
    ImCap1: TImage;
    Label1: TLabel;
    EdBarcode: TEdit;
    CbCam1: TComboBox;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdBarcodeChange(Sender: TObject);
    procedure CbCam1Change(Sender: TObject);
  private
    { Private declarations }
    fActivated : boolean;
    fVideoImage: TVideoImage;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.FormCreate(Sender: TObject);
begin
  //PaintBox1.Align := alClient;
  fActivated      := false;

  // Create instance of our video image class.
  fVideoImage     := TVideoImage.Create;
  // Tell fVideoImage where to paint the images it receives from the camera
  // (Only in case we do not want to modify the images by ourselves)
  //fVideoImage.SetDisplayCanvas(PaintBox1.Canvas);
  fVideoImage.SetDisplayCanvas(ImPreView1.Canvas);

  Caption := 'Demo01  [Initializing video...]';
end;




procedure TForm1.CbCam1Change(Sender: TObject);
begin
  // หยุดกล้องตัวเดิมก่อน
  fVideoImage.VideoStop;

  // เริ่มกล้องตัวใหม่ที่เลือกจาก ComboBox
  if CbCam1.ItemIndex <> -1 then
  begin
    fVideoImage.VideoStart(CbCam1.Text);
    Caption := '01 [' + CbCam1.Text + ']';
  end;
end;

procedure TForm1.EdBarcodeChange(Sender: TObject);
var
  MyJPEG: TJPEGImage;
  MyBitmap: TBitmap;
  FullFileName: string;
begin
  // เช็คเลข 13 หลักจาก Edit1 (ที่เดิม)
  if Length(Edit1.Text) = 13 then
  begin
    // สร้างชื่อไฟล์จาก Edit1.Text
    FullFileName := 'D:\image\' + Edit1.Text + '_' + FormatDateTime('dd-mm-yyyy_hh-nn-ss', Now) + '.jpg';

    MyJPEG := TJPEGImage.Create;
    MyBitmap := TBitmap.Create;
    try
      fVideoImage.GetBitmap(MyBitmap);
      MyJPEG.Assign(MyBitmap);
      MyJPEG.SaveToFile(FullFileName);

      ImCap1.Picture.Assign(MyJPEG); // แสดงภาพที่ Preview ช่องขวา

      // ล้างค่าใน Edit1 เพื่อรอรับเลข 13 หลักชุดต่อไป
      Edit1.SetFocus;
      Edit1.SelectAll;
    finally
      MyBitmap.Free;
      MyJPEG.Free;
    end;
  end;
end;
procedure TForm1.FormActivate(Sender: TObject);
var
  DeviceList: TStringList;
begin
  if fActivated then exit;
  fActivated := true;

  DeviceList := TStringList.Create;
  try
    fVideoImage.GetListOfDevices(DeviceList);

    if DeviceList.Count < 1 then
    begin
      Caption := 'Demo01 [No video device found]';
      MessageDlg('No video device found.', mtError, [mbOK], 0);
      Application.Terminate;
      exit;
    end;

    // 1. นำรายชื่อกล้องใส่ ComboBox (เอาไว้เลือกกล้องพอ)
    CbCam1.Items.Assign(DeviceList);
    CbCam1.ItemIndex := 0; // เลือกตัวแรกเป็น Default

    // 2. เริ่มทำงานกล้องตัวที่เลือก
    fVideoImage.VideoStart(CbCam1.Text);
    Caption := '01 [' + CbCam1.Text + ']';

  finally
    DeviceList.Free;
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fVideoImage.VideoStop;
end;

end.
