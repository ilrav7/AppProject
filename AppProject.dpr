program AppProject;

uses
  Forms,
  PassForm in 'PassForm.pas' {FormLogin},
  main in 'main.pas' {FormMain},
  DM1 in 'DM1.pas' {DM_conn: TDataModule},
  frm101 in 'frm101.pas' {Form101},
  frm102 in 'frm102.pas' {Form102},
  frm103 in 'frm103.pas' {Form103},
  DM2 in 'DM2.pas' {DM_main: TDataModule},
  frm104 in 'frm104.pas' {Form104};

{$R *.res}

begin
  Application.Title := 'https://github.com/ilrav';
  if TFormLogin.Execute then
    begin
       Application.Initialize;
       Application.CreateForm(TFormMain, FormMain);
       Application.CreateForm(TDM_main, DM_main);
       Application.CreateForm(TForm104, Form104);
       Application.Run;
    end
  else begin
      DM_conn.MyConnDB.Connected := False;
      Application.Terminate;
  end;

end.
