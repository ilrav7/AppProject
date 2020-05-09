unit frm101;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB;

type
  TForm101 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form101: TForm101;

implementation

uses DM1;

{$R *.dfm}

procedure TForm101.Button1Click(Sender: TObject);
begin

 with DM_MAIN.QryTemp do
   begin
     SQL.Clear;
     SQL.Add('Select * From test ');
     try ExecSQL except
       on E: EDatabaseError do
       ShowMessage (E.Message);
     end;
     Active := True;
   end;
   Showmessage(DM_Main.QryTemp.Fields[1].AsString)
end;

end.
