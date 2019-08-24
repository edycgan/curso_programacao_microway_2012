unit URelPacientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadrao, DB, StdCtrls, Buttons, DBCtrls, ComCtrls, ExtCtrls;

type
  TfrmRelPacientes = class(TfrmPadrao)
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    rgSelecao: TRadioGroup;
    gbPeriodo: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    gbIndividual: TGroupBox;
    DBLookupComboBox1: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure rgSelecaoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelPacientes: TfrmRelPacientes;

implementation

uses UDMPrincipal;

{$R *.dfm}

procedure TfrmRelPacientes.BitBtn1Click(Sender: TObject);
begin
  inherited;
  DMpRINCIPAL.sqlRelPacientes.Close;
  dmPrincipal.sqlRelPacientes.SQL.Clear;
  dmPrincipal.sqlRelPacientes.SQL.Add('SELECT PACIENTES.*, NOME_CONVENIO, DESCRICAO_CONVENIO');
  dmPrincipal.sqlRelPacientes.SQL.Add('FROM PACIENTES');
  dmPrincipal.sqlRelPacientes.SQL.Add('LEFT JOIN CONVENIOS_PACIENTES ON (PACIENTES.CODIGO_PACIENTES=');
  dmPrincipal.sqlRelPacientes.SQL.Add('CONVENIOS_PACIENTES.CODIGO_PACIENTE)');
  dmPrincipal.sqlRelPacientes.SQL.Add('LEFT JOIN CONVENIOS ON (CONVENIOS_PACIENTES.CODIGO_CONVENIO=');
  dmPrincipal.sqlRelPacientes.SQL.Add('CONVENIOS.CODIGO_CONVENIO');

  if rgSelecao.ItemIndex = 1 then
  begin
    dmPrincipal.sqlRelPacientes.SQL.Add('WHERE PACIENTES.CODIGO_PACIENTE=' +
    dmPrincipal.cdsPacientesCODIGO_PACIENTE.AsString)
  end;

  if rgSelecao.ItemIndex = 2 then
  begin
    dmPrincipal.sqlRelPacientes.SQL.Add('WHERE DT_CADASTRO_PACIENTE BETWEEN ' +
       CHR(39) + DateToStr(DateTimePicker1.Date) + CHR(39));
    dmPrincipal.sqlRelPacientes.SQL.Add('AND ' + CHR(39) + DateToStr(DateTimePicker1.Date) + CHR(39));
  END;

  dmPrincipal.sqlRelPacientes.SQL.Add('ORDER BY NOME_PACIENTE');
  dmPrincipal.sqlRelPacientes.Open;

  dmPrincipal.RvPrjConsultorio.ExecuteReport('rptPacientes');
end;

procedure TfrmRelPacientes.FormActivate(Sender: TObject);
begin
  inherited;
  rgSelecao.ItemIndex := 0;
  rgSelecaoClick(self);
  dmPrincipal.CarregarTodos(dmPrincipal.sqlMedicos, dmPrincipal.cdsMedicos,
      'PACIENTES','NOME_PACIENTE');
end;

procedure TfrmRelPacientes.rgSelecaoClick(Sender: TObject);
begin
  inherited;
  gbIndividual.Enabled := rgSelecao.ItemIndex = 1;
  gbPeriodo.Enabled := rgSelecao.ItemIndex= 2;
end;

end.
