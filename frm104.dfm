object Form104: TForm104
  Left = 562
  Top = 238
  Width = 298
  Height = 247
  Caption = '[Form104]'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 48
    Width = 81
    Height = 33
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1076#1086#1083#1078#1085#1086#1089#1090#1080
    WordWrap = True
  end
  object Label2: TLabel
    Left = 8
    Top = 99
    Width = 32
    Height = 13
    Caption = #1054#1082#1083#1072#1076
  end
  object Label3: TLabel
    Left = 64
    Top = 8
    Width = 111
    Height = 13
    Caption = #1055#1086#1079#1080#1094#1080#1103' - '#1044#1086#1083#1078#1085#1086#1089#1090#1100
  end
  object Edit1: TEdit
    Left = 96
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 96
    Top = 96
    Width = 121
    Height = 21
    TabOrder = 1
    OnKeyPress = Edit2KeyPress
  end
  object btnAdd: TButton
    Left = 32
    Top = 152
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 2
    OnClick = btnAddClick
  end
  object Button2: TButton
    Left = 152
    Top = 152
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 3
    OnClick = Button2Click
  end
  object btnUpdate: TButton
    Left = 32
    Top = 152
    Width = 75
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 4
    OnClick = btnUpdateClick
  end
end
