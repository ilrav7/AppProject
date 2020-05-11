unit frm101;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ComCtrls, Menus, Grids, DBGrids, ExtCtrls;

type
  TForm101 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    btnSearch: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Panel2: TPanel;
    btnAdd: TButton;
    bntUpdate: TButton;
    btnDelete: TButton;
    procedure btnAddClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure bntUpdateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form101: TForm101;

implementation

uses DM2, frm104;

{$R *.dfm}

procedure TForm101.btnAddClick(Sender: TObject);
begin
// ***** Справочник - Должности  *****
  if Pagecontrol1.TabIndex = 0 then
    begin
      Form104.btnAdd.Visible := True;
      Form104.btnUpdate.Visible := False;
      Form104.Edit1.Clear;
      Form104.Edit2.Clear;
      Form104.Show;
    end;
// ***** Справочник - Отделы  *****
  if Pagecontrol1.TabIndex = 1 then
    showmessage('1');
// ***** Справочник - Сотрудники  *****
  if Pagecontrol1.TabIndex = 2 then
    showmessage('2');
end;

procedure TForm101.btnSearchClick(Sender: TObject);
begin
  DM_main.qryPost.Active := False;
  if Edit1.Text <> '' then
    begin
      DM_main.qryPost.MacroByName('name_filter').Active := True;
      DM_main.qryPost.Params.ParamByName('p_name').AsString := Edit1.Text;
    end
  else begin
     DM_main.qryPost.MacroByName('name_filter').Active := False;
  end;
  DM_main.qryPost.Active := True;
end;

procedure TForm101.btnDeleteClick(Sender: TObject);
var
  v_id: String;
begin
// ***** Справочник - Должности  *****
 if MessageDlg('Вы точно хотите удалить строку',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
     if Pagecontrol1.TabIndex = 0 then
      begin
       if DBGrid1.DataSource.DataSet.RecordCount = 0 then
         ShowMessage('Ничего не выбрано');
      if DBGrid1.DataSource.DataSet.RecordCount > 0 then
        begin
          v_id := DBGrid1.DataSource.DataSet.FieldByName('id').AsString;
          with DM_main.QryEmpty do
            begin
              SQL.Clear;
              SQL.Add('DELETE FROM positions ');
              SQL.Add(' WHERE id = ' + v_id + ' ');
              try ExecSQL except
               on E: EDatabaseError do
                 ShowMessage (E.Message);
              end;
            end;
          DBGrid1.DataSource.DataSet.Refresh;
         end;
        end;
    end;
// ***** Справочник - Отделы  *****
  if Pagecontrol1.TabIndex = 1 then
    showmessage('1');
// ***** Справочник - Сотрудники  *****
  if Pagecontrol1.TabIndex = 2 then
    showmessage('2');
end;

procedure TForm101.bntUpdateClick(Sender: TObject);
begin
// ***** Справочник - Должности  *****
  if Pagecontrol1.TabIndex = 0 then
    begin
      if DBGrid1.DataSource.DataSet.RecordCount = 0 then
         ShowMessage('Ничего не выбрано');
      if DBGrid1.DataSource.DataSet.RecordCount > 0 then
        begin
          Form104.btnAdd.Visible := False;
          Form104.btnUpdate.Visible := True;
          Form104.Edit1.Text := DBGrid1.DataSource.DataSet.FieldByName('name').AsString;
          Form104.Edit2.Text := DBGrid1.DataSource.DataSet.FieldByName('salary').AsString;
          Form104.Edit2.Text  := StringReplace(Form104.Edit2.Text, ',', '.', [rfReplaceAll, rfIgnoreCase]);
          Form104.Show;
        end;
    end;
// ***** Справочник - Отделы  *****
  if Pagecontrol1.TabIndex = 1 then
    showmessage('1');
// ***** Справочник - Сотрудники  *****
  if Pagecontrol1.TabIndex = 2 then
    showmessage('2');
end;

procedure TForm101.FormCreate(Sender: TObject);
begin
  DM_main.qryPost.MacroByName('name_filter').Active := False;
  DM_main.qryPost.Active := True;
end;

end.
