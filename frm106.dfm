object Form106: TForm106
  Left = 558
  Top = 188
  Width = 341
  Height = 334
  Caption = '[Form106]'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 58
    Width = 39
    Height = 13
    Caption = #1060'.'#1048'.'#1054'.:'
  end
  object Label2: TLabel
    Left = 24
    Top = 118
    Width = 45
    Height = 13
    Caption = #1058#1077#1083#1077#1092#1086#1085
  end
  object Label3: TLabel
    Left = 24
    Top = 88
    Width = 79
    Height = 13
    Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
  end
  object Label4: TLabel
    Left = 24
    Top = 178
    Width = 58
    Height = 13
    Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
  end
  object Label5: TLabel
    Left = 24
    Top = 148
    Width = 31
    Height = 13
    Caption = #1054#1090#1076#1077#1083
  end
  object Label6: TLabel
    Left = 80
    Top = 16
    Width = 106
    Height = 13
    Caption = #1055#1086#1079#1080#1094#1080#1103' - '#1057#1086#1090#1088#1091#1076#1085#1080#1082
  end
  object ComboBox1: TComboBox
    Left = 112
    Top = 176
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 0
  end
  object ComboBox2: TComboBox
    Left = 112
    Top = 146
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 112
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object btnAdd: TButton
    Left = 72
    Top = 224
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 3
    OnClick = btnAddClick
  end
  object btnClose: TButton
    Left = 200
    Top = 224
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 4
    OnClick = btnCloseClick
  end
  object btnUpdate: TButton
    Left = 72
    Top = 224
    Width = 75
    Height = 25
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100
    TabOrder = 5
    OnClick = btnUpdateClick
  end
  object MaskEdit1: TMaskEdit
    Left = 112
    Top = 116
    Width = 107
    Height = 21
    EditMask = '+7!\(999\)000-0000;1;_'
    MaxLength = 15
    TabOrder = 6
    Text = '+7(   )   -    '
  end
  object DateTimePicker1: TDateTimePicker
    Left = 112
    Top = 86
    Width = 129
    Height = 21
    Date = 43962.779076388890000000
    Time = 43962.779076388890000000
    TabOrder = 7
  end
end