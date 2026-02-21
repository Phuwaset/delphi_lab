unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects,System.Math,Vcl.Graphics,Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
var
  i: Integer;
  x_pos, y_pos: Integer;
  y_val: Double;
begin
  // กำหนดสีเส้น [cite: 46]
  Image1.Canvas.Pen.Color := clRed;

  // ล้างภาพเก่า (วาดสี่เหลี่ยมสีขาวทับพื้นที่ Image)
  Image1.Canvas.FillRect(Image1.ClientRect);

  for i := 0 to 360 do
  begin
    // คำนวณค่า Sin (แปลง Degree เป็น Radian)
    y_val := 10 * sin(i * (Pi / 180));

    // กำหนดตำแหน่งพิกัดบนจอ
    x_pos := 10 + i;
    y_pos := 100 - Round(y_val * 5);

    if i = 0 then
      Image1.Canvas.MoveTo(x_pos, y_pos) // จุดเริ่ม
    else
      Image1.Canvas.LineTo(x_pos, y_pos); // ลากเส้น
  end;
end;
end.
