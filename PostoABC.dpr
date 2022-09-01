program PostoABC;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {frmPrincipal},
  uDatabase in 'framework\database\uDatabase.pas',
  uDatabase.Firebird in 'framework\database\firebird\uDatabase.Firebird.pas',
  uDatabase.SQLite in 'framework\database\sqlite\uDatabase.SQLite.pas',
  uArqINI in 'uArqINI.pas',
  uTipos in 'helper\uTipos.pas',
  uHelper in 'helper\uHelper.pas',
  DTO.Tanque in 'dto\DTO.Tanque.pas',
  uDatabase.DbContext in 'framework\dbcontext\uDatabase.DbContext.pas',
  uIDbContext in 'interfaces\dbcontext\uIDbContext.pas',
  uIDatabase in 'interfaces\database\uIDatabase.pas',
  uIConnection in 'interfaces\database\connection\uIConnection.pas',
  uDatabase.Connection in 'framework\database\connection\uDatabase.Connection.pas',
  uContext.Tanques in 'context\uContext.Tanques.pas',
  uDbContext in 'context\uDbContext.pas',
  uRTTI.Mapping.Attributes in 'framework\dbcontext\rtti\mapping\uRTTI.Mapping.Attributes.pas',
  uDbTipos in 'framework\database\uDbTipos.pas',
  uHelper.Funcoes in 'helper\uHelper.Funcoes.pas',
  uHelper.RTTI in 'helper\uHelper.RTTI.pas',
  uContext.Bombas in 'context\uContext.Bombas.pas',
  DTO.Bomba in 'dto\DTO.Bomba.pas',
  uFormPadrao in 'inherited\uFormPadrao.pas' {FormPadrao},
  CadastroListagemPadrao in 'inherited\CadastroListagemPadrao.pas' {frmCadastroListagemPadrao},
  uFrmPadao in 'inherited\uFrmPadao.pas' {frmPadrao},
  CadastroDetalhePadrao in 'inherited\CadastroDetalhePadrao.pas' {frmCadastroDetalhePadrao},
  uFrmCadastroTanquesDetalhes in 'uFrmCadastroTanquesDetalhes.pas' {frmCadastroTanquesDetalhe},
  uFrmCadastroBombasDetalhes in 'uFrmCadastroBombasDetalhes.pas' {frmCadastroBombasDetalhe},
  DTO.Combustivel in 'dto\DTO.Combustivel.pas',
  uContext.Combustiveis in 'context\uContext.Combustiveis.pas',
  uFrmCadastroCombustiveisDetalhes in 'uFrmCadastroCombustiveisDetalhes.pas' {frmCadastroCombustiveisDetalhes},
  DTO.Movenda in 'dto\DTO.Movenda.pas',
  DTO.Movenda_Item in 'dto\DTO.Movenda_Item.pas',
  uContext.Movenda in 'context\uContext.Movenda.pas',
  uContext.Movenda_Item in 'context\uContext.Movenda_Item.pas',
  CadastroPadrao in 'inherited\CadastroPadrao.pas' {frmCadastroPadrao},
  uFrmCadastroBombas in 'uFrmCadastroBombas.pas' {frmCadastroBombas},
  uFrmCadastroTanques in 'uFrmCadastroTanques.pas' {frmCadastroTanques},
  uFrmCadastroCombustiveis in 'uFrmCadastroCombustiveis.pas' {frmCadastroCombustiveis},
  uDMConexao in 'framework\conexao\uDMConexao.pas' {DMConexao: TDataModule},
  uFrmCadastroListagemMovimentacao in 'uFrmCadastroListagemMovimentacao.pas' {frmCadastroListagemMovimentacao},
  uCadastroMovimentoAbastecimento in 'uCadastroMovimentoAbastecimento.pas' {frmCadastroMovimentoCombustivelDetalhe},
  uFrmRelMovimentacao in 'uFrmRelMovimentacao.pas' {Form1};

{$R *.res}
{$WARN UNKNOWN_CUSTOM_ATTRIBUTE OFF}


begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'PostoABC';

  DMConexao := TDMConexao.Create(nil);

  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TForm1, Form1);
  Application.Run;

end.
