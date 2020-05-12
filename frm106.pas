unit frm106;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Mask, DB, DBCtrls;

type
  TForm106 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    ComboBox2: TComboBox;
    Edit1: TEdit;
    btnAdd: TButton;
    btnClose: TButton;
    Label6: TLabel;
    btnUpdate: TButton;
    MaskEdit1: TMaskEdit;
    DateTimePicker1: TDateTimePicker;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form106: TForm106;

implementation

uses DM2, frm101;

{$R *.dfm}

procedure TForm106.btnCloseClick(Sender: TObject);
begin
  DM_main.QryEmpty.Active := False;
  Form106.Close;
end;

procedure TForm106.FormCreate(Sender: TObject);
var
  i: Integer;
begin
//**** begin ���������� combobox1 � combobox 2  ****//
  ComboBox1.Items.Clear;
  ComboBox2.Items.Clear;
  with DM_main.QryEmpty do
    begin
     SQL.Clear;
     SQL.Add('SELECT id, name ');
     SQL.Add('FROM positions ');
     SQL.Add('ORDER BY name');
     try
       ExecSQL except
         on E: EDatabaseError do
         ShowMessage(E.Message);
     end;
   end;
   DM_main.QryEmpty.First;
   for i:=0 to DM_main.QryEmpty.RecordCount - 1 do
      begin
        ComboBox1.Items.AddObject(DM_main.QryEmpty.Fields[1].AsString,
            Tobject(DM_main.QryEmpty.Fields[0].AsInteger));
        DM_main.QryEmpty.Next;
   end;

   with DM_main.QryEmpty do
    begin
     SQL.Clear;
     SQL.Add('SELECT id, name ');
     SQL.Add('FROM departments ');
     SQL.Add('ORDER BY name');
     try
       ExecSQL except
         on E: EDatabaseError do
         ShowMessage(E.Message);
     end;
   end;
   DM_main.QryEmpty.First;
   for i:=0 to DM_main.QryEmpty.RecordCount - 1 do
      begin
        ComboBox2.Items.AddObject(DM_main.QryEmpty.Fields[1].AsString,
            Tobject(DM_main.QryEmpty.Fields[0].AsInteger));
        DM_main.QryEmpty.Next;
      end;
//**** end ���������� combobox1 � combobox 2 ****//
end;

procedure TForm106.btnAddClick(Sender: TObject);
var
  id_dept, id_post: Integer;
begin
 if (Combobox2.ItemIndex = -1) or (Combobox1.ItemIndex = -1) then
     begin
       Application.MessageBox('�������� �������� �� ������', '������');
     end;
 if (Edit1.Text = '') or (Combobox1.Text = '') or (Combobox2.Text = '') then
     begin
       Application.MessageBox('��� ���� ������ ���� ���������', '������');
     end;
  if (Edit1.Text <> '') and (Combobox1.Text <> '') and (Combobox2.Text <> '')
      and (Combobox2.ItemIndex <> -1) and (Combobox1.ItemIndex <> -1) then
    begin
      id_dept := Integer(ComboBox2.Items.Objects[ComboBox2.ItemIndex]);
      id_post := Integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]);
      with DM_main.QryEmpty do
        begin
          SQL.Clear;
          SQL.Add('INSERT INTO employees(full_name, phone,  ');
          SQL.Add('      birthday, id_dept, id_pos, flag_fired )  ');
          SQL.Add(' VALUES ( ''' + Edit1.Text + ''' , ');
          SQL.Add(' ''' + MaskEdit1.Text + ''' , ');
          SQL.Add(' STR_TO_DATE( ''' + DateToStr(DateTimePicker1.Date) + ''' , ''%d.%m.%y'') , ');
          SQL.Add(' ' + IntToStr(id_dept) + ' , ');
          SQL.Add(' ' + IntToStr(id_post) + ' , 1 )');
          try ExecSQL except
            on E: EDatabaseError do
          ShowMessage (E.Message);
        end;
      end;
      Form101.DBGrid3.DataSource.DataSet.Refresh;
      Form106.Close;
    end;
end;

procedure TForm106.btnUpdateClick(Sender: TObject);
var
  id_dept, id_post: Integer;
  v_id: String;
begin
 if (Combobox2.ItemIndex = -1) or (Combobox1.ItemIndex = -1) then
     begin
       Application.MessageBox('�������� �������� �� ������', '������');
     end;
 if (Edit1.Text = '') or (Combobox1.Text = '') or (Combobox2.Text = '') then
     begin
       Application.MessageBox('��� ���� ������ ���� ���������', '������');
     end;
  if (Edit1.Text <> '') and (Combobox1.Text <> '') and (Combobox2.Text <> '')
      and (Combobox2.ItemIndex <> -1) and (Combobox1.ItemIndex <> -1) then
    begin
      id_dept := Integer(ComboBox2.Items.Objects[ComboBox2.ItemIndex]);
      id_post := Integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]);
      v_id := Form101.DBGrid3.DataSource.DataSet.FieldByName('id').AsString;
      with DM_main.QryEmpty do
        begin
          SQL.Clear;
          SQL.Add('UPDATE employees ');
          SQL.Add(' SET full_name = ''' + Edit1.Text + ''',');
          SQL.Add('     phone = ''' + MaskEdit1.Text + ''', ');
          SQL.Add('     birthday = STR_TO_DATE(''' + DateToStr(DateTimePicker1.Date) + ''' , ''%d.%m.%y'') ,');
          SQL.Add('     id_dept = ' + IntToStr(id_dept)  + ',');
          SQL.Add('     id_pos = ' + IntToStr(id_post) + '  ');
          SQL.Add(' Where id = ' + v_id + ' ');

          try ExecSQL except
            on E: EDatabaseError do
          ShowMessage (E.Message);
        end;
      end;
      Form101.DBGrid3.DataSource.DataSet.Refresh;
      Form106.Close;
    end;
end;

end.
