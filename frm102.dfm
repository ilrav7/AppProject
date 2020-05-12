object Form102: TForm102
  Left = 284
  Top = 161
  Width = 905
  Height = 480
  Caption = #1054#1090#1095#1077#1090' - '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1080' [Form102]'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 889
    Height = 81
    Align = alTop
    Color = clCream
    TabOrder = 0
    object Label1: TLabel
      Left = 112
      Top = 7
      Width = 36
      Height = 13
      Caption = #1060'.'#1048'.'#1054'.'
    end
    object Label2: TLabel
      Left = 257
      Top = 7
      Width = 31
      Height = 13
      Caption = #1054#1090#1076#1077#1083
    end
    object Label3: TLabel
      Left = 383
      Top = 7
      Width = 58
      Height = 13
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
    end
    object CheckBox1: TCheckBox
      Left = 112
      Top = 48
      Width = 153
      Height = 33
      Caption = #1053#1077' '#1086#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1091#1074#1086#1083#1077#1085#1085#1099#1093' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
      TabOrder = 0
      WordWrap = True
    end
    object btnReset: TButton
      Left = 16
      Top = 24
      Width = 75
      Height = 25
      Caption = #1057#1073#1088#1086#1089
      TabOrder = 1
    end
    object edtFio: TEdit
      Left = 112
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object cmbbxDept: TComboBox
      Left = 256
      Top = 24
      Width = 105
      Height = 21
      ItemHeight = 13
      TabOrder = 3
    end
    object cmbbxPost: TComboBox
      Left = 384
      Top = 24
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 4
    end
    object btnSearch: TButton
      Left = 560
      Top = 16
      Width = 75
      Height = 33
      Caption = #1055#1086#1080#1089#1082
      TabOrder = 5
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 81
    Width = 889
    Height = 287
    Align = alClient
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Panel2: TPanel
    Left = 0
    Top = 368
    Width = 889
    Height = 73
    Align = alBottom
    Color = clCream
    TabOrder = 2
  end
end
