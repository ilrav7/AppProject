unit Employees;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, DB,
  cxDBData, cxClasses, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxGridCustomView, cxGrid, StdCtrls,
  ExtCtrls;

type
  TEmployeesForm = class(TForm)
    Panel3: TPanel;
    Label2: TLabel;
    btnSearchEmp: TButton;
    Edit2: TEdit;
    btnResetEmp: TButton;
    Panel2: TPanel;
    btnAdd: TButton;
    bntUpdate: TButton;
    btnDelete: TButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1id: TcxGridDBColumn;
    cxGrid1DBTableView1full_name: TcxGridDBColumn;
    cxGrid1DBTableView1phone: TcxGridDBColumn;
    cxGrid1DBTableView1birthday: TcxGridDBColumn;
    cxGrid1DBTableView1flag_fired: TcxGridDBColumn;
    cxGrid1DBTableView1id_flag_fired: TcxGridDBColumn;
    cxGrid1DBTableView1id_dept: TcxGridDBColumn;
    cxGrid1DBTableView1id_pos: TcxGridDBColumn;
    cxGrid1DBTableView1name_dept: TcxGridDBColumn;
    cxGrid1DBTableView1name_pos: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    procedure btnResetEmpClick(Sender: TObject);
    procedure btnSearchEmpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure bntUpdateClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EmployeesForm: TEmployeesForm;

implementation

uses DM2, AddEditEmployee;

{$R *.dfm}

procedure TEmployeesForm.btnResetEmpClick(Sender: TObject);
begin
  Edit2.Clear;
  DM_main.qryEmp.Active := False;
  DM_main.qryEmp.MacroByName('fio_filter').Active := False;
  DM_main.qryEmp.Active := True;
end;

procedure TEmployeesForm.btnSearchEmpClick(Sender: TObject);
begin
  DM_main.qryEmp.Active := False;
  if Edit2.Text <> '' then
    begin
      DM_main.qryEmp.MacroByName('fio_filter').Active := True;
      DM_main.qryEmp.Params.ParamByName('p_fio').AsString := '%' + Edit2.Text + '%';
    end
  else
    begin
     DM_main.qryEmp.MacroByName('fio_filter').Active := False;
    end;
  DM_main.qryEmp.Active := True;
end;

procedure TEmployeesForm.FormCreate(Sender: TObject);
begin
  DM_main.qryEmp.Active := False;
  DM_main.qryEmp.ReadOnly := True;
  DM_main.qryEmp.Active := True;
end;

procedure TEmployeesForm.btnAddClick(Sender: TObject);
begin
  if (not Assigned(AddEditEmployeeForm)) then
    begin
      AddEditEmployeeForm := TAddEditEmployeeForm.Create(Self);
    end;
  AddEditEmployeeForm.btnAdd.Visible := True;
  AddEditEmployeeForm.btnUpdate.Visible := False;
  AddEditEmployeeForm.Edit1.Clear;
  AddEditEmployeeForm.MaskEdit1.Clear;
  AddEditEmployeeForm.cxLookupComboBox1.Text := '';
  AddEditEmployeeForm.cxLookupComboBox2.Text := '';
  AddEditEmployeeForm.Show;
end;

procedure TEmployeesForm.bntUpdateClick(Sender: TObject);
begin
  if cxGrid1DBTableView1.DataController.RecordCount = 0 then
    begin
      ShowMessage('Ничего не выбрано');
    end;
  if cxGrid1DBTableView1.DataController.RecordCount > 0 then
    begin
      if (not Assigned(AddEditEmployeeForm)) then
        begin
          AddEditEmployeeForm := TAddEditEmployeeForm.Create(Self);
        end;
      AddEditEmployeeForm.btnAdd.Visible := False;
      AddEditEmployeeForm.btnUpdate.Visible := True;
      AddEditEmployeeForm.Edit1.Text :=
          cxGrid1DBTableView1.DataController.DataSource.DataSet.FieldByName('full_name').AsString;
      AddEditEmployeeForm.MaskEdit1.Text :=
          cxGrid1DBTableView1.DataController.DataSource.DataSet.FieldByName('phone').AsString;
      AddEditEmployeeForm.DateTimePicker1.Date :=
          StrToDate(cxGrid1DBTableView1.DataController.DataSource.DataSet.FieldByName('birthday').AsString);
      AddEditEmployeeForm.cxLookupComboBox1.EditValue :=
          cxGrid1DBTableView1.DataController.DataSource.DataSet.FieldByName('id_dept').AsInteger;
      AddEditEmployeeForm.cxLookupComboBox2.EditValue :=
          cxGrid1DBTableView1.DataController.DataSource.DataSet.FieldByName('id_pos').AsInteger;
      AddEditEmployeeForm.Show;
    end;
end;

procedure TEmployeesForm.btnDeleteClick(Sender: TObject);
var
  v_id, v_full_name: String;
  v_fired_flag: Integer;
begin
  if cxGrid1DBTableView1.DataController.RecordCount <= 0 then
    begin
      ShowMessage('Ничего не выбрано');
    end
  else
    begin
    v_fired_flag := cxGrid1DBTableView1.DataController.DataSource.DataSet.FieldByName('id_flag_fired').AsInteger;
  end;
  if v_fired_flag = 0  Then
    begin
      ShowMessage('Сотрудник уже отмечен на удаление');
    end;
  if (cxGrid1DBTableView1.DataController.RecordCount > 0)  and (v_fired_flag = 1)
      and (MessageDlg('Вы точно хотите отметить сотрудника на увольнение?',mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      v_id := cxGrid1DBTableView1.DataController.DataSource.DataSet.FieldByName('id').AsString;
      v_full_name :=  cxGrid1DBTableView1.DataController.DataSource.DataSet.FieldByName('full_name').AsString;
      with DM_main.QryEmpty do
        begin
          SQL.Clear;
          SQL.Add('UPDATE employees ');
          SQL.Add('SET flag_fired = 0 ');
          SQL.Add(' WHERE id = ' + v_id + ' ');
          try ExecSQL except
            on E: EDatabaseError do
            ShowMessage (E.Message);
          end;
        end;
      DM_main.qryEmp.Refresh;
    end;
end;

end.
