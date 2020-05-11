unit DM2;

interface

uses
  SysUtils, Classes, DB, MemDS, DBAccess, MyAccess;

type
  TDM_main = class(TDataModule)
    qryPost: TMyQuery;
    dsPost: TDataSource;
    qryEmpty: TMyQuery;
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
