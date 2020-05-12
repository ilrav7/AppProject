unit frm102;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, DB;

type
  TForm102 = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    btnReset: TButton;
    edtFio: TEdit;
    cmbbxDept: TComboBox;
    cmbbxPost: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnSearch: TButton;
    rdgFired: TRadioGroup;
    procedure btnSearchClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form102: TForm102;

implementation

uses DM2;

{$R *.dfm}

procedure TForm102.btnSearchClick(Sender: TObject);
var
  fl_dept, fl_post: Integer;
begin
  fl_dept := 1;
  fl_post := 1;
  if (cmbbxDept.ItemIndex = -1) and (cmbbxDept.Text <> '') then
    begin
      ShowMessage('Отдел не найден');
      fl_dept := 0;
    end;
  if (cmbbxPost.ItemIndex = -1) and (cmbbxPost.Text <> '') then
    begin
      ShowMessage('Должность не найдена');
      fl_post := 0;
    end;

  if (fl_dept <> 0) and (fl_post <> 0) then
    begin
      DM_main.qryReportEmp.Active := False;
      if edtFIO.Text <> '' then
        begin
          DM_main.qryReportEmp.MacroByName('fio_filter').Active := True;
          DM_main.qryReportEmp.Params.ParamByName('p_fio').AsString := '%' + edtFIO.Text + '%';
        end
      else begin
        DM_main.qryReportEmp.MacroByName('fio_filter').Active := False;
      end;
      if (cmbbxDept.Text <> '') and (cmbbxDept.ItemIndex <> -1) then
        begin
          DM_main.qryReportEmp.MacroByName('dept_filter').Active := True;
          DM_main.qryReportEmp.Params.ParamByName('p_id_dept').AsInteger := Integer(cmbbxDept.Items.Objects[cmbbxDept.ItemIndex]);
        end
      else begin
        DM_main.qryReportEmp.MacroByName('dept_filter').Active := False;
      end;
      if (cmbbxPost.Text <> '') and (cmbbxPost.ItemIndex <> -1) then
       begin
         DM_main.qryReportEmp.MacroByName('post_filter').Active := True;
         DM_main.qryReportEmp.Params.ParamByName('p_id_post').AsInteger := Integer(cmbbxPost.Items.Objects[cmbbxPost.ItemIndex]);
       end
     else begin
         DM_main.qryReportEmp.MacroByName('post_filter').Active := False;
     end;
     if rdgFired.ItemIndex = 1 Then
        DM_main.qryReportEmp.MacroByName('fired_filter').Active := True
      else
        DM_main.qryReportEmp.MacroByName('fired_filter').Active := False;
     if rdgFired.ItemIndex = 0 Then
        DM_main.qryReportEmp.MacroByName('only_fired_filter').Active := True
      else
        DM_main.qryReportEmp.MacroByName('only_fired_filter').Active := False;
    DM_main.qryReportEmp.Active := True;
  end;
end;

procedure TForm102.btnResetClick(Sender: TObject);
begin
  DM_main.qryReportEmp.Active := False;
  DM_main.qryReportEmp.MacroByName('fired_filter').Active := False;
  DM_main.qryReportEmp.MacroByName('only_fired_filter').Active := False;
  DM_main.qryReportEmp.MacroByName('dept_filter').Active := False;
  DM_main.qryReportEmp.MacroByName('post_filter').Active := False;
  DM_main.qryReportEmp.MacroByName('fio_filter').Active := False;
  edtFio.Clear;
  cmbbxDept.Text := '';
  cmbbxPost.Text := '';
  rdgFired.ItemIndex := -1;
  DM_main.qryReportEmp.Active := True;
end;

procedure TForm102.FormCreate(Sender: TObject);
var
   i: Integer;
begin
  //**** begin Наполнение combobox1 и combobox 2  ****//
  cmbbxDept.Items.Clear;
  cmbbxPost.Items.Clear;
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
        cmbbxPost.Items.AddObject(DM_main.QryEmpty.Fields[1].AsString,
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
        cmbbxDept.Items.AddObject(DM_main.QryEmpty.Fields[1].AsString,
            Tobject(DM_main.QryEmpty.Fields[0].AsInteger));
        DM_main.QryEmpty.Next;
      end;
//**** end Наполнение combobox1 и combobox 2 ****//
   DM_main.qryReportEMP.Active := False;
   DM_main.qryReportEMP.Active := True;
end;

end.
