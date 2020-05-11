object FormMain: TFormMain
  Left = 261
  Top = 186
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
      0300000024000000000000000000000001000000FFFFFFFF0000000000000000
      0BD1EFF0E0E2EEF7EDE8EAE829000000000000000000000002000000FFFFFFFF
      000000000000000010D3F7E5F220F1EEF2F0F3E4EDE8EAEEE21F000000000000
      000000000003000000FFFFFFFF000000000100000006CFF0EEF7E5E531000000
      000000000000000004000000FFFFFFFF000000000000000018CFEEEBFCE7EEE2
      E0F2E5EBE8202041707050726F6A656374}
  end
end
