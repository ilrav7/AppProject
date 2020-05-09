unit frm102;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm102 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form102: TForm102;

implementation

{$R *.dfm}

procedure TForm102.Button1Click(Sender: TObject);
begin
 label1.Caption := 'sssss';
end;

end.
