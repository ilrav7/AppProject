unit DM1;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, FMTBcd, ADODB, MemDS, DBAccess,
  MyAccess;

type
  TDM_conn = class(TDataModule)
    MyConnDB: TMyConnection;
    QryTemp: TMyQuery;
    dsUsersApp: TDataSource;
    QryUsersApp: TMyQuery;
    MyConnDB_l: TMyConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM_conn: TDM_conn;
  User_ID: Integer;
  User_FIO: string;

implementation

{$R *.dfm}

end.
