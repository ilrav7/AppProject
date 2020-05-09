object FormMain: TFormMain
  Left = 305
  Top = 167
  Width = 928
  Height = 451
  Caption = 'AppProject'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 161
    Top = 0
    Height = 412
    Beveled = True
    Color = clSkyBlue
    ParentColor = False
  end
  object TreeView1: TTreeView
    Left = 0
    Top = 0
    Width = 161
    Height = 412
    Align = alLeft
    Indent = 19
    TabOrder = 0
    OnChange = TreeView1Change
    Items.Data = {
      0300000022000000000000000000000001000000FFFFFFFF0000000000000000
      09C2EAEBE0E4EAE0203122000000000000000000000002000000FFFFFFFF0000
      00000000000009C2EAEBE0E4EAE020321F000000000000000000000003000000
      FFFFFFFF000000000100000006CFF0EEF7E5E531000000000000000000000004
      000000FFFFFFFF000000000000000018CFEEEBFCE7EEE2E0F2E5EBE820204170
      7050726F6A656374}
  end
end
