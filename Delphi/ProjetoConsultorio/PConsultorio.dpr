program PConsultorio;

uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {frmPrincipal},
  UPadrao in 'UPadrao.pas' {frmPadrao},
  UCadastro in 'UCadastro.pas' {frmCadastro},
  UDMPrincipal in 'UDMPrincipal.pas' {dmPrincipal: TDataModule},
  UEstados in 'UEstados.pas' {frmEstados},
  UCidades in 'UCidades.pas' {frmCidades},
  UConvenios in 'UConvenios.pas' {frmConvenios},
  UEspecializacoes in 'UEspecializacoes.pas' {frmEspecializacoes},
  UPacientes in 'UPacientes.pas' {frmPacientes},
  UConveniosPacientes in 'UConveniosPacientes.pas' {frmConveniosPacientes},
  UMedicos in 'UMedicos.pas' {frmMedicos},
  UEspecializacoesMedicas in 'UEspecializacoesMedicas.pas' {frmEspecializacoesMedicas},
  UConsultas in 'UConsultas.pas' {frmConsultas},
  URelMedicos in 'URelMedicos.pas' {frmRelMedicos},
  URelPacientes in 'URelPacientes.pas' {frmRelPacientes},
  URelConsultas in 'URelConsultas.pas' {frmPadrao1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmPadrao, frmPadrao);
  Application.CreateForm(TfrmCadastro, frmCadastro);
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.CreateForm(TfrmEstados, frmEstados);
  Application.CreateForm(TfrmCidades, frmCidades);
  Application.CreateForm(TfrmConvenios, frmConvenios);
  Application.CreateForm(TfrmEspecializacoes, frmEspecializacoes);
  Application.CreateForm(TfrmPacientes, frmPacientes);
  Application.CreateForm(TfrmConveniosPacientes, frmConveniosPacientes);
  Application.CreateForm(TfrmMedicos, frmMedicos);
  Application.CreateForm(TfrmEspecializacoesMedicas, frmEspecializacoesMedicas);
  Application.CreateForm(TfrmConsultas, frmConsultas);
  Application.CreateForm(TfrmRelMedicos, frmRelMedicos);
  Application.CreateForm(TfrmRelPacientes, frmRelPacientes);
  Application.CreateForm(TfrmPadrao1, frmPadrao1);
  Application.Run;
end.
