unit frm103;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids;

type
  TForm103 = class(TForm)
    Panel1: TPanel;
    DBGrid_UsersApp: TDBGrid;
    Panel2: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form103: TForm103;

implementation

uses DM1;

{$R *.dfm}

end.

//INSERT INTO `admins`( `login`, `password`, `FIRSTNAME`, `LASTNAME`) VALUES (admin,SHA1('123'),'????', '??????')
