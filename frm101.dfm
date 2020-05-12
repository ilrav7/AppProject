object Form101: TForm101
  Left = 312
  Top = 175
  BorderStyle = bsNone
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' [Form101]'
  ClientHeight = 495
  ClientWidth = 857
  Color = clWindow
  Ctl3D = False
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 857
    Height = 438
    ActivePage = TabSheet3
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Style = tsFlatButtons
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' "'#1044#1086#1083#1078#1085#1086#1089#1090#1080'"'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnShow = TabSheet1Show
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 849
        Height = 65
        Align = alTop
        BevelOuter = bvNone
        Color = clCream
        TabOrder = 0
        object Label1: TLabel
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
        object btnSearchPost: TButton
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
          TabOrder = 0
          OnClick = btnSearchPostClick
        end
        object Edit1: TEdit
          Left = 104
          Top = 27
          Width = 121
          Height = 19
          TabOrder = 1
        end
        object btnResetPost: TButton
          Left = 0
          Top = 15
          Width = 75
          Height = 33
          Caption = #1057#1073#1088#1086#1089
          TabOrder = 2
          OnClick = btnResetPostClick
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 65
        Width = 849
        Height = 342
        Align = alClient
        DataSource = DM_main.dsPost
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
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
            Title.Caption = 'ID'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'name'
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1076#1086#1083#1078#1085#1086#1089#1090#1080
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 227
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'salary'
            Title.Caption = #1054#1082#1083#1072#1076
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 121
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' "'#1054#1090#1076#1077#1083#1099'"'
      ImageIndex = 1
      OnShow = TabSheet2Show
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 849
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
          TabOrder = 0
          OnClick = btnSearchDeptClick
        end
        object Edit3: TEdit
          Left = 104
          Top = 27
          Width = 121
          Height = 19
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
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
      object DBGrid2: TDBGrid
        Left = 0
        Top = 65
        Width = 849
        Height = 342
        Align = alClient
        DataSource = DM_main.dsDept
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'name'
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1086#1090#1076#1077#1083#1072
            Width = 201
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'phone'
            Title.Caption = #1058#1077#1083#1077#1092#1086#1085
            Width = 103
            Visible = True
          end>
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' "'#1057#1086#1090#1088#1091#1076#1085#1080#1082#1080'"'
      ImageIndex = 2
      OnShow = TabSheet3Show
      object DBGrid3: TDBGrid
        Left = 0
        Top = 65
        Width = 849
        Height = 342
        Align = alClient
        DataSource = DM_main.dsEmp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Title.Caption = #1058#1072#1073'.'#1085#1086#1084#1077#1088
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'full_name'
            Title.Caption = #1060'.'#1048'.'#1054'.'
            Width = 158
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'phone'
            Title.Caption = #1058#1077#1083#1077#1092#1086#1085
            Width = 99
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'birthday'
            Title.Caption = #1044'.'#1052'.'#1043'. '#1088#1086#1078#1076#1077#1085#1080#1103
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'name_dept'
            Title.Caption = #1054#1090#1076#1077#1083
            Width = 118
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'name_pos'
            Title.Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
            Width = 107
            Visible = True
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
            FieldName = 'flag_fired'
            Title.Caption = #1055#1088#1086#1076#1086#1083#1078#1072#1077#1090' '#1088#1072#1073#1086#1090#1072#1090#1100
            Visible = True
          end>
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 849
        Height = 65
        Align = alTop
        BevelOuter = bvNone
        Color = clCream
        TabOrder = 1
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
          TabOrder = 0
          OnClick = btnSearchEmpClick
        end
        object Edit2: TEdit
          Left = 104
          Top = 27
          Width = 121
          Height = 19
          TabOrder = 1
        end
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 438
    Width = 857
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
      Width = 145
      Height = 25
      Caption = #1047#1072#1087#1086#1083#1085#1103#1077#1090#1089#1103' '#1076#1080#1085#1072#1084#1080#1095#1077#1089#1082#1080
      TabOrder = 2
      OnClick = btnDeleteClick
    end
  end
end
