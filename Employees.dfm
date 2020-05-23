object EmployeesForm: TEmployeesForm
  Left = 300
  Top = 122
  Width = 928
  Height = 480
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' - '#1057#1086#1090#1088#1091#1076#1085#1080#1082#1080' (Employees)'
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
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    Color = clCream
    TabOrder = 0
    object Label2: TLabel
      Left = 104
      Top = 5
      Width = 39
      Height = 13
      Caption = #1060'.'#1048'.'#1054
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnSearchEmp: TButton
      Left = 296
      Top = 15
      Width = 75
      Height = 33
      Caption = #1055#1086#1080#1089#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnSearchEmpClick
    end
    object Edit2: TEdit
      Left = 104
      Top = 27
      Width = 121
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object btnResetEmp: TButton
      Left = 0
      Top = 15
      Width = 75
      Height = 33
      Caption = #1057#1073#1088#1086#1089
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnResetEmpClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 384
    Width = 912
    Height = 57
    Align = alBottom
    BevelOuter = bvNone
    Color = clCream
    TabOrder = 1
    object btnAdd: TButton
      Left = 40
      Top = 16
      Width = 75
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 0
      OnClick = btnAddClick
    end
    object bntUpdate: TButton
      Left = 152
      Top = 16
      Width = 75
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 1
      OnClick = bntUpdateClick
    end
    object btnDelete: TButton
      Left = 272
      Top = 16
      Width = 137
      Height = 25
      Caption = #1054#1090#1084#1077#1090#1080#1090#1100' '#1085#1072' '#1091#1076#1072#1083#1077#1085#1080#1077
      TabOrder = 2
      OnClick = btnDeleteClick
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 65
    Width = 912
    Height = 319
    Align = alClient
    TabOrder = 2
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Black'
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DM_main.dsEmp
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid1DBTableView1id: TcxGridDBColumn
        Caption = #1058#1072#1073'. '#1085#1086#1084'.'
        DataBinding.FieldName = 'id'
        Styles.Header = cxStyle1
      end
      object cxGrid1DBTableView1full_name: TcxGridDBColumn
        Caption = #1060'.'#1048'.'#1054'.'
        DataBinding.FieldName = 'full_name'
        Styles.Header = cxStyle1
        Width = 185
      end
      object cxGrid1DBTableView1birthday: TcxGridDBColumn
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
        DataBinding.FieldName = 'birthday'
        Styles.Header = cxStyle1
        Width = 101
      end
      object cxGrid1DBTableView1phone: TcxGridDBColumn
        Caption = #1058#1077#1083#1077#1092#1086#1085
        DataBinding.FieldName = 'phone'
        Styles.Header = cxStyle1
      end
      object cxGrid1DBTableView1id_flag_fired: TcxGridDBColumn
        DataBinding.FieldName = 'id_flag_fired'
        Visible = False
        Styles.Header = cxStyle1
      end
      object cxGrid1DBTableView1id_dept: TcxGridDBColumn
        DataBinding.FieldName = 'id_dept'
        Visible = False
        Styles.Header = cxStyle1
      end
      object cxGrid1DBTableView1id_pos: TcxGridDBColumn
        DataBinding.FieldName = 'id_pos'
        Visible = False
        Styles.Header = cxStyle1
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
      object cxGrid1DBTableView1flag_fired: TcxGridDBColumn
        Caption = #1055#1088#1086#1076#1086#1083#1078#1072#1077#1090' '#1088#1072#1073#1086#1090#1072#1090#1100
        DataBinding.FieldName = 'flag_fired'
        Styles.Header = cxStyle1
        Width = 141
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 664
    Top = 16
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle2: TcxStyle
    end
  end
end
