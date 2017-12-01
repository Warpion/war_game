unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses unit1;
{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  ShowCursor(False);
  Form2.Close;
  vrag_y:=- 20;
  vrag_x:=random(form1.Width-vrag.Width);
  Form1.Timer1.Enabled:=true;
  Form1.Timer2.Enabled:=true;
  roklet:=false;
  kill:=0;
  level:=0;
  life:=3;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  if (life>0) then
  begin
  ShowCursor(False);
  Form2.Close;
  vrag_y:=- 20;
  vrag_x:=random(form1.Width-vrag.Width);
  Form1.Timer1.Enabled:=true;
  Form1.Timer2.Enabled:=true;
  roklet:=false;
  end;

  if (life<1) then
  ShowMessage('Нет больше жизни!');

end;

procedure TForm2.Button3Click(Sender: TObject);
begin
Form2.Close;
Form1.Close;

end;

end.
