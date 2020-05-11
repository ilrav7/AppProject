unit frm103;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Menus;

type
  TForm103 = class(TForm)
    Panel1: TPanel;
    DBGrid_UsersApp: TDBGrid;
    Panel2: TPanel;
    Button1: TButton;
    Panel3: TPanel;
    Edit1: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
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

procedure TForm103.Button1Click(Sender: TObject);
begin
  DM_conn.QryUsersApp.Active := True;
end;

end.

//INSERT INTO `admins`( `login`, `password`, `FIRSTNAME`, `LASTNAME`) VALUES (admin,SHA1('123'),'????', '??????')
