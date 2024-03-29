unit UCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadrao, DB, ImgList, ToolWin, ComCtrls, ExtCtrls, DBCtrls, StdCtrls,
  Buttons, Grids, DBGrids;

type
  TfrmCadastro = class(TfrmPadrao)
    tbCadastro: TToolBar;
    imgCadastro: TImageList;
    dbnCadstro: TDBNavigator;
    ToolButton1: TToolButton;
    btSalvar: TToolButton;
    btAlterar: TToolButton;
    btCancelar: TToolButton;
    btExcluir: TToolButton;
    ToolButton7: TToolButton;
    btLivre: TToolButton;
    ToolButton9: TToolButton;
    btSair: TToolButton;
    gbxCadastro: TGroupBox;
    gbxConsulta: TGroupBox;
    edtConsulta: TEdit;
    cbxConsulta: TComboBox;
    cbxTipoConsulta: TComboBox;
    dbgConsulta: TDBGrid;
    sbtPesquisar: TSpeedButton;
    btNovo: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure sbtPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    procedure AtivarBotoes(AEdicao : Boolean);
  public
    { Public declarations }
    TipoDado :integer;  // 1 - numeric
                        // 2 - character
                        // 3 - data
  end;

var
  frmCadastro: TfrmCadastro;

implementation

{$R *.dfm}

procedure TfrmCadastro.AtivarBotoes(AEdicao: Boolean);
begin
  dbnCadstro.Enabled := not AEdicao;
  btNovo.Enabled := not AEdicao;
  btSalvar.Enabled := AEdicao;
  btAlterar.Enabled := not AEdicao;
  btCancelar.Enabled := AEdicao;
  btExcluir.Enabled := not AEdicao;
  btSair.Enabled := not AEdicao;
end;

procedure TfrmCadastro.btAlterarClick(Sender: TObject);
begin
  inherited;
  if dsGenerico.DataSet.IsEmpty then
    Exit;
  dsGenerico.DataSet.Edit;
  AtivarBotoes(True);
end;

procedure TfrmCadastro.btCancelarClick(Sender: TObject);
begin
  inherited;
  AtivarBotoes(False);
  dsGenerico.DataSet.Cancel;
end;

procedure TfrmCadastro.btExcluirClick(Sender: TObject);
begin
  inherited;
  if dsGenerico.DataSet.IsEmpty then
    Exit;
  if MessageDlg('Confirma exclus�o do ' + 'registro atual?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if dsGenerico.DataSet.IsEmpty then Exit;
    dsGenerico.DataSet.Edit;
    dsGenerico.DataSet.Delete;
    dsGenerico.DataSet.Close;
    dsGenerico.DataSet.Open;
  end;
end;

procedure TfrmCadastro.btNovoClick(Sender: TObject);
begin
  inherited;
  AtivarBotoes(True);
  if not dsGenerico.DataSet.Active then
    dsGenerico.DataSet.Open;
    dsGenerico.DataSet.Append;
end;

procedure TfrmCadastro.btSairClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCadastro.btSalvarClick(Sender: TObject);
begin
  inherited;
  AtivarBotoes(False);
  dsGenerico.DataSet.Post;
end;

procedure TfrmCadastro.FormShow(Sender: TObject);
begin
  inherited;
  cbxConsulta.Items.Clear;
  dsGenerico.DataSet.GetFieldNames(cbxConsulta.Items);
  cbxConsulta.ItemIndex := 0;
  AtivarBotoes(False);
end;

procedure TfrmCadastro.sbtPesquisarClick(Sender: TObject);
var i:integer;
    palavra:string;
    key:char;
begin
  inherited;
  TipoDado := 1; //numeric
  palavra := Trim(edtConsulta.Text);

  for i:= 1 to Length(palavra) do
  begin
    key := palavra[i];
    if not (key in ['0'..'9']) then
    begin
      if key = '/'
      then TipoDado := 3 //data
      else TipoDado := 2 // character
    end;
  end;
end;

end.
