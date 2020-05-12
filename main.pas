unit main;

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

uses frm101, frm102, frm103, DM1;

{$R *.dfm}

procedure TFormMain.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  case TreeView1.Selected.StateIndex of
    1:
      begin
        if (not Assigned(Form101)) then
          Form101 := TForm101.Create(Self);
          Form101.WindowState := wsMaximized;
          Form101.Show;
      end;
    2:
      begin
        if (not Assigned(Form102)) then
          Form102 := TForm102.Create(Self);
          Form102.WindowState := wsMaximized;
          Form102.Show;
      end;
     4:
      begin
        if (not Assigned(Form103)) then
          Form103 := TForm103.Create(Self);
          Form103.WindowState := wsMaximized;
          Form103.Show;
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
