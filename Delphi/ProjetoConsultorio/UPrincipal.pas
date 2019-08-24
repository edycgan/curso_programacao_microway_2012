unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, ExtCtrls, ToolWin, ComCtrls, pngimage;

type
  TfrmPrincipal = class(TForm)
    mnuPrincipal: TMainMenu;
    tbPrincipal: TToolBar;
    imgFundo: TImage;
    imgPrincipal: TImageList;
    C1: TMenuItem;
    Pacientes1: TMenuItem;
    Mdicos1: TMenuItem;
    Convnios1: TMenuItem;
    Especializaes1: TMenuItem;
    Cidades1: TMenuItem;
    Estados1: TMenuItem;
    Movimentaes1: TMenuItem;
    Consultas1: TMenuItem;
    tbtPacientes: TToolButton;
    tbtMedicos: TToolButton;
    tbSeparator1: TToolButton;
    tbtConvenios: TToolButton;
    tbtEspecializacoes: TToolButton;
    tbSeparator2: TToolButton;
    tbtConsultas: TToolButton;
    tbtSair: TToolButton;
    Re1: TMenuItem;
    Consultas2: TMenuItem;
    N1: TMenuItem;
    Pacientes2: TMenuItem;
    Mdicos2: TMenuItem;
    Gerais1: TMenuItem;
    Convnios2: TMenuItem;
    Especialiaes1: TMenuItem;
    Cidades2: TMenuItem;
    Estados2: TMenuItem;
    procedure Estados1Click(Sender: TObject);
    procedure tbtSairClick(Sender: TObject);
    procedure Cidades1Click(Sender: TObject);
    procedure Convnios1Click(Sender: TObject);
    procedure tbtConveniosClick(Sender: TObject);
    procedure tbtEspecializacoesClick(Sender: TObject);
    procedure Especializaes1Click(Sender: TObject);
    procedure tbtPacientesClick(Sender: TObject);
    procedure Pacientes1Click(Sender: TObject);
    procedure tbtMedicosClick(Sender: TObject);
    procedure Mdicos1Click(Sender: TObject);
    procedure tbtConsultasClick(Sender: TObject);
    procedure Consultas1Click(Sender: TObject);
    procedure Estados2Click(Sender: TObject);
    procedure Convnios2Click(Sender: TObject);
    procedure Especialiaes1Click(Sender: TObject);
    procedure Cidades2Click(Sender: TObject);
    procedure Mdicos2Click(Sender: TObject);
    procedure Pacientes2Click(Sender: TObject);
    procedure Consultas2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses UEstados, UCidades, UConvenios, UEspecializacoes, UPacientes, UMedicos,
  UEspecializacoesMedicas, UConsultas, UDMPrincipal, URelMedicos, UPadrao,
  URelPacientes, URelConsultas;

{$R *.dfm}

procedure TfrmPrincipal.Cidades1Click(Sender: TObject);
begin
  frmCidades.ShowModal;
end;

procedure TfrmPrincipal.Cidades2Click(Sender: TObject);
begin
  dmPrincipal.sqlRelCidades.Close;
  dmPrincipal.sqlRelCidades.Open;
  dmPrincipal.RvPrjConsultorio.ExecuteReport('rptCidades');
end;

procedure TfrmPrincipal.Consultas1Click(Sender: TObject);
begin
  frmConsultas.ShowModal;
end;

procedure TfrmPrincipal.Consultas2Click(Sender: TObject);
begin
  frmConsultas.ShowModal;
end;

procedure TfrmPrincipal.Convnios1Click(Sender: TObject);
begin
  frmConvenios.ShowModal;
end;

procedure TfrmPrincipal.Convnios2Click(Sender: TObject);
begin
  dmPrincipal.CarregarTodos(dmPrincipal.sqlConvenios,
        dmPrincipal.cdsConvenios, 'CONVENIOS', 'NOME_CONVENIO');
  dmPrincipal.RvPrjConsultorio.ExecuteReport('rptConvenios');
end;

procedure TfrmPrincipal.Especialiaes1Click(Sender: TObject);
begin
  dmPrincipal.CarregarTodos(dmPrincipal.sqlEstados,
        dmPrincipal.cdsEstados, 'ESPECIALIZACAO', 'NOME_ESPECIALIZACAO');
  dmPrincipal.RvPrjConsultorio.ExecuteReport('rptEspecializacoes');
end;

procedure TfrmPrincipal.Especializaes1Click(Sender: TObject);
begin
  frmEspecializacoes.ShowModal;
end;

procedure TfrmPrincipal.Estados1Click(Sender: TObject);
begin
  frmEstados.ShowModal;
end;

procedure TfrmPrincipal.Estados2Click(Sender: TObject);
begin
  dmPrincipal.CarregarTodos(dmPrincipal.sqlEstados,
        dmPrincipal.cdsEstados, 'ESTADOS', 'NOME_ESTADO');
  dmPrincipal.RvPrjConsultorio.ExecuteReport('rptEstados');
end;

procedure TfrmPrincipal.Mdicos1Click(Sender: TObject);
begin
  frmMedicos.ShowModal;
end;

procedure TfrmPrincipal.Mdicos2Click(Sender: TObject);
begin
  frmMedicos.ShowModal;
end;

procedure TfrmPrincipal.Pacientes1Click(Sender: TObject);
begin
  frmPacientes.ShowModal;
end;

procedure TfrmPrincipal.Pacientes2Click(Sender: TObject);
begin
  frmPacientes.ShowModal;
end;

procedure TfrmPrincipal.tbtConsultasClick(Sender: TObject);
begin
  frmConsultas.ShowModal;
end;

procedure TfrmPrincipal.tbtConveniosClick(Sender: TObject);
begin
  frmConvenios.ShowModal;
end;

procedure TfrmPrincipal.tbtEspecializacoesClick(Sender: TObject);
begin
  frmEspecializacoes.ShowModal;
end;

procedure TfrmPrincipal.tbtMedicosClick(Sender: TObject);
begin
  frmMedicos.ShowModal;
end;

procedure TfrmPrincipal.tbtPacientesClick(Sender: TObject);
begin
  frmPacientes.ShowModal;
end;

procedure TfrmPrincipal.tbtSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.
