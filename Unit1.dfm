object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1042#1086#1081#1085#1072' '#1052#1080#1088#1086#1074
  ClientHeight = 741
  ClientWidth = 897
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnMouseDown = FormMouseDown
  OnMouseMove = FormMouseMove
  PixelsPerInch = 120
  TextHeight = 17
  object Label1: TLabel
    Left = 0
    Top = 724
    Width = 897
    Height = 17
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alBottom
    Caption = 'C'#1095#1077#1090':0'
    ExplicitTop = 709
    ExplicitWidth = 45
  end
  object Button1: TButton
    Left = 607
    Top = 710
    Width = 138
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #1055#1072#1091#1079#1072
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 753
    Top = 710
    Width = 139
    Height = 25
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = #1055#1091#1089#1082
    TabOrder = 1
    OnClick = Button2Click
  end
  object Timer1: TTimer
    Interval = 30
    OnTimer = Timer1Timer
    Left = 208
    Top = 160
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 50
    OnTimer = Timer2Timer
    Left = 344
    Top = 272
  end
end
