unit uFrmCadastroListagemCombustiveis;

interface

uses Vcl.Grids, Vcl.DBGrids, Data.DB, Datasnap.DBClient, System.Classes, System.Actions, Vcl.ActnList,
  Vcl.Controls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, TypInfo, Variants,

  CadastroListagemPadrao,

  uTipos, uDbContext,

  DTO.Combustivel,

  uFrmCadastroListagemCombustiveisDetalhes;

type
  TfrmCadastroListagemCombustiveis = class(TfrmCadastroListagemPadrao)
    procedure FormCreate(Sender: TObject);

  private
    procedure LoadData; override;
    procedure DoUpdate; override;
    procedure DoExclude; override;
    procedure DoInsert; override;

  public
    { Public declarations }
  end;

var
  frmCadastroListagemCombustiveis: TfrmCadastroListagemCombustiveis;

implementation

{$R *.dfm}

{ TfrmCadastroListagemCombustiveis }

procedure TfrmCadastroListagemCombustiveis.DoExclude;
var
  iFieldCount: Integer;
  Combustivel: TCombustivel;
begin
  COmbustivel := TCombustivel.Create;

  for iFieldCount := 0 to CdsCadastro.FieldCount - 1 do
    SetPropValue(Combustivel, CdsCadastro.Fields[iFieldCount].FieldName, CdsCadastro.Fields[iFieldCount].Value);

  DbContext.Combustiveis.Delete(Combustivel);

end;

procedure TfrmCadastroListagemCombustiveis.DoInsert;
var
  iFieldCount: Integer;
  Combustivel: TCombustivel;
begin
  Combustivel := TCombustivel.Create;

  for iFieldCount := 0 to CdsCadastro.FieldCount - 1 do
    if Not(VarIsNull(CdsCadastro.Fields[iFieldCount].Value)) then
      SetPropValue(Combustivel, CdsCadastro.Fields[iFieldCount].FieldName, CdsCadastro.Fields[iFieldCount].Value );

  DbContext.Combustiveis.Insert(Combustivel);

end;

procedure TfrmCadastroListagemCombustiveis.DoUpdate;
var
  iFieldCount: Integer;
  Combustivel: TCombustivel;
begin
  Combustivel := TCombustivel.Create;

  for iFieldCount := 0 to CdsCadastro.FieldCount - 1 do
    SetPropValue(Combustivel, CdsCadastro.Fields[iFieldCount].FieldName, CdsCadastro.Fields[iFieldCount].Value);

  DbContext.Combustiveis.Update(Combustivel);

end;

procedure TfrmCadastroListagemCombustiveis.FormCreate(Sender: TObject);
begin
  inherited;
  FormDetalhe := TfrmCadastroListagemCombustiveisDetalhes.Create(Self);

end;

procedure TfrmCadastroListagemCombustiveis.LoadData;
begin
  CdsCadastro := DbContext.Combustiveis.FindAll.ToCds;

  DataCadastro.DataSet := CdsCadastro;
  GridListagem.DataSource := DataCadastro;

end;

end.
