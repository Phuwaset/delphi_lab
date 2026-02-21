unit Xyz_app;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  System.Math.Vectors, FMX.Types3D, FMX.Controls3D, FMX.Objects3D,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Viewport3D, FMX.MaterialSources,Winapi.MMSystem;

type
  TForm1 = class(TForm)
    Viewport3D1: TViewport3D;
    ScrollBarX: TScrollBar;
    Label1: TLabel;
    Camera1: TCamera;
    Cube2: TCube;
    Light2: TLight;
    TextureMaterialSource1: TTextureMaterialSource;
    ScrollBarY: TScrollBar;
    ScrollBarZ: TScrollBar;
    ScrollBarXR: TScrollBar;
    ScrollBarYP: TScrollBar;
    ScrollBarZR: TScrollBar;
    TrackBar2: TTrackBar;
    TrackBarScaleX: TTrackBar;
    TrackBarScaleY: TTrackBar;
    TrackBarScaleZ: TTrackBar;
    TimerJoystickTimer: TTimer;
//    procedure ScrollBarXChange(Sender: TObject);
//    procedure TrackBarScaleXChange(Sender: TObject);
//    procedure TimerJoystickTimerTimer(Sender: TObject);
    //procedure ScrollBar1Change(Sender: TObject);
    procedure TimerJoystickTimerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

// --- ส่วน Implementation ---
// ชื่อหลัง TForm1. ต้องตรงกับที่ประกาศไว้ข้างบนเป๊ะๆ
procedure TForm1.TimerJoystickTimerTimer(Sender: TObject);
var
  JoyCaps: TJoyCaps;
  JoyInfo: TJoyInfoEx;
begin
  // ตัวอย่างการอ่านค่าจริงจาก Joystick ด้วย Winapi.MMSystem
  JoyInfo.dwSize := SizeOf(TJoyInfoEx);
  JoyInfo.dwFlags := JOY_RETURNALL;

  if joyGetPosEx(JOYSTICKID1, @JoyInfo) = JOYERR_NOERROR then
  begin
     // 1. ควบคุมการเคลื่อนที่ (Translation) 6 DOF [cite: 245]
     // ปรับ Scale ค่าจาก Joystick (ปกติ 0-65535) ให้เหมาะสม
     Cube2.Position.X := Cube2.Position.X + ((JoyInfo.wXpos - 32767) / 32767); [cite: 219, 305, 327]
     Cube2.Position.Y := Cube2.Position.Y + ((JoyInfo.wYpos - 32767) / 32767); [cite: 328]
     Cube2.Position.Z := Cube2.Position.Z + ((JoyInfo.wZpos - 32767) / 32767); [cite: 329]

     // 2. ควบคุมการหมุน (Rotation Angle) [cite: 188, 244]
     Cube2.RotationAngle.X := Cube2.RotationAngle.X + 1.0; [cite: 226, 309, 330]
     Cube2.RotationAngle.Y := Cube2.RotationAngle.Y + 1.0; [cite: 331]
     Cube2.RotationAngle.Z := Cube2.RotationAngle.Z + 1.0; [cite: 332]
  end;

end.




end.
