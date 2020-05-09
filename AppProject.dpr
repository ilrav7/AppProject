program AppProject;

uses
  Forms,
  PassForm in 'PassForm.pas' {FormLogin},
  main in 'main.pas' {FormMain},
  DM1 in 'DM1.pas' {DM_MAIN: TDataModule},
  frm101 in 'frm101.pas' {Form101},
  frm102 in 'frm102.pas' {Form102},
  frm103 in 'frm103.pas' {Form103};

{$R *.res}

begin
  Application.Title := 'https://github.com/ilrav';
  if TFormLogin.Execute then
    begin
       Application.Initialize;
       Application.CreateForm(TFormMain, FormMain);
       Application.Run;
    end
  else begin
      DM_main.MyConnDB.Connected := False;
      Application.Terminate;
  end;

end.
