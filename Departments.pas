unit Departments;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  StdCtrls, ExtCtrls;

type
  TDepartmentsForm = class(TForm)
    Panel4: TPanel;
    Label3: TLabel;
    btnSearchDept: TButton;
    Edit3: TEdit;
    btnResetDept: TButton;
    Panel2: TPanel;
    btnAdd: TButton;
    bntUpdate: TButton;
    btnDelete: TButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1id: TcxGridDBColumn;
    cxGrid1DBTableView1name: TcxGridDBColumn;
    cxGrid1DBTableView1phone: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    procedure FormCreate(Sender: TObject);
    procedure btnResetDeptClick(Sender: TObject);
    procedure btnSearchDeptClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure bntUpdateClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DepartmentsForm: TDepartmentsForm;

implementation

uses DM2, AddEditDept;

{$R *.dfm}

procedure TDepartmentsForm.FormCreate(Sender: TObject);
begin
  DM_main.qryDept.Active := False;
  DM_main.qryDept.MacroByName('name_filter').Active := False;
  DM_main.qryDept.ReadOnly := True;
  DM_main.qryDept.Active := True;
end;

procedure TDepartmentsForm.btnResetDeptClick(Sender: TObject);
begin
  Edit3.Clear;
  DM_main.qryDept.Active := False;
  DM_main.qryDept.MacroByName('name_filter').Active := False;
  DM_main.qryDept.Active := True;
end;

procedure TDepartmentsForm.btnSearchDeptClick(Sender: TObject);
begin
  DM_main.qryDept.Active := False;
  if Edit3.Text <> '' then
    begin
      DM_main.qryDept.MacroByName('name_filter').Active := True;
      DM_main.qryDept.Params.ParamByName('p_name').AsString := '%' + Edit3.Text + '%';
    end
  else
    begin
     DM_main.qryDept.MacroByName('name_filter').Active := False;
    end;
  DM_main.qryDept.Active := True;
end;

procedure TDepartmentsForm.btnAddClick(Sender: TObject);
begin
    if (not Assigned(AddEditDeptForm)) then
      AddEditDeptForm := TAddEditDeptForm.Create(Self);
    AddEditDeptForm.btnAdd.Visible := True;
    AddEditDeptForm.btnUpdate.Visible := False;
    AddEditDeptForm.Edit1.Clear;
    AddEditDeptForm.Edit2.Clear;
    AddEditDeptForm.Show;
end;

procedure TDepartmentsForm.bntUpdateClick(Sender: TObject);
begin
  if cxGrid1DBTableView1.DataController.RecordCount = 0 then
    begin
      ShowMessage('Ничего не выбрано');
    end;
  if cxGrid1DBTableView1.DataController.RecordCount > 0 then
    begin
      if (not Assigned(AddEditDeptForm)) then
        AddEditDeptForm := TAddEditDeptForm.Create(Self);
      AddEditDeptForm.btnAdd.Visible := False;
      AddEditDeptForm.btnUpdate.Visible := True;
      AddEditDeptForm.Edit1.Text :=
          cxGrid1DBTableView1.DataController.DataSource.DataSet.FieldByName('name').AsString;
      AddEditDeptForm.Edit2.Text :=
          cxGrid1DBTableView1.DataController.DataSource.DataSet.FieldByName('phone').AsString;
      AddEditDeptForm.Show;
    end;
end;

procedure TDepartmentsForm.btnDeleteClick(Sender: TObject);
var
  v_id: String;
begin
  if (cxGrid1DBTableView1.DataController.RecordCount <= 0) then
    ShowMessage('Ничего не выбрано');
  if (cxGrid1DBTableView1.DataController.RecordCount > 0)
      and (MessageDlg('Вы точно хотите удалить строку?',mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      v_id := cxGrid1DBTableView1.DataController.DataSource.DataSet.FieldByName('id').AsString;
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
      DM_main.qryDept.Refresh;
    end;
end;

end.
