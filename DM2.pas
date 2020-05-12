unit DM2;

interface

uses
  SysUtils, Classes, DB, MemDS, DBAccess, MyAccess;

type
  TDM_main = class(TDataModule)
    qryPost: TMyQuery;
    dsPost: TDataSource;
    qryEmpty: TMyQuery;
    qryDept: TMyQuery;
    dsDept: TDataSource;
    qryEmp: TMyQuery;
    dsEmp: TDataSource;
    qryReportEmp: TMyQuery;
    dsReportEmp: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM_main: TDM_main;

implementation

uses DM1;

{$R *.dfm}

end.
