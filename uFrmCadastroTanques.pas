unit uFrmCadastroTanques;

interface

uses Vcl.Grids, Vcl.DBGrids, Data.DB, Datasnap.DBClient, System.Classes, System.Actions, Vcl.ActnList,
  Vcl.Controls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, TypInfo, Variants,

  CadastroListagemPadrao,

  uTipos, uDbContext,

  DTO.Tanque,

  uFrmCadastroTanquesDetalhes, CadastroPadrao, Vcl.Menus, System.ImageList,
  Vcl.ImgList;

type
  TfrmCadastroTanques = class(TfrmCadastroPadrao)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure LoadData; override;
    procedure DoUpdate; override;
    procedure DoExclude; override;
    procedure DoInsert; override;

  end;

var
  frmCadastroTanques: TfrmCadastroTanques;

implementation

{$R *.dfm}

{ TfrmCadastroTanques }

procedure TfrmCadastroTanques.DoExclude;
var
  iFieldCount: Integer;
  Tanque: TTanque;
begin
  Tanque := TTanque.Create;

  for iFieldCount := 0 to CdsCadastro.FieldCount - 1 do
    SetPropValue(Tanque, CdsCadastro.Fields[iFieldCount].FieldName, CdsCadastro.Fields[iFieldCount].Value);

  DbContext.Tanques.Delete(Tanque);

end;

procedure TfrmCadastroTanques.DoInsert;
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

procedure TfrmCadastroTanques.DoUpdate;
var
  iFieldCount: Integer;
  Tanque: TTanque;
begin
  Tanque := TTanque.Create;

  for iFieldCount := 0 to CdsCadastro.FieldCount - 1 do
    SetPropValue(Tanque, CdsCadastro.Fields[iFieldCount].FieldName, CdsCadastro.Fields[iFieldCount].Value);

  DbContext.Tanques.Update(Tanque);

end;

procedure TfrmCadastroTanques.FormCreate(Sender: TObject);
begin
  inherited;
  FormDetalhe := TfrmCadastroTanquesDetalhe.Create(Self);

end;

procedure TfrmCadastroTanques.LoadData;
begin
  CdsCadastro := DbContext.Tanques.FindAll.ToCds;

  DataCadastro.DataSet := CdsCadastro;
  GridCadastros.DataSource := DataCadastro;

end;

end.
