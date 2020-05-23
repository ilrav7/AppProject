program AppProject;

uses
  Forms,
  PassForm in 'PassForm.pas' {FormLogin},
  main in 'main.pas' {FormMain},
  DM1 in 'DM1.pas' {DM_conn: TDataModule},
  frm101 in 'frm101.pas' {Form101},
  frm102 in 'frm102.pas' {Form102},
  UsersApplication in 'UsersApplication.pas' {UsersApplicationForm},
  DM2 in 'DM2.pas' {DM_main: TDataModule},
  AddEditPost in 'AddEditPost.pas' {AddEditPostForm},
  AddEditDept in 'AddEditDept.pas' {AddEditDeptForm},
  AddEditEmployee in 'AddEditEmployee.pas' {AddEditEmployeeForm},
  Departments in 'Departments.pas' {DepartmentsForm},
  Positions in 'Positions.pas' {PositionsForm},
  Employees in 'Employees.pas' {EmployeesForm},
  ReportEmployees in 'ReportEmployees.pas' {ReportEmployeesForm};

{$R *.res}

begin
  if TFormLogin.Execute then
    begin
       Application.Initialize;
       Application.Title := 'https://github.com/ilrav7';
       Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TDM_main, DM_main);
  Application.Run;
    end
  else begin
      DM_conn.MyConnDB.Connected := False;
      Application.Terminate;
  end;

end.
