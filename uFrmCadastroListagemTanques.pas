unit uFrmCadastroListagemTanques;

interface

uses Vcl.Grids, Vcl.DBGrids, Data.DB, Datasnap.DBClient, System.Classes, System.Actions, Vcl.ActnList,
  Vcl.Controls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, TypInfo, Variants,

  CadastroListagemPadrao,

  uTipos, uDbContext,

  DTO.Tanque,

  uFrmCadastroTanquesDetalhes;

type
  TfrmCadastroListagemTanques = class(TfrmCadastroListagemPadrao)
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
  frmCadastroListagemTanques: TfrmCadastroListagemTanques;

implementation

{$R *.dfm}

{ TfrmCadastroListagemTanques }

procedure TfrmCadastroListagemTanques.DoExclude;
var
  iFieldCount: Integer;
  Tanque: TTanque;
begin
  Tanque := TTanque.Create;

  for iFieldCount := 0 to CdsCadastro.FieldCount - 1 do
    SetPropValue(Tanque, CdsCadastro.Fields[iFieldCount].FieldName, CdsCadastro.Fields[iFieldCount].Value);

  DbContext.Tanques.Delete(Tanque);

end;

procedure TfrmCadastroListagemTanques.DoInsert;
var
  iFieldCount: Integer;
  Tanque: TTanque;
begin
  Tanque := TTanque.Create;

  for iFieldCount := 0 to CdsCadastro.FieldCount - 1 do
    if Not(VarIsNull(CdsCadastro.Fields[iFieldCount].Value)) then
      SetPropValue(Tanque, CdsCadastro.Fields[iFieldCount].FieldName, CdsCadastro.Fields[iFieldCount].Value );

  DbContext.Tanques.Insert(Tanque);

end;

procedure TfrmCadastroListagemTanques.DoUpdate;
var
  iFieldCount: Integer;
  Tanque: TTanque;
begin
  Tanque := TTanque.Create;

  for iFieldCount := 0 to CdsCadastro.FieldCount - 1 do
    SetPropValue(Tanque, CdsCadastro.Fields[iFieldCount].FieldName, CdsCadastro.Fields[iFieldCount].Value);

  DbContext.Tanques.Update(Tanque);

end;

procedure TfrmCadastroListagemTanques.FormCreate(Sender: TObject);
begin
  inherited;
  FormDetalhe := TfrmCadastroTanquesDetalhe.Create(Self);

end;

procedure TfrmCadastroListagemTanques.LoadData;
begin
  CdsCadastro := DbContext.Tanques.FindAll.ToCds;

  DataCadastro.DataSet := CdsCadastro;
  GridListagem.DataSource := DataCadastro;

end;

end.
