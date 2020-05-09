unit DM1;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, FMTBcd, ADODB, MemDS, DBAccess,
  MyAccess;

type
  TDM_MAIN = class(TDataModule)
    MyConnDB_INET: TMyConnection;
    QryTemp: TMyQuery;
    MyConnDB: TMyConnection;
    dsUsersApp: TDataSource;
    QryUsersApp: TMyQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM_MAIN: TDM_MAIN;
  User_ID: Integer;
  User_FIO: string;

implementation

{$R *.dfm}

end.
