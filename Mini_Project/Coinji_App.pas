unit Coinji_App;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.TeeProcs,
  VCLTee.Chart, Vcl.Grids, VCLTee.Series,ShellApi, Vcl.ExtDlgs,Vcl.Imaging.jpeg,
  Vcl.ComCtrls, Vcl.Buttons;

type
  TAIThread = class(TThread)
  private
    FMessage: String; // ข้อความที่จะเอามาโชว์
    FTotal: Double;   // ยอดเงินที่จะเอาไปวิเคราะห์
    procedure UpdateUI; // ฟังก์ชันฝากงานกลับไปที่หน้าจอหลัก
  protected
    procedure Execute; override; // ฟังก์ชันทำงานหลัก (สมอง)
  public
    constructor Create(TotalAmount: Double); // ตัวรับค่าเริ่มต้น
  end;
  // 1. ประกาศ Record (ต้องอยู่นอก Class TForm1 และต้องจบด้วย end;)
  TTransaction = record
    Title: String;
    Amount: Double;
    Category: String;
    TxDate: TDateTime;
    SlipPath: String; // <--- เพิ่มบรรทัดนี้ (เก็บที่อยู่ไฟล์รูป)
    TransType: String; // <--- เพิ่มอันนี้ (เก็บคำว่า 'รายรับ' หรือ 'รายจ่าย')
  end;   // <--- เช็คบรรทัดนี้ครับ ต้องมี end; ปิดท้าย Record

  TForm1 = class(TForm)
    imgLogo: TImage;
    pnlLeft: TPanel;
    pnlRight: TPanel;
    pnlBottom: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cmbCategory: TComboBox;
    mmoNote: TMemo;
    Label4: TLabel;
    btnSave: TButton;
    gridHistory: TStringGrid;
    lblStatus: TLabel;
    btnAskAI: TButton;
    edtAmount: TEdit;
    mmoAIResponse: TMemo;
    imgSlip: TImage;
    dlgOpenPic: TOpenPictureDialog;
    btnCapture: TButton;
    dtpDate: TDateTimePicker;
    Label5: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    chartPie: TChart;
    Series1: TPieSeries;
    chartBar: TChart;
    Series2: TBarSeries;
    btnExit: TBitBtn;
    rgType: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnAskAIClick(Sender: TObject);
    procedure btnCaptureClick(Sender: TObject);
    procedure gridHistorySelectCell(Sender: TObject; ACol, ARow: LongInt;
      var CanSelect: Boolean);
    procedure PageControl1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExitClick(Sender: TObject);



  private
    { Private declarations }
    // 2. ประกาศตัวแปรเก็บข้อมูล (Week 5 Array)
    MyData: array[1..100] of TTransaction; // เก็บได้สูงสุด 100 รายการ
    CountItem: Integer; // ตัวนับว่าตอนนี้มีกี่รายการแล้ว

    // 3. ประกาศฟังก์ชันคำนวณเงิน (Week 3 Procedure)
    procedure UpdateDashboard;
    procedure SaveToDisk; // <--- เพิ่มบรรทัดนี้ (ฟังก์ชันสำหรับเซฟลงไฟล์)
    procedure LoadFromDisk; // <--- เพิ่มตัวนี้ (ฟังก์ชันโหลดข้อมูล)
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}




procedure TForm1.btnAskAIClick(Sender: TObject);
var
  CurrentTotal: Double;
  // วิธีดึงตัวเลขจากข้อความ "ยอดรวม: 500.00 บาท"
  // แต่วิธีง่ายกว่าคือ ไปคำนวณใหม่จาก Array เลย
  i: Integer;

begin
  // 1. คำนวณยอดเงินปัจจุบันก่อน
  CurrentTotal := 0;
  for i := 1 to CountItem do
    CurrentTotal := CurrentTotal + MyData[i].Amount;

  // 2. แสดงสถานะว่ากำลังคุย
  mmoAIResponse.Lines.Clear;
  mmoAIResponse.Lines.Add('Me: ช่วยดูการเงินให้หน่อย...');
  mmoAIResponse.Lines.Add('(AI กำลังวิเคราะห์...)');

  // 3. ล็อกปุ่มกันคนกดย้ำ
  btnAskAI.Enabled := False;
  btnAskAI.Caption := 'กำลังคิด...';

  // 4. ปล่อย AI Thread ออกไปทำงาน! (Week 4)
  TAIThread.Create(CurrentTotal);
end;

procedure TForm1.btnCaptureClick(Sender: TObject);
begin
  // 1. ถาม User ว่าจะถ่ายใหม่ หรือเลือกรูปเดิม?
  if MessageDlg('คุณต้องการเปิดกล้องถ่ายใหม่ใช่ไหม?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    // สูตรลัด: สั่ง Windows ให้เปิดแอป Camera ขึ้นมา (เหมือนเรากด Start > Camera)
    ShellExecute(0, 'open', 'microsoft.windows.camera:', nil, nil, SW_SHOWNORMAL);
    ShowMessage('เมื่อถ่ายเสร็จแล้ว... ให้กลับมาหน้าจอนี้ แล้วเลือกรูปที่เพิ่งถ่ายนะครับ');
  end;

  // 2. เปิดหน้าต่างให้เลือกไฟล์รูป (Week 7 Code)
  if dlgOpenPic.Execute then
  begin
    // โหลดรูปมาโชว์ที่หน้าจอ
    imgSlip.Picture.LoadFromFile(dlgOpenPic.FileName);

    // จำชื่อไฟล์ไว้ในตัวแปร "ชั่วคราว" (เดี๋ยวค่อยบันทึกลง Array ตอนกด Save)
    // หมายเหตุ: เราต้องฝากค่านี้ไว้ที่ไหนสักแห่ง หรือจะบันทึกลง Array ทันทีก็ได้
    // ในที่นี้ผมขอใช้ Tag ของรูปภาพฝากค่าไว้ก่อนง่ายๆ
    imgSlip.Hint := dlgOpenPic.FileName;
    imgSlip.ShowHint := True; // เอาเมาส์ชี้จะเห็น path รูป
  end;
end;

procedure TForm1.btnExitClick(Sender: TObject);
begin
  if MessageDlg('คุณต้องการออกจากโปรแกรมใช่หรือไม่?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    // คำสั่งปิดฟอร์ม (เดี๋ยวมันจะไปเรียก OnClose ให้เองอัตโนมัติ)
    Close;
  end;
end;

procedure TForm1.btnSaveClick(Sender: TObject);
var
  TempPrice: Double;
begin
  // --- Step 1: ตรวจสอบความถูกต้อง (Validation) ---
  if edtAmount.Text = '' then
  begin
    ShowMessage('กรุณากรอกจำนวนเงินครับ!');
    Exit;
  end;

  try
    // แปลงข้อความในช่องกรอก เป็นตัวเลขทศนิยม
    TempPrice := StrToFloat(edtAmount.Text);
  except
    // ถ้าแปลงไม่ได้ (เช่น พิมพ์ abc) ให้แจ้งเตือน (Week 3 Error Handling)
    ShowMessage('ใส่ราคาไม่ถูกครับ! ต้องเป็นตัวเลขเท่านั้น');
    edtAmount.Clear;
    edtAmount.SetFocus;
    Exit;
  end;

  // --- Step 2: บันทึกลง Array (Data Storage) ---
  if CountItem >= 100 then
  begin
    ShowMessage('หน่วยความจำเต็มแล้วครับ (Max 100)');
    Exit;
  end;

  Inc(CountItem); // บวกตัวนับเพิ่ม 1

  // เก็บข้อมูลลง Record (Week 5)
  with MyData[CountItem] do
  begin
    Amount   := TempPrice;
    Category := cmbCategory.Text;
    Title    := mmoNote.Text;
    TxDate   := dtpDate.Date;
    // บันทึก Path รูป (เอามาจาก Hint ที่เราฝากไว้เมื่อกี้)
    SlipPath := imgSlip.Hint;
    // ดึงค่าจาก RadioGroup
    if rgType.ItemIndex = 0 then
      TransType := 'รายรับ'
    else
      TransType := 'รายจ่าย';
    end;
  // เคลียร์รูปออกจากหน้าจอ เตรียมรับรายการใหม่
  imgSlip.Picture := nil;
  imgSlip.Hint := '';

  // --- Step 3: อัปเดตตาราง (Display) ---
  gridHistory.RowCount := CountItem + 1; // เพิ่มแถวตาราง
  gridHistory.Cells[0, CountItem] := IntToStr(CountItem);
  gridHistory.Cells[1, CountItem] := MyData[CountItem].Category;
  gridHistory.Cells[2, CountItem] := FloatToStrF(MyData[CountItem].Amount, ffNumber, 10, 2);
  gridHistory.Cells[3, CountItem] := MyData[CountItem].Title;

  // --- Step 4: เรียกฟังก์ชันคำนวณยอดรวม ---
  UpdateDashboard;

  // <--- เพิ่มบรรทัดนี้! บันทึกทุกครั้งที่กดปุ่ม
  SaveToDisk;

  // เคลียร์หน้าจอเตรียมกรอกรายการต่อไป
  edtAmount.Clear;
  mmoNote.Clear;
  edtAmount.SetFocus; // เอาเคอร์เซอร์ไปกระพริบรอ
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   // สั่งบันทึกข้อมูลทิ้งทวน ก่อนโปรแกรมดับ
  SaveToDisk;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // เริ่มต้นเซ็ตตัวนับเป็น 0
  CountItem := 0;

  // ตั้งค่าตาราง (Week 2)
  gridHistory.RowCount := 2; // มีหัวตาราง 1 + แถวว่าง 1
  gridHistory.ColCount := 4; // ลำดับ, หมวด, ราคา, โน้ต

  // ใส่หัวตาราง
  gridHistory.Cells[0, 0] := 'No.';
  gridHistory.Cells[1, 0] := 'หมวดหมู่';
  gridHistory.Cells[2, 0] := 'ราคา';
  gridHistory.Cells[3, 0] := 'บันทึกช่วยจำ';

  // จัดความกว้างคอลัมน์ให้สวยงาม (Optional)
  gridHistory.ColWidths[0] := 40;
  gridHistory.ColWidths[1] := 80;
  gridHistory.ColWidths[2] := 80;
  gridHistory.ColWidths[3] := 200;

  // ตั้งค่าเริ่มต้นอื่นๆ
  lblStatus.Caption := 'ยอดรวม: 0.00 บาท';
  edtAmount.Clear;

  LoadFromDisk;
end;

procedure TForm1.gridHistorySelectCell(Sender: TObject; ACol, ARow: LongInt;
  var CanSelect: Boolean);

var
  SelectedPath: String;
begin
// ARow คือบรรทัดที่ถูกคลิก (เริ่มที่ 0 คือหัวตาราง)

  // 1. ถ้าคลิกหัวตาราง (แถว 0) ไม่ต้องทำอะไร
  if ARow < 1 then Exit;

  // 2. ถ้าคลิกแถวว่างๆ (ไม่มีข้อมูล) ก็ออกไปเลย (กัน Error)
  if ARow > CountItem then Exit;

  // 3. ดึงที่อยู่รูปภาพจาก Array มาดู (ใช้ ARow เป็น index ได้เลย เพราะเราเรียงตรงกัน)
  SelectedPath := MyData[ARow].SlipPath;

  // 4. เช็คว่ามีไฟล์รูปจริงไหม?
  if (SelectedPath <> '') and FileExists(SelectedPath) then
  begin
    // ถ้ามี: โหลดมาโชว์
    imgSlip.Picture.LoadFromFile(SelectedPath);
    imgSlip.Hint := SelectedPath; // เก็บไว้เผื่อ user อยากดู path
  end
  else
  begin
    // ถ้าไม่มี: เคลียร์รูปทิ้ง (โชว์หน้าว่างๆ)
    imgSlip.Picture := nil;
  end;
end;

procedure TForm1.UpdateDashboard;
var
  i, j: Integer;
  TotalIncome, TotalExpense, Balance: Double;
  // ตัวแปรสำหรับกราฟแท่ง
  DayList: TStringList;
  DaySum: Double;
  DateStr: String;
begin
  // --- ส่วนที่ 1: คำนวณยอดเงินรวม (แยกรับ-จ่าย) ---
  TotalIncome := 0;
  TotalExpense := 0;

  for i := 1 to CountItem do
  begin
    if MyData[i].TransType = 'รายรับ' then
      TotalIncome := TotalIncome + MyData[i].Amount
    else
      // ถ้าเป็น รายจ่าย หรือ ค่าว่าง(ของเก่า) ให้เหมาเป็นรายจ่าย
      TotalExpense := TotalExpense + MyData[i].Amount;
  end;

  Balance := TotalIncome - TotalExpense;

  // --- ส่วนที่ 2: แสดงผลตัวเลขสรุป (3 บรรทัด) ---
  // ใช้ #13 เพื่อขึ้นบรรทัดใหม่
  lblStatus.Caption := 'รายรับรวม: ' + FloatToStrF(TotalIncome, ffNumber, 10, 2) + ' บาท' + #13 +
                       'รายจ่ายรวม: ' + FloatToStrF(TotalExpense, ffNumber, 10, 2) + ' บาท' + #13 +
                       'คงเหลือสุทธิ: ' + FloatToStrF(Balance, ffNumber, 10, 2) + ' บาท';

  // เปลี่ยนสีตัวหนังสือตามสถานะการเงิน
  if Balance < 0 then
  begin
    lblStatus.Font.Color := clRed; // ตัวแดง (ถังแตก)
    lblStatus.Caption := lblStatus.Caption + #13 + '(สถานะ: ขาดดุล! 💸)';
  end
  else
  begin
    lblStatus.Font.Color := clGreen; // ตัวเขียว (ร่ำรวย)
    lblStatus.Caption := lblStatus.Caption + #13 + '(สถานะ: การเงินปกติ 👍)';
  end;

  // --- ส่วนที่ 3: อัปเดตกราฟวงกลม (Pie Chart) ---
  // *เน้นโชว์เฉพาะ "รายจ่าย" เพื่อดูว่าเราหมดเงินไปกับค่าอะไร*
  if chartPie.SeriesCount > 0 then
  begin
    chartPie.Series[0].Clear;
    for i := 1 to CountItem do
    begin
      // กรองเอาเฉพาะรายจ่ายมาวาดกราฟ
      if MyData[i].TransType <> 'รายรับ' then
        chartPie.Series[0].Add(MyData[i].Amount, MyData[i].Category, clTeeColor);
    end;
  end;

  // --- ส่วนที่ 4: อัปเดตกราฟแท่ง (Bar Chart) ---
  // *เน้นโชว์ "ยอดจ่ายรายวัน" เพื่อดูแนวโน้มการใช้เงิน*
  if chartBar.SeriesCount > 0 then
  begin
    chartBar.Series[0].Clear;

    DayList := TStringList.Create;
    DayList.Sorted := True; // เรียงวันที่
    DayList.Duplicates := dupIgnore; // ไม่เอาวันที่ซ้ำ

    try
      // 4.1 รวบรวมรายชื่อวันที่ที่มีการ "จ่ายเงิน"
      for i := 1 to CountItem do
      begin
        if MyData[i].TransType <> 'รายรับ' then
          DayList.Add(DateToStr(MyData[i].TxDate));
      end;

      // 4.2 วนลูปตามวัน เพื่อรวมยอดจ่ายของวันนั้นๆ
      for i := 0 to DayList.Count - 1 do
      begin
        DateStr := DayList[i];
        DaySum := 0;

        for j := 1 to CountItem do
        begin
          // ต้องตรงทั้ง "วันที่" และเป็น "รายจ่าย"
          if (DateToStr(MyData[j].TxDate) = DateStr) and (MyData[j].TransType <> 'รายรับ') then
            DaySum := DaySum + MyData[j].Amount;
        end;

        // พล็อตกราฟแท่ง
        chartBar.Series[0].Add(DaySum, DateStr, clTeeColor);
      end;

    finally
      DayList.Free;
    end;
  end;
end;
procedure TForm1.SaveToDisk;
var
  List: TStringList; // ตัวช่วยจัดการ Text (Week 9)
  i: Integer;
  LineData: String;
begin
  List := TStringList.Create; // สร้างกระดาษเปล่าขึ้นมา
  try
    // วนลูปเอาข้อมูลจาก Array มาเรียงเป็นบรรทัด (Week 5 Loop)
    for i := 1 to CountItem do
    begin
      // เอาข้อมูลมาต่อกัน คั่นด้วยเครื่องหมายไปป์ "|" (String Concatenation)
      // ตัวอย่างผลลัพธ์:  ค่าข้าว|50|อาหาร|หมายเหตุ
      LineData := MyData[i].Title + '|' +
                  FloatToStr(MyData[i].Amount) + '|' +
                  MyData[i].Category + '|' +    // อย่าลืมบวก '|' เพิ่ม
                  MyData[i].SlipPath + '|' +
                  DateToStr(MyData[i].TxDate) + '|' +        // เพิ่มวันที่ต่อท้าย
                  MyData[i].TransType;

      List.Add(LineData); // เพิ่มบรรทัดนี้ลงในกระดาษ
    end;

    // บันทึกลงไฟล์ชื่อ CoinjiDB.txt (ไว้ข้างๆ ไฟล์ .exe)
    // เพิ่ม , TEncoding.UTF8 ต่อท้าย
    List.SaveToFile(ExtractFilePath(Application.ExeName) + 'CoinjiDB.txt', TEncoding.UTF8);
  finally
    List.Free; // ใช้เสร็จต้องทำลายทิ้ง คืนหน่วยความจำ (สำคัญมาก!)
  end;
end;

procedure TForm1.LoadFromDisk;
var
  List: TStringList;
  i, p: Integer;
  LineData: String;
  TempTitle, TempCat, TempSlip, TempType: String; // <--- เพิ่ม TempType
  TempAmount: Double;
  TempDate: TDateTime;
begin
  // 1. เช็คก่อนว่ามีไฟล์ไหม?
  if not FileExists(ExtractFilePath(Application.ExeName) + 'CoinjiDB.txt') then
    Exit;

  List := TStringList.Create;
  try
    // 2. โหลดไฟล์ขึ้นมา (UTF8)
    List.LoadFromFile(ExtractFilePath(Application.ExeName) + 'CoinjiDB.txt', TEncoding.UTF8);

    // 3. เริ่มวนลูปอ่านทีละบรรทัด
    CountItem := 0;

    for i := 0 to List.Count - 1 do
    begin
      LineData := List[i];
      // รูปแบบข้อมูลใหม่: "Title|Amount|Category|SlipPath|Date|TransType"

      // --- Week 9: String Parsing (ตัดคำ) ---

      // 3.1 ตัด Title
      p := Pos('|', LineData);
      TempTitle := Copy(LineData, 1, p-1);
      Delete(LineData, 1, p);

      // 3.2 ตัด Amount
      p := Pos('|', LineData);
      if p = 0 then Continue;
      TempAmount := StrToFloatDef(Copy(LineData, 1, p-1), 0.0);
      Delete(LineData, 1, p);

      // 3.3 ตัด Category
      p := Pos('|', LineData);
      if p > 0 then
      begin
        TempCat := Copy(LineData, 1, p-1);
        Delete(LineData, 1, p);

        // 3.4 ตัด SlipPath
        p := Pos('|', LineData);
        if p > 0 then
        begin
          TempSlip := Copy(LineData, 1, p-1);
          Delete(LineData, 1, p);

          // 3.5 ตัด Date และ TransType (Logic ใหม่ล่าสุด)
          // ตอนนี้ LineData จะเหลือ: "Date|Type" (ใหม่) หรือ "Date" (เก่า)

          p := Pos('|', LineData);
          if p > 0 then
          begin
             // เจอ | แสดงว่าเป็นแบบใหม่ มีประเภทต่อท้าย
             try
               TempDate := StrToDate(Copy(LineData, 1, p-1));
             except
               TempDate := Date;
             end;
             Delete(LineData, 1, p);

             TempType := LineData; // ตัวสุดท้ายที่เหลือคือ ประเภท (รายรับ/รายจ่าย)
          end
          else
          begin
             // ไม่เจอ | แสดงว่าเป็นแบบเก่า (มีแต่วันที่)
             try
               TempDate := StrToDate(LineData);
             except
               TempDate := Date;
             end;
             TempType := 'รายจ่าย'; // ค่าเริ่มต้นของไฟล์เก่า
          end;
        end
        else
        begin
          // กรณีไฟล์เก่ามาก (มีแค่รูป)
          TempSlip := LineData;
          TempDate := Date;
          TempType := 'รายจ่าย';
        end;
      end
      else
      begin
        // กรณีไฟล์ดึกดำบรรพ์
        TempCat := LineData;
        TempSlip := '';
        TempDate := Date;
        TempType := 'รายจ่าย';
      end;

      // --- ยัดใส่ Array ---
      Inc(CountItem);
      with MyData[CountItem] do
      begin
        Title     := TempTitle;
        Amount    := TempAmount;
        Category  := TempCat;
        SlipPath  := TempSlip;
        TxDate    := TempDate;
        TransType := TempType; // <--- บันทึกประเภทลง Record
      end;
    end;

    // 4. อัปเดตหน้าจอ
    gridHistory.RowCount := CountItem + 1;
    for i := 1 to CountItem do
    begin
      gridHistory.Cells[0, i] := IntToStr(i);
      gridHistory.Cells[1, i] := MyData[i].Category;

      // *** แสดงเครื่องหมาย + หรือ - หน้าตัวเลข ***
      if MyData[i].TransType = 'รายรับ' then
        gridHistory.Cells[2, i] := '+' + FloatToStrF(MyData[i].Amount, ffNumber, 10, 2)
      else
        gridHistory.Cells[2, i] := '-' + FloatToStrF(MyData[i].Amount, ffNumber, 10, 2);

      gridHistory.Cells[3, i] := MyData[i].Title;
    end;

    UpdateDashboard; // คำนวณกราฟใหม่

  finally
    List.Free;
  end;
end;

procedure TForm1.PageControl1Change(Sender: TObject);
begin

end;

// ************************************ AI **********************************
constructor TAIThread.Create(TotalAmount: Double);
begin
  inherited Create(False); // False = สร้างเสร็จทำงานเลยไม่ต้องรอ
  FTotal := TotalAmount;
  FreeOnTerminate := True; // จบงานแล้วตายไปซะ (คืน Ram)
end;

procedure TAIThread.Execute;
begin
  // 1. จำลองการคิด (แกล้งหลับไป 2 วินาที)
  Sleep(2000);

  // 2. วิเคราะห์ข้อมูล (Week 8 Logic)
  if FTotal > 1500 then
    FMessage := 'AI: โอ้โห! คุณใช้เงินดุมากระวังถังแตกนะ! 💸'
  else if FTotal > 1000 then
    FMessage := 'AI: เริ่มใช้เยอะแล้วนะ เพลาๆ หน่อย'
  else if FTotal > 0 then
    FMessage := 'AI: ยอดเยี่ยม! คุณยังคุมงบได้ดี 👍'
  else
    FMessage := 'AI: นี่คุณยังไม่ได้ใช้เงินเลยเหรอ? สุดยอด!';

  // 3. ส่งผลลัพธ์กลับไปที่หน้าจอ (ต้องใช้ Synchronize ห้ามแก้หน้าจอโดยตรง!)
  Synchronize(UpdateUI);
end;

procedure TAIThread.UpdateUI;
begin
  // สั่งให้ Memo ใน Form1 แสดงข้อความ
  Form1.mmoAIResponse.Lines.Add(FMessage);

  // ปลดล็อกปุ่ม (ให้กดได้อีกรอบ)
  Form1.btnAskAI.Enabled := True;
  Form1.btnAskAI.Caption := 'วิเคราะห์สุขภาพการเงิน (AI)';
end;

end.


