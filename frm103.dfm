object Form103: TForm103
  Left = 273
  Top = 141
  Width = 873
  Height = 519
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
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 857
    Height = 89
    Align = alTop
    TabOrder = 0
  end
  object DBGrid_UsersApp: TDBGrid
    Left = 0
    Top = 89
    Width = 857
    Height = 335
    Align = alClient
    DataSource = DM_MAIN.dsUsersApp
    FixedColor = clSkyBlue
    TabOrder = 1
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
  object Panel2: TPanel
    Left = 0
    Top = 424
    Width = 857
    Height = 56
    Align = alBottom
    TabOrder = 2
  end
end
