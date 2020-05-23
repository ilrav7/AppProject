unit AddEditPost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB;

type
  TAddEditPostForm = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    btnAdd: TButton;
    Button2: TButton;
    Label3: TLabel;
    btnUpdate: TButton;
    procedure btnAddClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddEditPostForm: TAddEditPostForm;

implementation

uses DM2, Positions;
{$R *.dfm}

procedure TAddEditPostForm.btnAddClick(Sender: TObject);
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
          SQL.Add('INSERT INTO positions(name, salary) ');
          SQL.Add(' VALUES ( ''' + Edit1.Text + ''' , ');
          SQL.Add(' ' + Edit2.Text + ' )');
          try ExecSQL except
            on E: EDatabaseError do
            ShowMessage (E.Message);
          end;
        end;
      DM_main.qryPost.Refresh;
      AddEditPostForm.Close;
    end;
end;

procedure TAddEditPostForm.Button2Click(Sender: TObject);
begin
  DM_main.QryEmpty.Active := False;
  AddEditPostForm.Close;
end;

procedure TAddEditPostForm.btnUpdateClick(Sender: TObject);
var
   v_id: String;
begin
  if (Edit1.Text = '') or (Edit2.Text = '') then
    begin
      Application.MessageBox('Все поля должны быть заполнены', 'Ошибка');
    end;
  if (Edit1.Text <> '') and (Edit2.Text <> '') then
    begin
      v_id := PositionsForm.cxGrid1DBTableView1.DataController.DataSource.DataSet.FieldByName('id').AsString;
      with DM_main.QryEmpty do
        begin
          SQL.Clear;
          SQL.Add('UPDATE positions ');
          SQL.Add(' SET name = ''' + Edit1.Text + ''' , ');
          SQL.Add(' salary = ' + Edit2.Text + ' ');
          SQL.Add('WHERE id = ' + v_id + ' ');
          try ExecSQL except
            on E: EDatabaseError do
            ShowMessage (E.Message);
          end;
        end;
      DM_main.qryPost.Refresh;
      AddEditPostForm.Close;
    end;
end;

procedure TAddEditPostForm.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in[',']) then
    begin
      key:='.'; //запятую меняем на точку
    end;
  Case Key of
	  '0'..'9', Chr (8):; {цифры и <BackSpace>}
	  '.' :
      if pos('.', Edit2.Text) <> 0 {пользователь уже ввел точку}
	      then Key:=Chr(0);      {вторую точку не отображать}
	   else Key:=Chr(0); {запрещенные символы не отображать}
	end;
end;

end.
