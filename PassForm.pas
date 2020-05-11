unit PassForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB;

type
  TFormLogin = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    btnLogin: TButton;
    btnLogout: TButton;
    procedure btnLoginClick(Sender: TObject);
    procedure btnLogoutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
     class function Execute: boolean;

  end;

var
  FormLogin: TFormLogin;

implementation

uses DM1;

{$R *.dfm}

class function TFormLogin.Execute: boolean;
begin
  with TFormLogin.Create(nil) do
  try
    result:= ShowModal = mrOk;
  finally
    Free;
  end;
end;

procedure TFormLogin.btnLoginClick(Sender: TObject);
var
   v_login, v_password: String;
begin
 v_login := Edit1.Text;
 v_password := Edit2.Text;

 with DM_conn.QryTemp do
   begin
     SQL.Clear;
     SQL.Add('SELECT id, CONCAT(firstname, '' '', lastname) as FIO ');
     SQL.Add(' FROM users_App ');
     SQL.Add(' Where login = ''' + v_login + ''' ');
     SQL.Add('       AND password = SHA1(''' + v_password + ''' ) ');
     try ExecSQL except
       on E: EDatabaseError do
       ShowMessage (E.Message);
     end;
     Active := True;
   end;

 if not VarIsNull(DM_conn.QryTemp.FieldValues['id']) then
   begin
     ModalResult:= mrOk;
     DM1.User_ID := DM_conn.QryTemp.Fields[0].AsInteger;
     DM1.User_FIO := DM_conn.QryTemp.Fields[1].AsString;
   end
  else
    Application.MessageBox('Логин или пароль введены не верно', 'Ошибка');
end;

procedure TFormLogin.btnLogoutClick(Sender: TObject);
begin
  DM_conn.MyConnDB.Connected := False;
  Application.Terminate;
end;

procedure TFormLogin.FormCreate(Sender: TObject);
begin
(* Если DataModule не создан, то создаем его вручную  для создания
   удаленного подключения к БД *)
  if (not Assigned(DM_conn)) then
    begin
      DM_conn := TDM_conn.Create(Application);
    end;
  { if (not Assigned(DM_main)) then
    showmessage('dm_main не создан')    }
end;

end.
