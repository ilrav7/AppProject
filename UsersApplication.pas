unit UsersApplication;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Menus;

type
  TUsersApplicationForm = class(TForm)
    Panel1: TPanel;
    DBGrid_UsersApp: TDBGrid;
    Panel2: TPanel;
    Button1: TButton;
    Panel3: TPanel;
    Edit1: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UsersApplicationForm: TUsersApplicationForm;

implementation

uses DM1;

{$R *.dfm}

procedure TUsersApplicationForm.Button1Click(Sender: TObject);
begin
  DM_conn.QryUsersApp.Active := False;
  if Edit1.Text <> '' then
    begin
       DM_conn.QryUsersApp.MacroByName('search_filter').Active := True;
       DM_conn.QryUsersApp.Params.ParamByName('p_login').AsString := '%' + Edit1.Text + '%';
       DM_conn.QryUsersApp.Params.ParamByName('p_lastname').AsString := '%' + Edit1.Text + '%';
    end
    else DM_conn.QryUsersApp.MacroByName('search_filter').Active := False;
  DM_conn.QryUsersApp.Active := True;
end;

procedure TUsersApplicationForm.FormShow(Sender: TObject);
begin
 DM_conn.QryUsersApp.Active := True;
end;

end.

//INSERT INTO `admins`( `login`, `password`, `FIRSTNAME`, `LASTNAME`) VALUES (admin,SHA1('123'),'????', '??????')
