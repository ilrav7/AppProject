unit frm102;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls;

type
  TForm102 = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    CheckBox1: TCheckBox;
    btnReset: TButton;
    edtFio: TEdit;
    cmbbxDept: TComboBox;
    cmbbxPost: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnSearch: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form102: TForm102;

implementation

{$R *.dfm}

end.
