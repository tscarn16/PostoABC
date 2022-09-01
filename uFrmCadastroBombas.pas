unit uFrmCadastroBombas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CadastroListagemPadrao, Data.DB,
  Datasnap.DBClient, System.Actions, Vcl.ActnList, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls,

  System.TypInfo,

  uTipos, uDbContext,

  DTO.Bomba,

  uFrmCadastroBombasDetalhes, CadastroPadrao, Vcl.Menus, System.ImageList,
  Vcl.ImgList;

type
  TfrmCadastroBombas = class(TfrmCadastroPadrao)
    procedure FormCreate(Sender: TObject);

  private
    procedure LoadData; override;
    procedure DoUpdate; override;
    procedure DoExclude; override;
    procedure DoInsert; override;

  end;

var
  frmCadastroBombas: TfrmCadastroBombas;

implementation

{$R *.dfm}

procedure TfrmCadastroBombas.DoExclude;
var
  iFieldCount: Integer;
  Bomba: TBomba;
begin
  Bomba := TBomba.Create;

  for iFieldCount := 0 to CdsCadastro.FieldCount - 1 do
    SetPropValue(Bomba, CdsCadastro.Fields[iFieldCount].FieldName, CdsCadastro.Fields[iFieldCount].Value);

  DbContext.Bombas.Delete(Bomba);

end;

procedure TfrmCadastroBombas.DoInsert;
var
  iFieldCount: Integer;
  Bomba: TBomba;
begin
  Bomba := TBomba.Create;

  for iFieldCount := 0 to CdsCadastro.FieldCount - 1 do
    if Not(VarIsNull(CdsCadastro.Fields[iFieldCount].Value)) then
      SetPropValue(Bomba, CdsCadastro.Fields[iFieldCount].FieldName, CdsCadastro.Fields[iFieldCount].Value );

  DbContext.Bombas.Insert(Bomba);

end;

procedure TfrmCadastroBombas.DoUpdate;
var
  iFieldCount: Integer;
  Bomba: TBomba;
begin
  Bomba := TBomba.Create;

  for iFieldCount := 0 to CdsCadastro.FieldCount - 1 do
    SetPropValue(Bomba, CdsCadastro.Fields[iFieldCount].FieldName, CdsCadastro.Fields[iFieldCount].Value);

  DbContext.Bombas.Update(Bomba);

end;

procedure TfrmCadastroBombas.FormCreate(Sender: TObject);
begin
  FormDetalhe := TfrmCadastroBombasDetalhe.Create(Self);

end;

procedure TfrmCadastroBombas.LoadData;
begin
  CdsCadastro := DbContext.Bombas.FindAll.ToCds;

  DataCadastro.DataSet := CdsCadastro;
  GridCadastros.DataSource := DataCadastro;

end;

end.
