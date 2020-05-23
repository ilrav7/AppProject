unit AddEditDept;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB;

type
  TAddEditDeptForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    btnUpdate: TButton;
    btnClose: TButton;
    btnAdd: TButton;
    procedure btnAddClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddEditDeptForm: TAddEditDeptForm;

implementation

uses DM2, Departments;

{$R *.dfm}

procedure TAddEditDeptForm.btnAddClick(Sender: TObject);
begin
  if (Edit1.Text = '') or (Edit2.Text = '') then
    begin
      Application.MessageBox('Все поля должны быть заполнены', 'Ошибка');
    end;
  if (Edit1.Text <> '') and (Edit2.Text <> '') then
    begin
      with DM_main.QryEmpty do
        begin
          SQL.Clear;
          SQL.Add('INSERT INTO departments(name, phone) ');
          SQL.Add(' VALUES ( ''' + Edit1.Text + ''' , ');
          SQL.Add(' ''' + Edit2.Text + ''' )');
          try ExecSQL except
            on E: EDatabaseError do
          ShowMessage (E.Message);
        end;
      end;
    DM_main.qryDept.Refresh;
    AddEditDeptForm.Close;
  end;
end;

procedure TAddEditDeptForm.btnCloseClick(Sender: TObject);
begin
  DM_main.QryEmpty.Active := False;
  AddEditDeptForm.Close;
end;

procedure TAddEditDeptForm.btnUpdateClick(Sender: TObject);
var
  v_id: String;
begin
  if (Edit1.Text = '') or (Edit2.Text = '') then
    begin
      Application.MessageBox('Все поля должны быть заполнены', 'Ошибка');
    end;
  if (Edit1.Text <> '') and (Edit2.Text <> '') then
    begin
      v_id := DepartmentsForm.cxGrid1DBTableView1.DataController.DataSource.DataSet.FieldByName('id').AsString;
      with DM_main.QryEmpty do
        begin
          SQL.Clear;
          SQL.Add('UPDATE departments ');
          SQL.Add(' SET name = ''' + Edit1.Text + ''' , ');
          SQL.Add(' phone = ''' + Edit2.Text + ''' ');
          SQL.Add('WHERE id = ' + v_id + ' ');
          try ExecSQL except
            on E: EDatabaseError do
          ShowMessage (E.Message);
        end;
    end;
    DM_main.qryDept.Refresh;
    AddEditDeptForm.Close;
  end;  
end;

end.
