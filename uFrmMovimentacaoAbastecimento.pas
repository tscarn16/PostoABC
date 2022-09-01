unit uFrmMovimentacaoAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CadMovimentoPadrao, Data.DB,
  Datasnap.DBClient, System.Actions, Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls,

  uDbContext,

  ObjDetalhe, uTipos,

  uHelper;

type
  TfrmMovimentacaoAbastecimento = class(TfrmCadMovimentoPadrao)
    edtData: TDBEdit;
    procedure FormShow(Sender: TObject);

  private
    procedure LoadData; override;

    procedure PesquisaCombustivel;

    procedure CalculaTotais;
    procedure CalculaTotaisProduto;

    procedure CdsDetalheProdutoNewRecord(DataSet: TDataSet);
    procedure CdsDetalheProdutoAfterPost(DataSer: TDataSet);
    procedure CdsDetalheProdutoQuantidadeChange(Sender: TField);

  protected
    procedure CriaDetalheProdutos;

  public
    { Public declarations }
  end;

var
  frmMovimentacaoAbastecimento: TfrmMovimentacaoAbastecimento;
  Dt: TuObjDetalhe;

implementation

{$R *.dfm}

{ TfrmMovimentacaoAbastecimento }

procedure TfrmMovimentacaoAbastecimento.CalculaTotais;
begin

end;

procedure TfrmMovimentacaoAbastecimento.CalculaTotaisProduto;
begin

end;

procedure TfrmMovimentacaoAbastecimento.CdsDetalheProdutoAfterPost(DataSer: TDataSet);
begin
  inherited;
  if Not (CdsCadastro.State in [dsInsert,dsEdit]) then
    CdsCadastro.Edit;

  CalculaTotais;

end;

procedure TfrmMovimentacaoAbastecimento.CdsDetalheProdutoNewRecord(DataSet: TDataSet);
begin
  inherited;
  if Not (CdsCadastro.State in [dsInsert,dsEdit]) then
    CdsCadastro.Edit;

//  DataDetalhe.DataSet.FieldByName('Id_MovimentacaoEntrada').AsString := CodEntrada;

  DataDetalhe.DataSet.FieldByName('NumeroItem').AsInteger := DataDetalhe.DataSet.RecordCount + 1;

end;

procedure TfrmMovimentacaoAbastecimento.CdsDetalheProdutoQuantidadeChange(Sender: TField);
begin
  if (Sender = Dt.ClientDataSet.FieldByName('ValorUnitario')) or (Sender = Dt.ClientDataSet.FieldByName('Quantidade')) then
    if (Dt.ClientDataSet.FieldByName('Quantidade').AsCurrency > 0) and (Dt.ClientDataSet.FieldByName('ValorUnitario').AsCurrency > 0) then
    begin
      Dt.ClientDataSet.FieldByName('ValorTotal').AsBCD :=
        Dt.ClientDataSet.FieldByName('Quantidade').AsCurrency * Dt.ClientDataSet.FieldByName('ValorUnitario').AsCurrency;
    end;

  CalculaTotaisProduto;

end;

procedure TfrmMovimentacaoAbastecimento.CriaDetalheProdutos;
begin
  Dt := TuObjDetalhe.Create;
  Dt.DBGrid := GridMovimento;
  DataDetalhe.DataSet := Dt.ClientDataSet;
  Dt.DataSource := DataDetalhe;
  GridMovimento.OnKeyDown := Dt.GridKeyDown;
  GridMovimento.OnColEnter := Dt.ColEnter;
  Dt.CampoPesquisaGrid := 'NomeProduto';
  Dt.CampoChavePesquisa := 'Id_ProdServ';
  Dt.MensagemExclusao := 'Deseja realmente excluir este produto?';
  Dt.CriaColuna('Id', '', tcChave);
  Dt.CriaColuna('Id_MovimentacaoEntrada', '', tcChave);
  Dt.CriaColuna('Id_ProdServ', '', tcChave);
  Dt.CriaColuna('NumeroItem', '*', tcInteger, 20, [pfInUpdate, pfInWhere], False, True);
  Dt.CriaColuna('NomeProduto', 'Combustivel', tcString, 324, [], False);
  Dt.CriaColuna('ValorUnitario', 'Valor Unitário', tcMonetario, 85, [pfInUpdate, pfInWhere], False);
  Dt.CriaColuna('Quantidade', 'Quantidade', tcDecimal, 65);
  Dt.CriaColuna('ValorTotal', 'Valor Total', tcMonetario, 95, [pfInUpdate, pfInWhere], False, True);
  Dt.OnNewRecord := CdsDetalheProdutoNewRecord;
  Dt.AfterPost := CdsDetalheProdutoAfterPost;
  Dt.ProcedurePesquisa := PesquisaCombustivel;
  Dt.ClientDataSet.FieldByName('Quantidade').OnChange := CdsDetalheProdutoQuantidadeChange;
  Dt.Aplicar;

end;

procedure TfrmMovimentacaoAbastecimento.FormShow(Sender: TObject);
begin
  inherited;
  CriaDetalheProdutos;

end;

procedure TfrmMovimentacaoAbastecimento.LoadData;
var
  StrSQL: String;
begin
  StrSQL :=
    'SELECT MOV.ID, MOV.DATA, B.CODIGO CODIGO_BOMBA, B.DESCRICAO DESCRICAO_BOMBA, '+
    '       T.CODIGO CODIGO_TANQUE, T.DESCRICAO DESCRICAO_TANQUE, MOV_ITEM.QTD, '+
    '       MOV_ITEM.VALOR, MOV_ITEM.VR_IMPOSTO '+
    '  FROM MOVENDA MOV '+
    ' INNER JOIN MOVENDA_ITEM MOV_ITEM '+
    '    ON (MOV_ITEM.ID_MOVENDA = MOV.ID) '+
    ' INNER JOIN BOMBAS B '+
    '    ON (B.ID = MOV_ITEM.ID_BOMBA) '+
    ' INNER JOIN TANQUES T '+
    '    ON (T.ID = B.ID_TANQUE) '+
    'WHERE 1 <> 1';

  Helper.Funcoes.FillCds(CdsCadastro, StrSQL, DbContext.Movenda.Connection);

  DataCadastro.DataSet := CdsCadastro;
//  GridListagem.DataSource := DataCadastro;

end;

procedure TfrmMovimentacaoAbastecimento.PesquisaCombustivel;
begin
  Helper.Funcoes.PesqProdutoServico(Dt.ClientDataSet.FieldByName(Dt.CampoPesquisaGrid).Text, Dt.ClientDataSet, tpCombustivel);

end;

end.
