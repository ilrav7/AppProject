unit Positions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
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
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, DB,
  cxDBData, cxClasses, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxGridCustomView, cxGrid;

type
  TPositionsForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    btnSearchPost: TButton;
    Edit1: TEdit;
    btnResetPost: TButton;
    Panel2: TPanel;
    btnAdd: TButton;
    bntUpdate: TButton;
    btnDelete: TButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1id: TcxGridDBColumn;
    cxGrid1DBTableView1name: TcxGridDBColumn;
    cxGrid1DBTableView1salary: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    procedure FormCreate(Sender: TObject);
    procedure btnResetPostClick(Sender: TObject);
    procedure btnSearchPostClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure bntUpdateClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PositionsForm: TPositionsForm;

implementation

uses DM2, AddEditPost;

{$R *.dfm}

procedure TPositionsForm.FormCreate(Sender: TObject);
begin
  DM_main.qryPost.Active := False;
  DM_main.qryPost.MacroByName('name_filter').Active := False;
  DM_main.qryPost.ReadOnly := True;
  DM_main.qryPost.Active := True;
end;

procedure TPositionsForm.btnResetPostClick(Sender: TObject);
begin
  Edit1.Clear;
  DM_main.qryPost.Active := False;
  DM_main.qryPost.MacroByName('name_filter').Active := False;
  DM_main.qryPost.Active := True;
end;

procedure TPositionsForm.btnSearchPostClick(Sender: TObject);
begin
  DM_main.qryPost.Active := False;
  if Edit1.Text <> '' then
    begin
      DM_main.qryPost.MacroByName('name_filter').Active := True;
      DM_main.qryPost.Params.ParamByName('p_name').AsString := '%' + Edit1.Text + '%';
    end
  else
    begin
     DM_main.qryPost.MacroByName('name_filter').Active := False;
    end;
  DM_main.qryPost.Active := True;
end;

procedure TPositionsForm.btnAddClick(Sender: TObject);
begin
  if (not Assigned(AddEditPostForm)) then
    begin
      AddEditPostForm := TAddEditPostForm.Create(Self);
    end;
  AddEditPostForm.btnAdd.Visible := True;
  AddEditPostForm.btnUpdate.Visible := False;
  AddEditPostForm.Edit1.Clear;
  AddEditPostForm.Edit2.Clear;
  AddEditPostForm.Show;
end;

procedure TPositionsForm.bntUpdateClick(Sender: TObject);
begin
  if cxGrid1DBTableView1.DataController.RecordCount = 0 then
    ShowMessage('Ничего не выбрано');
  if cxGrid1DBTableView1.DataController.RecordCount > 0 then
    begin
      if (not Assigned(AddEditPostForm)) then
        begin
          AddEditPostForm := TAddEditPostForm.Create(Self);
        end;
      AddEditPostForm.btnAdd.Visible := False;
      AddEditPostForm.btnUpdate.Visible := True;
      AddEditPostForm.Edit1.Text :=
          cxGrid1DBTableView1.DataController.DataSource.DataSet.FieldByName('name').AsString;
      AddEditPostForm.Edit2.Text :=
          cxGrid1DBTableView1.DataController.DataSource.DataSet.FieldByName('salary').AsString;
      AddEditPostForm.Edit2.Text  := StringReplace(AddEditPostForm.Edit2.Text, ',', '.', [rfReplaceAll, rfIgnoreCase]);
      AddEditPostForm.Show;
    end;
end;

procedure TPositionsForm.btnDeleteClick(Sender: TObject);
var
  v_id: String;
begin
  if cxGrid1DBTableView1.DataController.RecordCount <= 0 then
    begin
      ShowMessage('Ничего не выбрано');
    end;
  if (cxGrid1DBTableView1.DataController.RecordCount > 0)
      and (MessageDlg('Вы точно хотите удалить строку?',mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      v_id := cxGrid1DBTableView1.DataController.DataSource.DataSet.FieldByName('id').AsString;
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
      DM_main.qryPost.Refresh;
    end;
end;

end.
