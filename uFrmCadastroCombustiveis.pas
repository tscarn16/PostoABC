unit uFrmCadastroCombustiveis;

interface

uses Vcl.Grids, Vcl.DBGrids, Data.DB, Datasnap.DBClient, System.Classes, System.Actions, Vcl.ActnList,
  Vcl.Controls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, TypInfo, Variants,

  CadastroListagemPadrao,

  uTipos, uDbContext,

  DTO.Combustivel,

  uFrmCadastroCombustiveisDetalhes, CadastroPadrao, Vcl.Menus, System.ImageList,
  Vcl.ImgList;

type
  TfrmCadastroCombustiveis = class(TfrmCadastroPadrao)
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
  frmCadastroCombustiveis: TfrmCadastroCombustiveis;

implementation

{$R *.dfm}

procedure TfrmCadastroCombustiveis.DoExclude;
var
  iFieldCount: Integer;
  Combustivel: TCombustivel;
begin
  Combustivel := TCombustivel.Create;

  for iFieldCount := 0 to CdsCadastro.FieldCount - 1 do
    SetPropValue(Combustivel, CdsCadastro.Fields[iFieldCount].FieldName, CdsCadastro.Fields[iFieldCount].Value);

  DbContext.Combustiveis.Delete(Combustivel);

end;

procedure TfrmCadastroCombustiveis.DoInsert;
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

procedure TfrmCadastroCombustiveis.DoUpdate;
var
  iFieldCount: Integer;
  Combustivel: TCombustivel;
begin
  Combustivel := TCombustivel.Create;

  for iFieldCount := 0 to CdsCadastro.FieldCount - 1 do
    SetPropValue(Combustivel, CdsCadastro.Fields[iFieldCount].FieldName, CdsCadastro.Fields[iFieldCount].Value);

  DbContext.Combustiveis.Update(Combustivel);

end;

procedure TfrmCadastroCombustiveis.FormCreate(Sender: TObject);
begin
  inherited;
  FormDetalhe := TfrmCadastroCombustiveisDetalhes.Create(Self);

end;

procedure TfrmCadastroCombustiveis.LoadData;
begin
  CdsCadastro := DbContext.Combustiveis.FindAll.ToCds;

  DataCadastro.DataSet := CdsCadastro;
  GridCadastros.DataSource := DataCadastro;

end;

end.
