object Form103: TForm103
  Left = 384
  Top = 173
  Width = 683
  Height = 463
  Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080' AppProject [Form103]'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 667
    Height = 57
    Align = alTop
    Color = clCream
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 102
      Height = 13
      Caption = #1060#1072#1084#1080#1083#1080#1103' '#1080#1083#1080' '#1083#1086#1075#1080#1085
    end
    object Panel3: TPanel
      Left = 556
      Top = 1
      Width = 110
      Height = 55
      Align = alRight
      BevelOuter = bvNone
      Color = clCream
      TabOrder = 1
      object Button1: TButton
        Left = 24
        Top = 8
        Width = 75
        Height = 41
        Caption = #1055#1086#1080#1089#1082
        TabOrder = 0
        OnClick = Button1Click
      end
    end
    object Edit1: TEdit
      Left = 16
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 240
    Width = 667
    Height = 184
    Align = alBottom
    Color = clCream
    TabOrder = 1
  end
  object DBGrid_UsersApp: TDBGrid
    Left = 0
    Top = 57
    Width = 667
    Height = 183
    Align = alClient
    DataSource = DM_conn.dsUsersApp
    FixedColor = clSkyBlue
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'login'
        Title.Caption = #1051#1086#1075#1080#1085
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FIRSTNAME'
        Title.Caption = #1048#1084#1103
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LASTNAME'
        Title.Caption = #1060#1072#1084#1080#1083#1080#1103
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMMENTS'
        Visible = True
      end>
  end
end
