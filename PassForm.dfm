object FormLogin: TFormLogin
  Left = 526
  Top = 229
  Width = 255
  Height = 227
  Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1080#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 239
    Height = 188
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 52
      Width = 31
      Height = 13
      Caption = #1051#1086#1075#1080#1085
    end
    object Label2: TLabel
      Left = 24
      Top = 82
      Width = 38
      Height = 13
      Caption = #1055#1072#1088#1086#1083#1100
    end
    object Edit1: TEdit
      Left = 72
      Top = 48
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'admin'
    end
    object Edit2: TEdit
      Left = 72
      Top = 80
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
      Text = '123'
    end
    object btnLogin: TButton
      Left = 24
      Top = 130
      Width = 75
      Height = 25
      Caption = #1042#1086#1081#1090#1080
      TabOrder = 2
      OnClick = btnLoginClick
    end
    object btnLogout: TButton
      Left = 120
      Top = 130
      Width = 75
      Height = 25
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 3
      OnClick = btnLogoutClick
    end
  end
end
