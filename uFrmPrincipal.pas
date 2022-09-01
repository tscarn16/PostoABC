unit uFrmPrincipal;

interface

uses Generics.Collections,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uFormPadrao, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls,

  uDbContext, System.Rtti, TypInfo,

  uHelper,

  DTO.Tanque, Data.DB, Datasnap.DBClient, uFrmPadao;

type
  TfrmPrincipal = class(TFormPadrao)
    MainMenu1: TMainMenu;
    Cadastrs1: TMenuItem;
    Relatrios1: TMenuItem;
    Bombas1: TMenuItem;
    Bombas2: TMenuItem;
    Movimentao1: TMenuItem;
    Abastecimento1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    Combustveis1: TMenuItem;
    ListagemdeAbastecimentos1: TMenuItem;
    procedure Bombas1Click(Sender: TObject);
    procedure Bombas2Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Combustveis1Click(Sender: TObject);
    procedure Abastecimento1Click(Sender: TObject);
    procedure ListagemdeAbastecimentos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses uFrmCadastroTanques, uFrmCadastroBombas, uFrmCadastroCombustiveis,
  uFrmCadastroListagemMovimentacao,
  uFrmRelMovimentacao,
  uDMConexao;

{$R *.dfm}

procedure TfrmPrincipal.Abastecimento1Click(Sender: TObject);
begin
  inherited;
  Helper.Funcoes.CreateAndShowModal(TfrmCadastroListagemMovimentacao, frmCadastroListagemMovimentacao);

end;

procedure TfrmPrincipal.Bombas1Click(Sender: TObject);
begin
  inherited;
  Helper.Funcoes.CreateAndShowModal(TfrmCadastroTanques, frmCadastroTanques);

end;

procedure TfrmPrincipal.Bombas2Click(Sender: TObject);
begin
  inherited;
  Helper.Funcoes.CreateAndShowModal(TfrmCadastroBombas, frmCadastroBombas);

end;

procedure TfrmPrincipal.Combustveis1Click(Sender: TObject);
begin
  inherited;
  Helper.Funcoes.CreateAndShowModal(TfrmCadastroCombustiveis, frmCadastroCombustiveis);

end;

procedure TfrmPrincipal.ListagemdeAbastecimentos1Click(Sender: TObject);
var
  Rel: TForm1;
  StrSQL: String;
begin
  Rel := TForm1.Create(Self);

  StrSQL :=
    'SELECT MOV.ID,  MOV.DATA, '+
    '       MVI.VALOR, MVI.QTD, MVI.VR_IMPOSTO, (MVI.VALOR * MVI.QTD) AS VALOR_TOTAL, '+
    '       B.CODIGO COD_BOMBA, B.DESCRICAO DESC_BOMBA, '+
    '       T.CODIGO COD_TANQUE, T.DESCRICAO DESC_TANQUE '+
    '  FROM MOVENDA MOV '+
    ' INNER JOIN MOVENDA_ITEM MVI '+
    '    ON (MVI.ID_MOVENDA = MOV.ID) '+
    ' INNER JOIN BOMBAS B '+
    '    ON (B.ID = MVI.ID_BOMBA) '+
    ' INNER JOIN TANQUES T '+
    '    ON (T.ID = B.ID_TANQUE) ';
  Helper.Funcoes.FillCds(Rel.ClientDataSet1, StrSQL, DMConexao.Conexao);


  Rel.RLReport1.Preview();

end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  inherited;
  Application.Terminate;

end;

end.
