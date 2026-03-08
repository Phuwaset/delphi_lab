unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids,
  VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart, CPort, CPortCtl,
  VclTee.TeeGDIPlus;

type
  TForm3 = class(TForm)
    ComPort1: TComPort;
    ComDataPacket1: TComDataPacket;
    BtnOpen: TButton;
    BtnClose: TButton;
    Chart1: TChart;
    Series1: TLineSeries;
    StringGrid1: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure BtnOpenClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure ComDataPacket1Packet(Sender: TObject; const Str: string);
  private
    { Private declarations }
    CurrentRow: Integer;
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

// 1. ตั้งค่าเริ่มต้นตอนเปิดโปรแกรม
procedure TForm3.FormCreate(Sender: TObject);
begin
  CurrentRow := 1;

  // ตั้งค่าหัวตาราง (StringGrid)
  StringGrid1.Cells[0, 0] := 'No.';
  StringGrid1.Cells[1, 0] := 'Time';
  StringGrid1.Cells[2, 0] := 'Analog 0 Value';

  // ปรับขนาดความกว้างคอลัมน์
  StringGrid1.ColWidths[0] := 50;
  StringGrid1.ColWidths[1] := 100;
  StringGrid1.ColWidths[2] := 150;

  Series1.Clear; // เคลียร์กราฟทิ้งก่อนเริ่มรับข้อมูล
end;

// 2. ปุ่มเปิดพอร์ตเพื่อรอรับข้อมูลจาก Virtual COM Port
procedure TForm3.BtnOpenClick(Sender: TObject);
begin
  if not ComPort1.Connected then
  begin
    // ** จุดสำคัญ: แก้ไขเป็น #10 เพื่อดักจับเฉพาะรหัส New Line จาก Arduino IDE **
    ComDataPacket1.StopString := #10;

    ComPort1.Open; // สั่งเปิดพอร์ต
    BtnOpen.Enabled := False;
    BtnClose.Enabled := True;
  end;
end;

// 3. ปุ่มปิดพอร์ต
procedure TForm3.BtnCloseClick(Sender: TObject);
begin
  if ComPort1.Connected then
  begin
    ComPort1.Close; // สั่งปิดพอร์ต
    BtnOpen.Enabled := True;
    BtnClose.Enabled := False;
  end;
end;

// 4. ฟังก์ชันหลัก: ทำงานอัตโนมัติเมื่อมีข้อมูล (ที่ลงท้ายด้วย New Line) ส่งเข้ามา
procedure TForm3.ComDataPacket1Packet(Sender: TObject; const Str: string);
var
  AnalogVal: Integer;
  CleanStr: string;
begin
  CleanStr := Trim(Str); // ลบช่องว่างหรือตัวขึ้นบรรทัดใหม่ส่วนเกินทิ้งไป

  try
    if CleanStr <> '' then // เช็คเพื่อความชัวร์ว่าไม่ใช่ข้อความว่างเปล่า
    begin
      AnalogVal := StrToInt(CleanStr); // แปลงข้อความให้เป็นตัวเลข

      // --- ส่วนที่ 1: พล็อตตัวเลขลงกราฟ ---
      Series1.AddY(AnalogVal, TimeToStr(Now), clRed);

      // --- ส่วนที่ 2: แสดงผลในตาราง ---
      if CurrentRow >= StringGrid1.RowCount then
        StringGrid1.RowCount := StringGrid1.RowCount + 1; // เพิ่มบรรทัดตารางถ้าข้อมูลล้น

      StringGrid1.Cells[0, CurrentRow] := IntToStr(CurrentRow);
      StringGrid1.Cells[1, CurrentRow] := TimeToStr(Now);
      StringGrid1.Cells[2, CurrentRow] := IntToStr(AnalogVal);

      StringGrid1.Row := CurrentRow; // สั่งให้ตารางเลื่อนลงมาบรรทัดล่าสุดอัตโนมัติ (Auto Scroll)

      Inc(CurrentRow); // บวกเลขบรรทัดเพิ่มทีละ 1 เตรียมรอข้อมูลรอบต่อไป
    end;
  except
    // ใช้ try...except ป้องกันโปรแกรมเด้ง Error ในกรณีที่เราเผลอพิมพ์ตัวอักษรแทนตัวเลข
  end;
end;

end.
