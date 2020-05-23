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
    btnSearchPost: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Panel2: TPanel;
    btnAdd: TButton;
    bntUpdate: TButton;
    btnDelete: TButton;
    Panel4: TPanel;
    Label3: TLabel;
    btnSearchDept: TButton;
    Edit3: TEdit;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    Panel3: TPanel;
    Label2: TLabel;
    btnSearchEmp: TButton;
    Edit2: TEdit;
    btnResetPost: TButton;
    btnResetEmp: TButton;
    btnResetDept: TButton;
    procedure btnAddClick(Sender: TObject);
    procedure btnSearchPostClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure bntUpdateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSearchDeptClick(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure btnSearchEmpClick(Sender: TObject);
    procedure btnResetPostClick(Sender: TObject);
    procedure btnResetEmpClick(Sender: TObject);
    procedure btnResetDeptClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form101: TForm101;

implementation

uses DM2, frm104, frm105, frm106;

{$R *.dfm}

procedure TForm101.btnAddClick(Sender: TObject);
begin
// ***** Справочник - Должности  *****
  if Pagecontrol1.TabIndex = 0 then
    begin
      if (not Assigned(Form104)) then
         Form104 := TForm104.Create(Self);
      Form104.btnAdd.Visible := True;
      Form104.btnUpdate.Visible := False;
      Form104.Edit1.Clear;
      Form104.Edit2.Clear;
      Form104.Show;
    end;
// ***** Справочник - Отделы  *****
  if Pagecontrol1.TabIndex = 1 then
     begin
      if (not Assigned(Form105)) then
          Form105 := TForm105.Create(Self);
      Form105.btnAdd.Visible := True;
      Form105.btnUpdate.Visible := False;
      Form105.Edit1.Clear;
      Form105.Edit2.Clear;
      Form105.Show;
    end;
// ***** Справочник - Сотрудники  *****
  if Pagecontrol1.TabIndex = 2 then
     begin
     if (not Assigned(Form106)) then
      Form106 := TForm106.Create(Self);
      Form106.btnAdd.Visible := True;
      Form106.btnUpdate.Visible := False;
      Form106.Edit1.Clear;
      Form106.MaskEdit1.Clear;
      Form106.Combobox1.Text := '';
      Form106.Combobox2.Text := '';
      Form106.Show;
     end;
end;

procedure TForm101.btnSearchPostClick(Sender: TObject);
begin
  DM_main.qryPost.Active := False;
  if Edit1.Text <> '' then
    begin
      DM_main.qryPost.MacroByName('name_filter').Active := True;
      DM_main.qryPost.Params.ParamByName('p_name').AsString := '%' + Edit1.Text + '%';
    end
  else begin
     DM_main.qryPost.MacroByName('name_filter').Active := False;
  end;
  DM_main.qryPost.Active := True;
end;

procedure TForm101.btnDeleteClick(Sender: TObject);
var
  v_id, v_full_name: String;
  v_fired_flag: Integer;
begin
// ***** Справочник - Должности  *****
     if Pagecontrol1.TabIndex = 0 then
       begin
         if DBGrid1.DataSource.DataSet.RecordCount <= 0 then
           ShowMessage('Ничего не выбрано');
         if (DBGrid1.DataSource.DataSet.RecordCount > 0)
            and (MessageDlg('Вы точно хотите удалить строку?',mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
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
// ***** Справочник - Отделы  *****
  if (Pagecontrol1.TabIndex = 1) then
   begin
       if DBGrid2.DataSource.DataSet.RecordCount <= 0 then
         ShowMessage('Ничего не выбрано');
       if (DBGrid2.DataSource.DataSet.RecordCount > 0)
           and (MessageDlg('Вы точно хотите удалить строку?',mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        begin
          v_id := DBGrid2.DataSource.DataSet.FieldByName('id').AsString;
          with DM_main.QryEmpty do
            begin
              SQL.Clear;
              SQL.Add('DELETE FROM departments ');
              SQL.Add(' WHERE id = ' + v_id + ' ');
               try ExecSQL except
                on E: EDatabaseError do
                 ShowMessage (E.Message);
               end;
             end;
           DBGrid2.DataSource.DataSet.Refresh;
         end;
       end;

// ***** Справочник - Сотрудники  *****
  if (Pagecontrol1.TabIndex = 2) then
    begin
       if DBGrid3.DataSource.DataSet.RecordCount <= 0 then
         ShowMessage('Ничего не выбрано')
       else
         v_fired_flag := DBGrid3.DataSource.DataSet.FieldByName('id_flag_fired').AsInteger;
       if v_fired_flag = 0  Then
          ShowMessage('Сотрудник уже отмечен на удаление');
       if (DBGrid3.DataSource.DataSet.RecordCount > 0)  and (v_fired_flag = 1)
           and (MessageDlg('Вы точно хотите отметить сотрудника на увольнение?',mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        begin
          v_id := DBGrid3.DataSource.DataSet.FieldByName('id').AsString;
          v_full_name :=  DBGrid3.DataSource.DataSet.FieldByName('full_name').AsString;
          with DM_main.QryEmpty do
            begin
              SQL.Clear;
              SQL.Add('Update employees ');
              SQL.Add('SET flag_fired = 0 ');
              SQL.Add(' WHERE id = ' + v_id + ' ');
               try ExecSQL except
                on E: EDatabaseError do
                 ShowMessage (E.Message);
               end;
             end;
           DBGrid3.DataSource.DataSet.Refresh;
         end;
    end;
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
          if (not Assigned(Form104)) then
             Form104 := TForm104.Create(Self);
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
    begin
    if DBGrid1.DataSource.DataSet.RecordCount = 0 then
         ShowMessage('Ничего не выбрано');
      if DBGrid1.DataSource.DataSet.RecordCount > 0 then
        begin
          if (not Assigned(Form105)) then
             Form105 := TForm105.Create(Self);
          Form105.btnAdd.Visible := False;
          Form105.btnUpdate.Visible := True;
          Form105.Edit1.Text := DBGrid2.DataSource.DataSet.FieldByName('name').AsString;
          Form105.Edit2.Text := DBGrid2.DataSource.DataSet.FieldByName('phone').AsString;
          Form105.Show;
        end;
    end;
// ***** Справочник - Сотрудники  *****
  if Pagecontrol1.TabIndex = 2 then
    begin
    if DBGrid3.DataSource.DataSet.RecordCount = 0 then
         ShowMessage('Ничего не выбрано');
      if DBGrid3.DataSource.DataSet.RecordCount > 0 then
        begin
         if (not Assigned(Form106)) then
          Form106 := TForm106.Create(Self);
          Form106.btnAdd.Visible := False;
          Form106.btnUpdate.Visible := True;
          Form106.Edit1.Text := DBGrid3.DataSource.DataSet.FieldByName('full_name').AsString;
          Form106.MaskEdit1.Text := DBGrid3.DataSource.DataSet.FieldByName('phone').AsString;
          Form106.DateTimePicker1.Date := StrToDate(DBGrid3.DataSource.DataSet.FieldByName('birthday').AsString);
          Form106.Combobox2.Text := DBGrid3.DataSource.DataSet.FieldByName('name_dept').AsString;
          Form106.Combobox1.Text := DBGrid3.DataSource.DataSet.FieldByName('name_pos').AsString;
          Form106.cxLookupComboBox1.EditValue := DBGrid3.DataSource.DataSet.FieldByName('id_dept').AsInteger;
          showmessage(Form106.cxLookupComboBox1.EditValue);
          Form106.Show;
        end;
    end;
end;

procedure TForm101.FormCreate(Sender: TObject);
begin
  DM_main.qryPost.MacroByName('name_filter').Active := False;
  DM_main.qryPost.Active := True;
  DM_main.qryDept.MacroByName('name_filter').Active := False;
  DM_main.qryDept.Active := True;
  DM_main.qryEmp.Active := False;
  DM_main.qryEmp.Active := True;
  PageControl1.ActivePageIndex := 0
end;

procedure TForm101.btnSearchDeptClick(Sender: TObject);
begin
  DM_main.qryDept.Active := False;
  if Edit3.Text <> '' then
    begin
      DM_main.qryDept.MacroByName('name_filter').Active := True;
      DM_main.qryDept.Params.ParamByName('p_name').AsString := '%' + Edit3.Text + '%';
    end
  else begin
     DM_main.qryDept.MacroByName('name_filter').Active := False;
  end;
  DM_main.qryDept.Active := True;
end;

procedure TForm101.TabSheet1Show(Sender: TObject);
begin
  btnDelete.Width := 75;
  btnDelete.Caption := 'Удалить';
end;

procedure TForm101.TabSheet2Show(Sender: TObject);
begin
  btnDelete.Width := 75;
  btnDelete.Caption := 'Удалить';
end;

procedure TForm101.TabSheet3Show(Sender: TObject);
begin
  btnDelete.Width := 145;
  btnDelete.Caption := 'Отметка на увольнение';
  if (DM_main.qryEmp.Active = True )
     then  DM_main.qryEmp.Refresh;
end;

procedure TForm101.btnSearchEmpClick(Sender: TObject);
begin
  DM_main.qryEmp.Active := False;
  if Edit2.Text <> '' then
    begin
      DM_main.qryEmp.MacroByName('fio_filter').Active := True;
      DM_main.qryEmp.Params.ParamByName('p_fio').AsString := '%' + Edit2.Text + '%';
    end
  else begin
     DM_main.qryEmp.MacroByName('fio_filter').Active := False;
  end;
  DM_main.qryEmp.Active := True;
end;

procedure TForm101.btnResetPostClick(Sender: TObject);
begin
  Edit1.Clear;
  DM_main.qryPost.Active := False;
  DM_main.qryPost.MacroByName('name_filter').Active := False;
  DM_main.qryPost.Active := True;
end;

procedure TForm101.btnResetEmpClick(Sender: TObject);
begin
  Edit2.Clear;
  DM_main.qryEmp.Active := False;
  DM_main.qryEmp.MacroByName('fio_filter').Active := False;
  DM_main.qryEmp.Active := True;
end;

procedure TForm101.btnResetDeptClick(Sender: TObject);
begin
  Edit3.Clear;
  DM_main.qryDept.Active := False;
  DM_main.qryDept.MacroByName('name_filter').Active := False;
  DM_main.qryDept.Active := True;
end;

end.
