unit uCadastroMovimentoAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CadastroDetalhePadrao, System.Actions,
  Vcl.ActnList, Data.DB, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Datasnap.DBClient, Vcl.ComCtrls;

type
  TfrmCadastroMovimentoCombustivelDetalhe = class(TfrmCadastroDetalhePadrao)
    Label2: TLabel;
    cmbBomba: TDBLookupComboBox;
    edtValorUnitario: TDBEdit;
    edtQuantidade: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DataBomba: TDataSource;
    DataTanque: TDataSource;
    CdsBomba: TClientDataSet;
    CdsTanque: TClientDataSet;
    cmbTanque: TDBLookupComboBox;
    Label1: TLabel;
    edtValorImposto: TDBEdit;
    Label5: TLabel;
    GroupBox1: TGroupBox;
    lblValorTotal: TLabel;
    GroupBox2: TGroupBox;
    lblValorImposto: TLabel;
    procedure FormShow(Sender: TObject);
  private
    procedure CdsCadastroValor_QtdChange(Sender: TField);

  public
    { Public declarations }
  end;

var
  frmCadastroMovimentoCombustivelDetalhe: TfrmCadastroMovimentoCombustivelDetalhe;

implementation

uses uDMConexao, uHelper, uDbContext;

{$R *.dfm}

procedure TfrmCadastroMovimentoCombustivelDetalhe.CdsCadastroValor_QtdChange(Sender: TField);
var
  Valor_Total: Currency;
begin
  if (DataDetalhes.DataSet.FieldByName('Valor').AsCurrency > 0) and
     (DataDetalhes.DataSet.FieldByName('Qtd').AsCurrency > 0) and
     (DataDetalhes.DataSet.FieldByName('Aliquota').AsCurrency > 0) then
  begin
    Valor_Total := DataDetalhes.DataSet.FieldByName('Valor').AsCurrency * DataDetalhes.DataSet.FieldByName('Qtd').AsCurrency;

    DataDetalhes.DataSet.FieldByName('Vr_Imposto').AsCurrency :=
      (Valor_Total * DataDetalhes.DataSet.FieldByName('Aliquota').AsCurrency) / 100; //DataDetalhes.DataSet.FieldByName('Aliquota').AsCurrency) / 100;

    DataDetalhes.DataSet.FieldByName('Valor_Total').AsCurrency :=
      Valor_Total + DataDetalhes.DataSet.FieldByName('Vr_Imposto').AsCurrency;

    lblValorImposto.Caption := FormatCurr('R$ 0.00##', DataDetalhes.DataSet.FieldByName('Vr_Imposto').AsCurrency);
    lblValorTotal.Caption := FormatCurr('R$ 0.00##', DataDetalhes.DataSet.FieldByName('Valor_Total').AsCurrency);

  end;


end;

procedure TfrmCadastroMovimentoCombustivelDetalhe.FormShow(Sender: TObject);
begin
  inherited;
  DataDetalhes.DataSet.FieldByName('Aliquota').AsCurrency := 13;

  if DataDetalhes.DataSet.FieldByName('Vr_Imposto').AsString <> '' then
    lblValorImposto.Caption := FormatCurr('R$ 0.00##', DataDetalhes.DataSet.FieldByName('Vr_Imposto').AsCurrency)
  else
    lblValorImposto.Caption := 'R$ 0,00';

  if DataDetalhes.DataSet.FieldByName('Valor_Total').AsString <> '' then
    lblValorTotal.Caption := FormatCurr('R$ 0.00##', DataDetalhes.DataSet.FieldByName('Valor_Total').AsCurrency)
  else
    lblValorTotal.Caption := 'R$ 0,00';

  DataDetalhes.DataSet.FieldByName('Qtd').OnChange := CdsCadastroValor_QtdChange;
  DataDetalhes.DataSet.FieldByName('Valor').OnChange := CdsCadastroValor_QtdChange;
  DataDetalhes.DataSet.FieldByName('Aliquota').OnChange := CdsCadastroValor_QtdChange;

  // Carrega Tanques
  CdsTanque := DbContext.Tanques.FindAll.ToCds;
  DataTanque.DataSet := CdsTanque;

  cmbTanque.DataField := 'Id_Tanque';
  cmbTanque.ListSource := DataTanque;
  cmbTanque.KeyField := 'Id';
  cmbTanque.ListField := 'Codigo;Descricao';

// Carrega Bombas
  CdsBomba := DbContext.Bombas.FindAll.ToCds;
  DataBomba.DataSet := CdsBomba;

  cmbBomba.DataField := 'Id_Bomba';
  cmbBomba.ListSource := DataBomba;
  cmbBomba.KeyField := 'Id';
  cmbBomba.ListField := 'Codigo;Descricao';

end;

end.
