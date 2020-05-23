unit ReportEmployees;

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
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, StdCtrls, ExtCtrls,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox;

type
  TReportEmployeesForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnReset: TButton;
    edtFio: TEdit;
    btnSearch: TButton;
    rdgFired: TRadioGroup;
    Panel2: TPanel;
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
    cxGrid1DBTableView1salary: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxLookupComboBox1: TcxLookupComboBox;
    cxLookupComboBox2: TcxLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure cxLookupComboBox1Enter(Sender: TObject);
    procedure cxLookupComboBox2Enter(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReportEmployeesForm: TReportEmployeesForm;

implementation

uses DM2;
{$R *.dfm}

procedure TReportEmployeesForm.FormCreate(Sender: TObject);
begin
  DM_main.qryReportEMP.Active := False;
  DM_main.qryReportEMP.Active := True;
end;

procedure TReportEmployeesForm.btnResetClick(Sender: TObject);
begin
  DM_main.qryReportEmp.Active := False;
  DM_main.qryReportEmp.MacroByName('fired_filter').Active := False;
  DM_main.qryReportEmp.MacroByName('only_fired_filter').Active := False;
  DM_main.qryReportEmp.MacroByName('dept_filter').Active := False;
  DM_main.qryReportEmp.MacroByName('post_filter').Active := False;
  DM_main.qryReportEmp.MacroByName('fio_filter').Active := False;
  edtFio.Clear;
  cxLookupComboBox1.Text := '';
  cxLookupComboBox2.Text := '';
  rdgFired.ItemIndex := -1;
  DM_main.qryReportEmp.Active := True;
end;

procedure TReportEmployeesForm.cxLookupComboBox1Enter(Sender: TObject);
begin
  DM_main.qryDept.Active := False;
  DM_main.qryDept.MacroByName('name_filter').Active := False;
  DM_main.qryDept.Active := True;
end;

procedure TReportEmployeesForm.cxLookupComboBox2Enter(Sender: TObject);
begin
  DM_main.qryPost.Active := False;
  DM_main.qryPost.MacroByName('name_filter').Active := False;
  DM_main.qryPost.Active := True;
end;

procedure TReportEmployeesForm.btnSearchClick(Sender: TObject);
var
  id_dept, id_post: Integer;
begin
  DM_main.qryReportEmp.Active := False;
  if edtFIO.Text <> '' then
    begin
      DM_main.qryReportEmp.MacroByName('fio_filter').Active := True;
      DM_main.qryReportEmp.Params.ParamByName('p_fio').AsString := '%' + edtFIO.Text + '%';
    end
  else
    begin
      DM_main.qryReportEmp.MacroByName('fio_filter').Active := False;
    end;
  if (cxLookupComboBox1.Text <> '') then
        begin
          DM_main.qryReportEmp.MacroByName('dept_filter').Active := True;
          DM_main.qryReportEmp.Params.ParamByName('p_id_dept').AsInteger := cxLookupComboBox1.EditValue;
        end
  else
    begin
      DM_main.qryReportEmp.MacroByName('dept_filter').Active := False;
    end;
  if (cxLookupComboBox2.Text <> '') then
    begin
      DM_main.qryReportEmp.MacroByName('post_filter').Active := True;
      DM_main.qryReportEmp.Params.ParamByName('p_id_post').AsInteger := cxLookupComboBox2.EditValue;
    end
  else
    begin
      DM_main.qryReportEmp.MacroByName('post_filter').Active := False;
    end;
  if rdgFired.ItemIndex = 1 Then
    begin
      DM_main.qryReportEmp.MacroByName('fired_filter').Active := True
    end
  else
    begin
      DM_main.qryReportEmp.MacroByName('fired_filter').Active := False;
    end;
  if rdgFired.ItemIndex = 0 Then
    begin
      DM_main.qryReportEmp.MacroByName('only_fired_filter').Active := True
    end
  else
    begin
      DM_main.qryReportEmp.MacroByName('only_fired_filter').Active := False;
    end;
  DM_main.qryReportEmp.Active := True;
end;

end.
