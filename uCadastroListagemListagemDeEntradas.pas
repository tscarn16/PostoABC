unit uCadastroListagemListagemDeEntradas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CadastroListagemPadrao, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, uBuscaChaveERP,
  cxDataControllerConditionalFormattingRulesManagerDialog, Data.DB, cxDBData,
  System.ImageList, Vcl.ImgList, cxImageList, Datasnap.DBClient, System.Actions,
  Vcl.ActnList, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.StdCtrls, cxButtons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxGroupBox, Vcl.ExtCtrls,
  cxLabel, uCadMovimentacaoEntrada, dxSkinsCore, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010;

type
  TfrmCadastroListagemListagemDeEntradas = class(TfrmCadastroListagemPadrao)
    TVGridListagemNumNota: TcxGridDBColumn;
    TVGridListagemSerieNota: TcxGridDBColumn;
    TVGridListagemNumTransferencia: TcxGridDBColumn;
    TVGridListagemDataEntrada: TcxGridDBColumn;
    cxLabel7: TcxLabel;
    edtCodigoEmpresa: TcxTextEdit;
    btnLocEmpresa: TcxButton;
    edtNomeEmpresa: TcxTextEdit;
    cxLabel8: TcxLabel;
    edtCodigoEstabelecimento: TcxTextEdit;
    btnLocEstabelecimento: TcxButton;
    edtNomeEstabelecimento: TcxTextEdit;
    cxLabel1: TcxLabel;
    edtCodigoSetorEstoque: TcxTextEdit;
    btnLocSetorEstoque: TcxButton;
    edtNomeSetorEstoque: TcxTextEdit;
    cxLabel2: TcxLabel;
    edtCodigoFornecedor: TcxTextEdit;
    btnLocFornecedor: TcxButton;
    edtNomeFornecedor: TcxTextEdit;
    TVGridListagemDataEmissao: TcxGridDBColumn;
    TVGridListagemAcrescimos: TcxGridDBColumn;
    TVGridListagemDescontos: TcxGridDBColumn;
    TVGridListagemValorTotalNota: TcxGridDBColumn;
    TVGridListagemOperacaoDescricao: TcxGridDBColumn;
    TVGridListagemModeloNFDescricao: TcxGridDBColumn;
    TVGridListagemSetorEstoqueDescricao: TcxGridDBColumn;
    TVGridListagemFornecedorDescricao: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure InicializaComponentes;
  public
    function GetSQL: String; Override;
  end;

var
  frmCadastroListagemListagemDeEntradas: TfrmCadastroListagemListagemDeEntradas;
  BuscaChaveEmpresa,
  BuscaChaveEstabelecimento,
  BuscaChaveFornecedor,
  BuscaChaveSetorEstoque: TBuscaChaveERP;

implementation

uses uClassesERP;

{$R *.dfm}

{ TfrmCadastroListagemListagemDeEntradas }

procedure TfrmCadastroListagemListagemDeEntradas.FormCreate(Sender: TObject);
begin
  inherited;
  TabelaPrincipal := 'MovimentoEntradas';
  Schema := 'Estoque';
  CampoChave := 'Id';
  CampoOrdem := 'Codigo';
  Sequence := 'MovimentoEntrada_Id';
  Maximiza := False;
//  FormCadDetalhe := TfrmCadMovimentoEntrada.Create(Self);

end;

procedure TfrmCadastroListagemListagemDeEntradas.FormShow(Sender: TObject);
begin
  inherited;

  InicializaComponentes;

end;

function TfrmCadastroListagemListagemDeEntradas.GetSQL: String;
begin
  Result :=
    'SELECT Entrada.Id, Entrada.NumNota, Entrada.SerieNota, Entrada.NumTransferencia, '+
    '       Entrada.DataEntrada, Entrada.DataEmissao, Entrada.Acrescimos, Entrada.Descontos, '+
    '       Entrada.ValorTotalNota, '+
    '       NaturezaOperacao.Descricao NaturezaDescricao, ModeloNota.Descricao ModeloNotaDescricao, '+
    '       SetorEstoque.Descricao SetorEstoqueDescricao, Fornecedor.NomeFantasia FornecedorDescricao, '+
    '       Entrada.NaturezaOperacao_Id, Entrada.ModeloNota_Id, Entrada.Empresa_Id, Entrada.Estabelecimento_Id, '+
    '       Entrada.SetorEstoque_Id, Entrada.Fornecedor_Id '+
    '  FROM "Estoque"."MovimentacaoEntrada" Entrada '+
    ' INNER JOIN "Estoque"."NaturezaOperacao" NaturezaOperacao '+
    '    ON (NaturezaOperacao.Id = Entrada.NaturezaOperacao_Id) '+
    ' INNER JOIN "Estoque"."ModeloNota" ModeloNota '+
    '    ON (ModeloNota.Id = Entrada.ModeloNota_Id) '+
    ' INNER JOIN "Estoque"."SetorEstoque" SetorEstoque '+
    '    ON (SetorEstoque.Id = Entrada.SetorEstoque_Id) '+
    ' INNER JOIN "BackOffice"."Fornecedores" Fornecedor '+
    '    ON (Fornecedor.Id = Entrada.Fornecedor_Id)';

end;

procedure TfrmCadastroListagemListagemDeEntradas.InicializaComponentes;
begin
  BuscaChaveEmpresa := TBuscaChaveERP.Create('BackOffice', 'Empresas', CdsCadastro, edtCodigoEmpresa,
    btnLocEmpresa, edtNomeEmpresa, 'Id', 'Empresa_Id', 'Codigo', 'NomeFantasia', tpEmpresa);
  BuscaChaveEmpresa.Atualiza;

  BuscaChaveEstabelecimento := TBuscaChaveERP.Create('BackOffice', 'Estabelecimentos', CdsCadastro, edtCodigoEstabelecimento,
    btnLocEstabelecimento, edtNomeEstabelecimento, 'Id', 'Estabelecimento_Id', 'Codigo', 'NomeFantasia', tpEstabelecimento);
  BuscaChaveEstabelecimento.Atualiza;

  BuscaChaveFornecedor := TBuscaChaveERP.Create('BackOffice', 'Fornecedores', CdsCadastro, edtCodigoFornecedor,
    btnLocFornecedor, edtNomeFornecedor, 'Id', 'Fornecedor_Id', 'Codigo', 'RazaoSocial', tpFornecedor);
  BuscaChaveFornecedor.Atualiza;

  BuscaChaveSetorEstoque := TBuscaChaveERP.Create('Estoque', 'SetorEstoque', CdsCadastro, edtCodigoSetorEstoque,
    btnLocSetorEstoque, edtNomeSetorEstoque, 'Id', 'SetorEstoque_Id', 'Codigo', 'Descricao', tpSetorEstoque);
  BuscaChaveSetorEstoque.Atualiza;

end;

end.
