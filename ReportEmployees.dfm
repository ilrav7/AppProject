object ReportEmployeesForm: TReportEmployeesForm
  Left = 323
  Top = 128
  Width = 928
  Height = 480
  Caption = #1054#1090#1095#1077#1090' - '#1057#1086#1090#1088#1091#1076#1085#1080#1082#1080' (ReportEmployees)'
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
    Width = 912
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
      Left = 371
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
      TabOrder = 3
      OnClick = btnResetClick
    end
    object edtFio: TEdit
      Left = 96
      Top = 27
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object btnSearch: TButton
      Left = 536
      Top = 24
      Width = 75
      Height = 33
      Caption = #1055#1086#1080#1089#1082
      TabOrder = 2
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
      TabOrder = 1
    end
    object cxLookupComboBox1: TcxLookupComboBox
      Left = 232
      Top = 27
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          FieldName = 'name'
        end>
      Properties.ListSource = DM_main.dsDept
      TabOrder = 4
      OnEnter = cxLookupComboBox1Enter
      Width = 121
    end
    object cxLookupComboBox2: TcxLookupComboBox
      Left = 370
      Top = 27
      Properties.KeyFieldNames = 'id'
      Properties.ListColumns = <
        item
          FieldName = 'name'
        end>
      Properties.ListSource = DM_main.dsPost
      TabOrder = 5
      OnEnter = cxLookupComboBox2Enter
      Width = 137
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 392
    Width = 912
    Height = 49
    Align = alBottom
    Color = clCream
    TabOrder = 1
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 89
    Width = 912
    Height = 303
    Align = alClient
    TabOrder = 2
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Blue'
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DM_main.dsReportEmp
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid1DBTableView1id: TcxGridDBColumn
        Caption = #1058#1072#1073'. '#1085#1086#1084'.'
        DataBinding.FieldName = 'id'
        Styles.Header = cxStyle1
        Width = 65
      end
      object cxGrid1DBTableView1full_name: TcxGridDBColumn
        Caption = #1060'.'#1048'.'#1054'.'
        DataBinding.FieldName = 'full_name'
        Styles.Header = cxStyle1
        Width = 180
      end
      object cxGrid1DBTableView1birthday: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
        DataBinding.FieldName = 'birthday'
        Styles.Header = cxStyle1
        Width = 100
      end
      object cxGrid1DBTableView1phone: TcxGridDBColumn
        Caption = #1058#1077#1083#1077#1092#1086#1085
        DataBinding.FieldName = 'phone'
        Styles.Header = cxStyle1
        Width = 120
      end
      object cxGrid1DBTableView1id_flag_fired: TcxGridDBColumn
        DataBinding.FieldName = 'id_flag_fired'
        Visible = False
        IsCaptionAssigned = True
      end
      object cxGrid1DBTableView1id_dept: TcxGridDBColumn
        DataBinding.FieldName = 'id_dept'
        Visible = False
      end
      object cxGrid1DBTableView1id_pos: TcxGridDBColumn
        DataBinding.FieldName = 'id_pos'
        Visible = False
      end
      object cxGrid1DBTableView1name_dept: TcxGridDBColumn
        Caption = #1054#1090#1076#1077#1083
        DataBinding.FieldName = 'name_dept'
        Styles.Header = cxStyle1
        Width = 120
      end
      object cxGrid1DBTableView1name_pos: TcxGridDBColumn
        Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
        DataBinding.FieldName = 'name_pos'
        Styles.Header = cxStyle1
        Width = 120
      end
      object cxGrid1DBTableView1salary: TcxGridDBColumn
        Caption = #1054#1082#1083#1072#1076
        DataBinding.FieldName = 'salary'
        Styles.Header = cxStyle1
      end
      object cxGrid1DBTableView1flag_fired: TcxGridDBColumn
        Caption = #1055#1088#1086#1076#1086#1083#1078#1072#1077#1090' '#1088#1072#1073#1086#1090#1072#1090#1100
        DataBinding.FieldName = 'flag_fired'
        Styles.Header = cxStyle1
        Width = 143
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
  end
end
