unit UConsultas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastro, ImgList, DB, Grids, DBGrids, StdCtrls, Buttons, ComCtrls,
  ExtCtrls, DBCtrls, ToolWin, Mask, FMTBcd, DBClient, Provider, SqlExpr;

type
  TfrmConsultas = class(TfrmCadastro)
    lblCodigo: TLabel;
    dbeCodigo: TDBEdit;
    lblNome: TLabel;
    lblEstado: TLabel;
    dbeData: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    dblPaciente: TDBLookupComboBox;
    dblMedico: TDBLookupComboBox;
    dblConvenio: TDBLookupComboBox;
    dsPaciente: TDataSource;
    dsMedico: TDataSource;
    dsConvenio: TDataSource;
    sqlPacienteConvenio: TSQLQuery;
    dspPacienteConvenio: TDataSetProvider;
    cdsPacienteConvenio: TClientDataSet;
    cdsPacienteConvenioCODIGO_CONVENIO: TFMTBCDField;
    cdsPacienteConvenioCODIGO_PACIENTE: TFMTBCDField;
    procedure dblPacienteCloseUp(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dsGenericoDataChange(Sender: TObject; Field: TField);
    procedure btNovoClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure sbtPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultas: TfrmConsultas;

implementation

uses UDMPrincipal;

{$R *.dfm}

procedure TfrmConsultas.btNovoClick(Sender: TObject);
begin
  inherited;
  dsGenerico.DataSet.FieldByName('CODIGO_CONSULTA').AsInteger := 0;
  dblPaciente.SetFocus;
end;

procedure TfrmConsultas.btSalvarClick(Sender: TObject);
begin
  inherited;
  dbeCodigo.SetFocus;
end;

procedure TfrmConsultas.dblPacienteCloseUp(Sender: TObject);
begin
  inherited;
  dmPrincipal.sqlConveniosPacientes.Close;
  dmPrincipal.sqlConveniosPacientes.Params[0].AsInteger := dmPrincipal.cdsPacientesCODIGO_PACIENTE.AsInteger;
  dmPrincipal.sqlConveniosPacientes.Open;
  dmPrincipal.sqlConveniosPacientes.Close;
  dmPrincipal.sqlConveniosPacientes.Open;
end;

procedure TfrmConsultas.dsGenericoDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  dmPrincipal.sqlConveniosPacientes.Close;
  dmPrincipal.sqlConveniosPacientes.Params[0].AsInteger := dmPrincipal.cdsConsultasCODIGO_PACIENTE.AsInteger;
  dmPrincipal.sqlConveniosPacientes.Open;
  dmPrincipal.sqlConveniosPacientes.Close;
  dmPrincipal.sqlConveniosPacientes.Open;
end;

procedure TfrmConsultas.FormActivate(Sender: TObject);
begin
  inherited;
  dmPrincipal.CarregarTodos(dmPrincipal.sqlConsultas,
        dmPrincipal.cdsConsultas, 'CONSULTAS', 'CODIGO_CONSULTA');
  dmPrincipal.CarregarTodos(dmPrincipal.sqlPacientes,
        dmPrincipal.cdsPacientes, 'PACIENTES', 'NOME_PACIENTE');
  dmPrincipal.CarregarTodos(dmPrincipal.sqlMedicos,
        dmPrincipal.cdsMedicos, 'MEDICOS', 'NOME_MEDICO');

  dmPrincipal.sqlConveniosPacientes.Close;
  dmPrincipal.sqlConveniosPacientes.Params[0].AsInteger := dmPrincipal.cdsConsultasCODIGO_PACIENTE.AsInteger;
  dmPrincipal.sqlConveniosPacientes.Open;
  dmPrincipal.sqlConveniosPacientes.Close;
  dmPrincipal.sqlConveniosPacientes.Open;
end;

procedure TfrmConsultas.sbtPesquisarClick(Sender: TObject);
var campo : string;
begin
  inherited;
  dmPrincipal.cdsConsultas.Close;
  dmPrincipal.sqlConsultas.SQL.Clear;
  dmPrincipal.sqlConsultas.Params.Clear;
  dmPrincipal.sqlConsultas.SQL.Add('SELECT * FROM CONSULTAS WHERE ');

  campo := UpperCase(cbxConsulta.Items[cbxConsulta.ItemIndex]);

  case cbxTipoConsulta.ItemIndex of
    0: begin
      if TipoDado = 1
        then dmPrincipal.sqlConsultas.SQL.Add(campo + ' = ' + UpperCase(edtConsulta.Text));
      if TipoDado = 2
        then dmPrincipal.sqlConsultas.SQL.Add(campo + ' LIKE ' + chr(39) + UpperCase(edtConsulta.Text) + CHR(39));
      if TipoDado = 3
        then dmPrincipal.sqlConsultas.SQL.Add(campo + ' = ' + CHR(39) + UpperCase(edtConsulta.Text) + CHR(39));
    end;

    1: dmPrincipal.sqlConsultas.SQL.Add(campo + ' LIKE ' + CHR(39) + UpperCase(edtConsulta.Text) + '%' + CHR(39));
    2: dmPrincipal.sqlConsultas.SQL.Add(campo + ' LIKE ' + CHR(39) + '%' + UpperCase(edtConsulta.Text) + '%' + CHR(39));
  end;

  dmPrincipal.cdsConsultas.Open;
  if dmPrincipal.cdsConsultas.IsEmpty
    then MessageDlg('Nada selecionado para filtro.',mtInformation, [mbOK], 0);
end;

end.
