unit uFrmCadastroListagemMovimentacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CadastroListagemPadrao, Data.DB,
  Datasnap.DBClient, Vcl.Menus, System.ImageList, Vcl.ImgList, System.Actions,
  Vcl.ActnList, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Vcl.ExtCtrls,

  uDMConexao, uDbContext,

  DTO.Movenda, DTO.Movenda_Item,

  uCadastroMovimentoAbastecimento;

type
  TfrmCadastroListagemMovimentacao = class(TfrmCadastroListagemPadrao)
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    procedure LoadData; override;
    procedure DoUpdate; override;
    procedure DoExclude; override;
    procedure NewRecord; override;
    procedure DoInsert; override;

    function GetSQL: String; Override;

  end;

var
  frmCadastroListagemMovimentacao: TfrmCadastroListagemMovimentacao;

implementation

uses uHelper;

{$R *.dfm}

procedure TfrmCadastroListagemMovimentacao.DoExclude;
var
  Movenda: TMovenda;
  Movenda_Item: TMovenda_Item;
begin
  Movenda := TMovenda.Create;
  Movenda_Item := TMovenda_Item.Create;

  Movenda.Id := CdsCadastro.FieldByName('Id').AsInteger;
  Movenda_Item.Id := CdsCadastro.FieldByName('ID_MOVENDA').AsInteger;

  DbContext.Movenda_Item.Delete(Movenda_Item);
  DbContext.Movenda.Delete(Movenda);

end;

procedure TfrmCadastroListagemMovimentacao.DoInsert;
var
  Movenda: TMovenda;
  Movenda_Item: TMovenda_Item;
begin
  Movenda := TMovenda.Create;
  Movenda_Item := TMovenda_Item.Create;

  Movenda.Id := CdsCadastro.FieldByName('Id').AsInteger;;
  Movenda.Data := Now;// CdsCadastro.FieldByName('Data').AsDateTime;

  Movenda_Item.Id := Helper.Funcoes.GetValGenerator('GEN_MOVENDA_ITEM_ID', DMConexao.Conexao);
  Movenda_Item.Id_Movenda := Movenda.Id;
  Movenda_Item.Id_Bomba := CdsCadastro.FieldByName('Id_Bomba').AsInteger;
  Movenda_Item.Valor := CdsCadastro.FieldByName('Valor').AsCurrency;
  Movenda_Item.Qtd := CdsCadastro.FieldByName('Qtd').AsFloat;
  Movenda_Item.Aliquota := CdsCadastro.FieldByName('Aliquota').AsCurrency;
  Movenda_Item.Vr_Imposto := CdsCadastro.FieldByName('Vr_Imposto').AsCurrency;

  DbContext.Movenda.Insert(Movenda);
  DbContext.Movenda_Item.Insert(Movenda_Item);

end;

procedure TfrmCadastroListagemMovimentacao.DoUpdate;
var
  Movenda: TMovenda;
  Movenda_Item: TMovenda_Item;
begin
  Movenda := TMovenda.Create;
  Movenda_Item := TMovenda_Item.Create;

  Movenda.Id := CdsCadastro.FieldByName('Id').AsInteger;

  Movenda_Item.Id := CdsCadastro.FieldByName('Id_Movenda_Item').AsInteger;
  Movenda_Item.Id_Movenda := Movenda.Id;
  Movenda_Item.Id_Bomba := CdsCadastro.FieldByName('Id_Bomba').AsInteger;
  Movenda_Item.Valor := CdsCadastro.FieldByName('Valor').AsCurrency;
  Movenda_Item.Qtd := CdsCadastro.FieldByName('Qtd').AsFloat;
  Movenda_Item.Aliquota := CdsCadastro.FieldByName('Aliquota').AsCurrency;
  Movenda_Item.Vr_Imposto := CdsCadastro.FieldByName('Vr_Imposto').AsCurrency;

  DbContext.Movenda.Update(Movenda);
  DbContext.Movenda_Item.Update(Movenda_Item);

end;

procedure TfrmCadastroListagemMovimentacao.FormCreate(Sender: TObject);
begin
  FormDetalhe := TfrmCadastroMovimentoCombustivelDetalhe.Create(Self);

end;

function TfrmCadastroListagemMovimentacao.GetSQL: String;
begin
  Result :=
    'SELECT MOV.ID,  MOV.DATA, '+
    '       MVI.ID ID_MOVENDA_ITEM, MVI.VALOR, MVI.QTD, MVI.VR_IMPOSTO, MVI.ID_MOVENDA, MVI.ID_BOMBA, MVI.ALIQUOTA, '+
    '       (MVI.VALOR * MVI.QTD) AS VALOR_TOTAL, '+

    '       B.CODIGO BOMBA_CODIGO, B.DESCRICAO BOMBA_DESCRICAO, '+
    '       T.CODIGO TANQUE_CODIGO, T.DESCRICAO TANQUE_DESCRICAO '+
    '  FROM MOVENDA MOV '+
    ' INNER JOIN MOVENDA_ITEM MVI '+
    '    ON (MVI.ID_MOVENDA = MOV.ID) '+
    ' INNER JOIN BOMBAS B '+
    '    ON (B.ID = MVI.ID_BOMBA) '+
    ' INNER JOIN TANQUES T '+
    '    ON (T.ID = B.ID_TANQUE)';

end;

procedure TfrmCadastroListagemMovimentacao.LoadData;
begin
  inherited;
  CdsCadastro := Helper.Funcoes.FillCds(GetSQL, DMConexao.Conexao);

  DataCadastro.DataSet := CdsCadastro;
  GridListagem.DataSource := DataCadastro;

end;

procedure TfrmCadastroListagemMovimentacao.NewRecord;
begin
  CdsCadastro.FieldByName('Id').AsInteger := Helper.Funcoes.GetValGenerator('GEN_MOVENDA_ID', DMConexao.Conexao);

end;

end.
