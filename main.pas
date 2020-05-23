unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls;

type
  TFormMain = class(TForm)
    TreeView1: TTreeView;
    Splitter1: TSplitter;
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    
  end;

var
  FormMain: TFormMain;

implementation

uses  DM1, Departments, Positions, Employees, ReportEmployees, UsersApplication;

{$R *.dfm}

procedure TFormMain.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
 case TreeView1.Selected.StateIndex of
    1:
      begin
        if (not Assigned(DepartmentsForm)) then
          DepartmentsForm := TDepartmentsForm.Create(Self);
        DepartmentsForm.WindowState := wsMaximized;
        DepartmentsForm.Show;
      end;
    2:
      begin
        if (not Assigned(PositionsForm)) then
          PositionsForm := TPositionsForm.Create(Self);
        PositionsForm.WindowState := wsMaximized;
        PositionsForm.Show;
      end;
    3:
      begin
        if (not Assigned(EmployeesForm)) then
          EmployeesForm := TEmployeesForm.Create(Self);
        EmployeesForm.WindowState := wsMaximized;
        EmployeesForm.Show;
      end;
    4:
      begin
        if (not Assigned(ReportEmployeesForm)) then
          ReportEmployeesForm := TReportEmployeesForm.Create(Self);
        ReportEmployeesForm.WindowState := wsMaximized;
        ReportEmployeesForm.Show;
      end;
     5:
      begin
        if (not Assigned(UsersApplicationForm)) then
          UsersApplicationForm := TUsersApplicationForm.Create(Self);
        UsersApplicationForm.WindowState := wsMaximized;
        UsersApplicationForm.Show;
      end;  


  end;
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //ShowMessage('Exit - завершение работы');
  DM_conn.MyConnDB.Connected := False;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
   FormMain.Caption := FormMain.Caption + ' - ' + User_FIO;
end;

end.
