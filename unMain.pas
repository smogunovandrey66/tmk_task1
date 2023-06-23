unit unMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.Oracle, FireDAC.Phys.OracleDef, FireDAC.VCLUI.Wait,
  Data.FMTBcd, Data.SqlExpr, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFormMain = class(TForm)
    conMain: TADOConnection;
    pnlFilter: TPanel;
    lblNameFirm: TLabel;
    lblNameJurCity: TLabel;
    lblNamePostCity: TLabel;
    edtNameFirm: TEdit;
    edtNameJurCity: TEdit;
    edtNamePostCity: TEdit;
    btnSearch: TBitBtn;
    btnClear: TBitBtn;
    dbgrdData: TDBGrid;
    dsData: TDataSource;
    qryData: TADOQuery;
    procedure btnSearchClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

procedure TFormMain.btnClearClick(Sender: TObject);
begin
  edtNameFirm.Clear;
  edtNameJurCity.Clear;
  edtNamePostCity.Clear;
  btnSearchClick(Self);
end;

procedure TFormMain.btnSearchClick(Sender: TObject);
var
  namePostCity: String;
begin
  qryData.Close;

  qryData.SQL.Clear;

  namePostCity := Trim(edtNamePostCity.Text);

  //Динамически формируем запрос

  with qryData.SQL do begin
    Add('select f.name as NameFirm, cj.name as JurCity, cp.name as PostCity');
    Add('from firm f');
    Add('inner join city cj on f.jur_city_id = cj.city_id');
	  Add('left join city cp on f.post_city_id = cp.city_id');
    Add('where upper(f.name) like upper(:firmName) and ');
    if(Length(namePostCity) > 0) then
      Add('upper(cp.name) like upper(:cityPostName) and');
    Add('upper(cj.name) like upper(:cityJurName)');
    Add('order by f.firm_id');
  end;

  qryData.Parameters.ParamByName('firmName').Value := '%' + Trim(edtNameFirm.Text) + '%';

  if(Length(namePostCity) > 0) then
    qryData.Parameters.ParamByName('cityPostName').Value := '%' + Trim(edtNamePostCity.Text) + '%';

  qryData.Parameters.ParamByName('cityJurName').Value := '%' + Trim(edtNameJurCity.Text) + '%';

  qryData.Open;
end;

procedure TFormMain.FormShow(Sender: TObject);
begin
  btnSearchClick(Self);
end;

end.
