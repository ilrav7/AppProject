unit AddEditEmployee;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Mask, DB, DBCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox;

type
  TAddEditEmployeeForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    btnAdd: TButton;
    btnClose: TButton;
    Label6: TLabel;
    btnUpdate: TButton;
    MaskEdit1: TMaskEdit;
    DateTimePicker1: TDateTimePicker;
    cxLookupComboBox1: TcxLookupComboBox;
    cxLookupComboBox2: TcxLookupComboBox;
    procedure btnCloseClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddEditEmployeeForm: TAddEditEmployeeForm;

implementation

uses DM2, Employees;

{$R *.dfm}

procedure TAddEditEmployeeForm.btnCloseClick(Sender: TObject);
begin
  DM_main.QryEmpty.Active := False;
  AddEditEmployeeForm.Close;
end;

procedure TAddEditEmployeeForm.btnAddClick(Sender: TObject);
var
  id_dept, id_post: Integer;
begin
  if (cxLookupComboBox1.Text = '') then
    begin
      Application.MessageBox('Выберите отдел из списка', 'Ошибка');
    end;
  if (cxLookupComboBox2.Text = '') then
    begin
      Application.MessageBox('Выберите должность из списка', 'Ошибка');
    end;
  if (Edit1.Text = '') then
    begin
      Application.MessageBox('Все поля должны быть заполнены', 'Ошибка');
    end;
  if (Edit1.Text <> '') and (cxLookupComboBox1.Text <> '') and (cxLookupComboBox2.Text <> '') then
    begin
      id_dept := cxLookupComboBox1.EditValue;
      id_post := cxLookupComboBox2.EditValue;
      with DM_main.QryEmpty do
        begin
          SQL.Clear;
          SQL.Add('INSERT INTO employees(full_name, phone,  ');
          SQL.Add('      birthday, id_dept, id_pos, flag_fired )  ');
          SQL.Add(' VALUES ( ''' + Edit1.Text + ''' , ');
          SQL.Add(' ''' + MaskEdit1.Text + ''' , ');
          SQL.Add(' STR_TO_DATE( ''' + DateToStr(DateTimePicker1.Date) + ''' , ''%d.%m.%Y'') , ');
          SQL.Add(' ' + IntToStr(id_dept) + ' , ');
          SQL.Add(' ' + IntToStr(id_post) + ' , 1 )');
          try ExecSQL except
            on E: EDatabaseError do
            ShowMessage (E.Message);
          end;
        end;
      DM_main.qryEmp.Refresh;
      AddEditEmployeeForm.Close;
    end;
end;

procedure TAddEditEmployeeForm.btnUpdateClick(Sender: TObject);
var
  id_dept, id_post: Integer;
  v_id: String;
begin
  if (Edit1.Text = '') or (cxLookupComboBox1.Text = '') or (cxLookupComboBox1.Text = '') then
    begin
      Application.MessageBox('Все поля должны быть заполнены', 'Ошибка');
    end;
  if (Edit1.Text <> '') and (cxLookupComboBox1.Text <> '') and (cxLookupComboBox1.Text <> '') then
    begin
      v_id := EmployeesForm.cxGrid1DBTableView1.DataController.DataSource.DataSet.FieldByName('id').AsString;
      id_dept := cxLookupComboBox1.EditValue;
      id_post := cxLookupComboBox2.EditValue;
      with DM_main.QryEmpty do
        begin
          SQL.Clear;
          SQL.Add('UPDATE employees ');
          SQL.Add(' SET full_name = ''' + Edit1.Text + ''',');
          SQL.Add('     phone = ''' + MaskEdit1.Text + ''', ');
          SQL.Add('     birthday = STR_TO_DATE(''' + DateToStr(DateTimePicker1.Date) + ''' , ''%d.%m.%Y'') ,');
          SQL.Add('     id_dept = ' + IntToStr(id_dept)  + ',');
          SQL.Add('     id_pos = ' + IntToStr(id_post) + '  ');
          SQL.Add(' Where id = ' + v_id + ' ');
          try ExecSQL except
            on E: EDatabaseError do
            ShowMessage (E.Message);
          end;
        end;
      DM_main.qryEmp.Refresh;
      AddEditEmployeeForm.Close;
    end;    
end;

procedure TAddEditEmployeeForm.FormShow(Sender: TObject);
begin
  DM_main.qryPost.Active := False;
  DM_main.qryPost.MacroByName('name_filter').Active := False;
  DM_main.qryPost.Active := True;
  DM_main.qryDept.Active := False;
  DM_main.qryDept.MacroByName('name_filter').Active := False;
  DM_main.qryDept.Active := True;
end;

end.
