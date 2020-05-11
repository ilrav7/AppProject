object Form101: TForm101
  Left = 319
  Top = 157
  BorderStyle = bsNone
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' [Form101]'
  ClientHeight = 509
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
    Height = 452
    ActivePage = TabSheet1
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
          Left = 24
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
        object btnSearch: TButton
          Left = 216
          Top = 15
          Width = 75
          Height = 33
          Caption = #1055#1086#1082#1072#1079#1072#1090#1100
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = btnSearchClick
        end
        object Edit1: TEdit
          Left = 24
          Top = 27
          Width = 121
          Height = 19
          TabOrder = 1
        end
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 65
        Width = 849
        Height = 356
        Align = alClient
        DataSource = DM_main.dsPost
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'name'
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1076#1086#1083#1078#1085#1086#1089#1090#1080
            Width = 227
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'salary'
            Title.Caption = #1054#1082#1083#1072#1076
            Width = 121
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' "'#1054#1090#1076#1077#1083#1099'"'
      ImageIndex = 1
    end
    object TabSheet3: TTabSheet
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' "'#1057#1086#1090#1088#1091#1076#1085#1080#1082#1080'"'
      ImageIndex = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 452
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
      Width = 75
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 2
      OnClick = btnDeleteClick
    end
  end
end
