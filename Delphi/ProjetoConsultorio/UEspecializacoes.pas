unit UEspecializacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastro, ImgList, DB, Grids, DBGrids, StdCtrls, Buttons, ComCtrls,
  ExtCtrls, DBCtrls, ToolWin, Mask;

type
  TfrmEspecializacoes = class(TfrmCadastro)
    lblDescricao: TLabel;
    dbmMemo: TDBMemo;
    lblNome: TLabel;
    dbeNome: TDBEdit;
    lblCodigo: TLabel;
    dbeCodigo: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure sbtPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEspecializacoes: TfrmEspecializacoes;

implementation

uses UDMPrincipal;

{$R *.dfm}

procedure TfrmEspecializacoes.btNovoClick(Sender: TObject);
begin
  inherited;
  dsGenerico.DataSet.FieldByName('CODIGO_ESPECIALIZACAO').AsInteger := 0;
  dbeNome.SetFocus;
end;

procedure TfrmEspecializacoes.btSalvarClick(Sender: TObject);
begin
  inherited;
  dbeNome.SetFocus;
end;

procedure TfrmEspecializacoes.FormActivate(Sender: TObject);
begin
  inherited;
  dmPrincipal.CarregarTodos(dmPrincipal.sqlEspecializacoes, dmPrincipal.cdsEspecializacoes,'ESPECIALIZACOES','NOME_ESPECIALIZACAO');
  edtConsulta.Clear;
end;

procedure TfrmEspecializacoes.sbtPesquisarClick(Sender: TObject);
var campo : string;
begin
  inherited;
  dmPrincipal.cdsEspecializacoes.Close;
  dmPrincipal.sqlEspecializacoes.SQL.Clear;
  dmPrincipal.sqlEspecializacoes.Params.Clear;
  dmPrincipal.sqlEspecializacoes.SQL.Add('SELECT * FROM ESPECIALIZACOES WHERE ');
  campo := UpperCase(cbxConsulta.Items[cbxConsulta.ItemIndex]);

  case cbxConsulta.ItemIndex of
    0: begin
      if TipoDado = 1
        then dmPrincipal.sqlEspecializacoes.SQL.Add(campo + ' = ' + UpperCase(edtConsulta.Text));
      if TipoDado = 2
        then dmPrincipal.sqlEspecializacoes.SQL.Add(campo + ' LIKE ' + CHR(39) +
                edtConsulta.Text + CHR(39));
      if TipoDado = 3
        then dmPrincipal.sqlEspecializacoes.SQL.Add(campo + ' = ' + CHR(39) +
                edtConsulta.Text + CHR(39));
    end;

    1: dmPrincipal.sqlEspecializacoes.SQL.Add(campo + ' LIKE ' + CHR(39) +
                UpperCase(edtConsulta.Text) + '%' + CHR(39));

    2: dmPrincipal.sqlEspecializacoes.SQL.Add(campo + ' LIKE ' + CHR(39) +
                '%' + UpperCase(edtConsulta.Text) + '%' + CHR(39));
  end;

  dmPrincipal.cdsEspecializacoes.Open;
  if dmPrincipal.cdsEspecializacoes.IsEmpty
     then MessageDlg('Nada selecionado para filtro.', mtInformation, [mbOK], 0);
end;

end.
