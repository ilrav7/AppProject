object DepartmentsForm: TDepartmentsForm
  Left = 460
  Top = 154
  Width = 562
  Height = 480
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' - '#1054#1090#1076#1077#1083#1099' (Departments)'
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
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 546
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    Color = clCream
    TabOrder = 0
    object Label3: TLabel
      Left = 104
      Top = 5
      Width = 89
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnSearchDept: TButton
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
      OnClick = btnSearchDeptClick
    end
    object Edit3: TEdit
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
    object btnResetDept: TButton
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
      OnClick = btnResetDeptClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 384
    Width = 546
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
      Width = 89
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 2
      OnClick = btnDeleteClick
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 65
    Width = 546
    Height = 319
    Align = alClient
    TabOrder = 2
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Black'
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DM_main.dsDept
      DataController.DetailKeyFieldNames = 'id'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cxGrid1DBTableView1id: TcxGridDBColumn
        Caption = 'ID'
        DataBinding.FieldName = 'id'
        Styles.Header = cxStyle1
      end
      object cxGrid1DBTableView1name: TcxGridDBColumn
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DataBinding.FieldName = 'name'
        Styles.Header = cxStyle1
        Width = 150
      end
      object cxGrid1DBTableView1phone: TcxGridDBColumn
        Caption = #1058#1077#1083#1077#1092#1086#1085
        DataBinding.FieldName = 'phone'
        Styles.Header = cxStyle1
        Width = 100
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 472
    Top = 8
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
