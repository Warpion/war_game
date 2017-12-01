unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Timer2: TTimer;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  bufer,nebo_bm,nebo:TBitmap;
  nebo_y:integer=541;

  ship_bm,ship:TBitmap;
  ship_n:byte=0;
  ship_x,ship_y:integer;
  shiplet:Boolean=true;

  roklet:Boolean=false;
  dx,dy,rx,ry:Integer;
  roketa:TBitmap;

  vrag:TBitmap;
  vrag_bm:TBitmap;
  vrag_x,vrag_y:integer;
  vraglet:Boolean=true;

  boom:TBitmap;
  boom_bm:TBitmap;
  boomlet:Boolean=false;
  boom_n:byte=0;
  Boom_x,boom_y:integer;

  kill:integer=0;
  life:integer=3;

  level:integer=0;
  skorost:integer=0;

implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);     //пауза

begin
 ShowCursor(True);

 Timer1.Enabled:=false;
 Timer2.Enabled:=false;
end;

procedure TForm1.Button2Click(Sender: TObject);     //пуск
begin
 ShowCursor(False);

 Timer1.Enabled:=true;
 Timer2.Enabled:=true;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Form1.Caption:='Война Миров!';
  dx:=10;
  dy:=-10;

  Bufer:=TBitmap.Create;      //Создаем и подгружаем звездное небо
  Bufer.Width:=1000;
  bufer.Height:=540;

  nebo_bm:=TBitmap.Create;
  nebo_bm.Width:=1000;
  nebo_bm.Height:=1080;
  nebo_bm.LoadFromFile('Data\stars.bmp');

  nebo:=TBitmap.Create;
  nebo.Width:=1000;
  nebo.Height:=1080;

  ship_bm:=TBitmap.Create;          //Создаем корабль
  ship_bm.Width:=132;
  ship_bm.Height:=80;
  ship_bm.LoadFromFile('Data\ship1.bmp');

  ship:=TBitmap.Create;
  ship.Width:=66;
  ship.Height:=80;

  dx:=10;
  dy:=-10;
  roketa:=TBitmap.Create;                       //Создаем ракету
  roketa.Width:=20;
  roketa.Height:=30;
  roketa.LoadFromFile('Data\bullet.bmp');

  vrag_bm:=Tbitmap.Create;                //Создаем врага
  vrag_bm.Width:= 200;
  vrag_bm.Height:= 80;
  vrag_bm.LoadFromFile('Data\ship4.bmp');

  vrag:=TBitmap.Create;
  vrag.Width:=100;
  vrag.Height:=80;

  vrag_x:=200;
  Vrag_y:=-80;
  vraglet:=true;

  boom_bm := TBitmap.Create;                  // Создаем взырыв
  boom_bm.Width := 1024;
  boom_bm.Height := 110;
  boom_bm.LoadFromFile('Data\explo.bmp');

  boom := TBitmap.Create;
  boom.Width := 128;
  boom.Height := 110;

  ShowCursor(false);


end;

procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;  //Откуда летит ракета
  Shift: TShiftState; X, Y: Integer);
begin
if (not roklet) then
 begin

  rx:=x-6;
  ry:=y-50;
  roklet:=true;
 end;
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,      //Привязка к мышке
  Y: Integer);
begin
 ship_x:=x-33;
 ship_y:=y-40;
end;

procedure TForm1.Timer1Timer(Sender: TObject);         //Уровни сложности
begin
  if (Kill>10) then  level:=1;

  if (kill>20) then  begin
                     level:=2; skorost:=1;
                     end;

  if (kill>30) then  level:=3;

  if (kill>40) then  begin
                     skorost:=2;
                     level:=5;
                     end;
  if (Kill>50) then  level:=5;

  if (Kill>60) then  level:=6;
  if (Kill>70) then  level:=7;
  if (Kill>80) then  level:=8;
  if (Kill>90) then  level:=9;
  if (Kill>100) then  level:=10;
  if (Kill>150) then  begin
                      level:=11;
                      skorost:=3;
                      end;
  if (Kill>200) then level:=12;


  if (nebo_y<0)  then
  nebo_y:=541
  else begin                                      //При достижении макс. высоты
         nebo.Canvas.CopyRect(Rect(0,0,1000,540), //небо начинается двигаться с начала
         nebo_bm.Canvas,
         Rect(0,nebo_y,1000,nebo_y+540));
       end;


  if(                                                //Если ракета натыкается на врага, то взрыв
  (rx + roketa.Height div 2  >= vrag_x)and
  (rx + roketa.Height div 2 <= vrag_x+vrag.Width)and
  (rx+roketa.Width >= vrag_x)and
  (rx <= vrag_x + vrag.Width)and
  (ry >= vrag_y)and
  (ry <= vrag_y + vrag.Height)and
  (ry + roketa.Height >= vrag_y)and
  (ry+roketa.Height <= vrag_y + vrag.Height )
  )
  then begin
        boom.Canvas.CopyRect(Rect(0,0, boom.Width,boom.Height),
                                 boom_bm.Canvas,
                                 Rect(boom_n*128, 0, (boom_n+1)*128, 110));
        //rx:=10000;
       // ry:=10000;
        boom_x:=vrag_x;
        boom_y:=vrag_y;
        vrag_y:=- 20;
        vrag_x:=random(form1.Width-vrag.Width);
        roklet:=false;
        boomlet:=true;
        boom_n := 0;
          kill:=kill+1;
          Label1.Caption:='Счет:'+IntToStr(kill)+'   '+
          'Усложнение:' + inttostr(level)+'   '+'Жизни:'+ inttostr(life);
          Form2.Label1.Caption:='Счет:'+IntToStr(kill)+'   '+
          'Усложнение:' + inttostr(level)+'   '+'Жизни:'+ inttostr(life);

          Timer2.Enabled:=true;
       end;

 if (shiplet) then      //Если корабль летит, то обновлять картинку
  begin
  if (ship_n=0)
  then ship_n:=1
  else ship_n:=0;

  ship.Canvas.CopyRect(Rect(0,0,66,80),
                       ship_bm.Canvas,
                       Rect(ship_n*66,0,(ship_n+1)*66,80));

  bufer.Canvas.Draw(0,0,nebo);
  ship.Transparent := true;
  bufer.Canvas.draw(ship_x,ship_y,ship);
  end;

  if (roklet) then                      //полет ракеты
           begin
             roketa.Transparent :=true;
             bufer.Canvas.Draw(rX, rY, roketa);
             rY := rY - 12 + skorost;
             if (ry<=-roketa.Height) then roklet:=false;
           end;

  if(vraglet) then           //полет врага
  begin
    vrag_y := vrag_y + 3+Level;
    if (vrag_y > Form1.Height)
    then begin
           Timer1.Enabled:=false;
           Timer2.Enabled:=false;
           Form2.Show;
           ShowCursor(True);
           life:=life-1;
         end;

           vrag.Canvas.CopyRect(Rect(0,0,100,80),
           vrag_bm.Canvas,
           Rect(ship_n*100,0,(1+ship_n)*100,80));
           vrag.Transparent:=true;
           bufer.Canvas.Draw(vrag_x,vrag_y,vrag);

  end;

  if(boomlet)
  then begin
    boom.Transparent := true;
    bufer.Canvas.Draw(boom_x,boom_y, boom);
  end;

  Form1.Canvas.Draw(0,0,bufer);


  nebo_y:=nebo_y-1;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  if (boomlet)
  then begin
         if (boom_n>7) then
         begin
           boomlet := false;
           timer2.Enabled:=false;
         end
         else
         begin
           boom.Canvas.CopyRect(Rect(0,0, 128,110),
                                 boom_bm.Canvas,
                                 Rect(boom_n*128, 0, (boom_n+1)*128, 110));

           boom_n:=boom_n+1;
         end;
       end;
end;

end.
