unit frm104;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB;

type
  TForm104 = class(TForm)
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
  Form104: TForm104;

implementation

uses DM2, frm101;
{$R *.dfm}

procedure TForm104.btnAddClick(Sender: TObject);
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
      Form101.DBGrid1.DataSource.DataSet.Refresh;
      Form104.Close;
    end;
end;

procedure TForm104.Button2Click(Sender: TObject);
begin
  DM_main.QryEmpty.Active := False;
  Form104.Close;
end;

procedure TForm104.btnUpdateClick(Sender: TObject);
var
   v_id: String;
begin
if (Edit1.Text = '') or (Edit2.Text = '') then
     begin
       Application.MessageBox('Все поля должны быть заполнены', 'Ошибка');
     end;
  if (Edit1.Text <> '') and (Edit2.Text <> '') then
    begin
      v_id := Form101.DBGrid1.DataSource.DataSet.FieldByName('id').AsString;
      with DM_main.QryEmpty do
        begin
          SQL.Clear;
          SQL.Add('Update positions ');
          SQL.Add(' Set name = ''' + Edit1.Text + ''' , ');
          SQL.Add(' salary = ' + Edit2.Text + ' ');
          SQL.Add('WHERE id = ' + v_id + ' ');
          try ExecSQL except
            on E: EDatabaseError do
          ShowMessage (E.Message);
        end;
      end;
      Form101.DBGrid1.DataSource.DataSet.Refresh;
      Form104.Close;
    end;
end;

procedure TForm104.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in[',']) then key:='.'; //запятую меняем на точку
  case Key of
	  '0'..'9', Chr (8):; {цифры и <BackSpace>}
	  '.' :
      if pos('.', Edit2.Text) <> 0 {пользователь уже ввел точку}
	      then Key:=Chr(0);      {вторую точку не отображать}
	   else Key:=Chr(0); {запрещенные символы не отображать}
	end;
end;

end.
