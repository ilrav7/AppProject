object Form102: TForm102
  Left = 330
  Top = 196
  Width = 788
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 772
    Height = 89
    Align = alTop
    Color = clCream
    TabOrder = 0
    object Label1: TLabel
      Left = 96
      Top = 7
      Width = 36
      Height = 13
      Caption = #1060'.'#1048'.'#1054'.'
    end
    object Label2: TLabel
      Left = 233
      Top = 7
      Width = 31
      Height = 13
      Caption = #1054#1090#1076#1077#1083
    end
    object Label3: TLabel
      Left = 351
      Top = 7
      Width = 58
      Height = 13
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
    end
    object btnReset: TButton
      Left = 8
      Top = 24
      Width = 75
      Height = 25
      Caption = #1057#1073#1088#1086#1089
      TabOrder = 5
      OnClick = btnResetClick
    end
    object edtFio: TEdit
      Left = 96
      Top = 27
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object cmbbxDept: TComboBox
      Left = 232
      Top = 27
      Width = 105
      Height = 21
      ItemHeight = 13
      TabOrder = 1
    end
    object cmbbxPost: TComboBox
      Left = 352
      Top = 27
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 2
    end
    object btnSearch: TButton
      Left = 528
      Top = 24
      Width = 75
      Height = 33
      Caption = #1055#1086#1080#1089#1082
      TabOrder = 4
      OnClick = btnSearchClick
    end
    object rdgFired: TRadioGroup
      Left = 97
      Top = 48
      Width = 400
      Height = 33
      Color = clCream
      Columns = 2
      Ctl3D = False
      Items.Strings = (
        #1058#1086#1083#1100#1082#1086' '#1091#1074#1086#1083#1077#1085#1085#1099#1077' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1080
        #1053#1077' '#1086#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1091#1074#1086#1083#1077#1085#1085#1099#1093' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074)
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 3
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 89
    Width = 772
    Height = 279
    Align = alClient
    DataSource = DM_main.dsReportEmp
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Title.Caption = #1058#1072#1073'. '#1053#1086#1084#1077#1088
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'full_name'
        Title.Caption = #1060'.'#1048'.'#1054
        Width = 174
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'birthday'
        Title.Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'phone'
        Title.Caption = #1058#1077#1083#1077#1092#1086#1085
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'id_flag_fired'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'id_dept'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'id_pos'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'name_dept'
        Title.Caption = #1054#1090#1076#1077#1083
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'name_pos'
        Title.Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'flag_fired'
        Title.Caption = #1055#1088#1086#1076#1086#1083#1078#1072#1077#1090' '#1088#1072#1073#1086#1090#1072#1090#1100
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 368
    Width = 772
    Height = 73
    Align = alBottom
    Color = clCream
    TabOrder = 2
  end
end
