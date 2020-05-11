unit frm105;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB;

type
  TForm105 = class(TForm)
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
  Form105: TForm105;

implementation

uses DM2, frm101;

{$R *.dfm}

procedure TForm105.btnAddClick(Sender: TObject);
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
    Form101.DBGrid2.DataSource.DataSet.Refresh;
    Form105.Close;
  end;
end;

procedure TForm105.btnCloseClick(Sender: TObject);
begin
  DM_main.QryEmpty.Active := False;
  Form105.Close;
end;

procedure TForm105.btnUpdateClick(Sender: TObject);
var
   v_id: String;
begin
if (Edit1.Text = '') or (Edit2.Text = '') then
     begin
       Application.MessageBox('Все поля должны быть заполнены', 'Ошибка');
     end;
  if (Edit1.Text <> '') and (Edit2.Text <> '') then
    begin
      v_id := Form101.DBGrid2.DataSource.DataSet.FieldByName('id').AsString;
      with DM_main.QryEmpty do
        begin
          SQL.Clear;
          SQL.Add('Update departments ');
          SQL.Add(' Set name = ''' + Edit1.Text + ''' , ');
          SQL.Add(' phone = ''' + Edit2.Text + ''' ');
          SQL.Add('WHERE id = ' + v_id + ' ');
          try ExecSQL except
            on E: EDatabaseError do
          ShowMessage (E.Message);
        end;
      end;
      Form101.DBGrid2.DataSource.DataSet.Refresh;
      Form105.Close;
    end;
end;

end.
