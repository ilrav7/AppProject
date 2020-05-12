object Form105: TForm105
  Left = 558
  Top = 246
  Width = 265
  Height = 267
  Caption = '[Form105]'
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
    Left = 56
    Top = 8
    Width = 92
    Height = 13
    Caption = #1055#1086#1079#1080#1094#1080#1103' - '#1054#1090#1076#1077#1083#1099
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 79
    Height = 26
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1086#1090#1076#1077#1083#1072
    WordWrap = True
  end
  object Label3: TLabel
    Left = 8
    Top = 99
    Width = 45
    Height = 13
    Caption = #1058#1077#1083#1077#1092#1086#1085
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
  end
  object btnUpdate: TButton
    Left = 32
    Top = 152
    Width = 75
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 2
    OnClick = btnUpdateClick
  end
  object btnClose: TButton
    Left = 152
    Top = 152
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 4
    OnClick = btnCloseClick
  end
  object btnAdd: TButton
    Left = 32
    Top = 152
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 3
    OnClick = btnAddClick
  end
end
