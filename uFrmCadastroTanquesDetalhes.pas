unit uFrmCadastroTanquesDetalhes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CadastroDetalhePadrao, System.Actions,
  Vcl.ActnList, Data.DB, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Datasnap.DBClient,

  uDbContext, uHelper;

type
  TfrmCadastroTanquesDetalhe = class(TfrmCadastroDetalhePadrao)
    edtDescricao: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    cmbCombustivel: TDBLookupComboBox;
    CdsCombustiveis: TClientDataSet;
    DataCombustiveis: TDataSource;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroTanquesDetalhe: TfrmCadastroTanquesDetalhe;

implementation

{$R *.dfm}

procedure TfrmCadastroTanquesDetalhe.FormShow(Sender: TObject);
begin
  inherited;
  CdsCombustiveis := DbContext.Combustiveis.FindAll.ToCds;
  DataCombustiveis.DataSet := CdsCombustiveis;

  cmbCombustivel.DataField := 'Id_Combustivel';
  cmbCombustivel.ListSource := DataCombustiveis;
  cmbCombustivel.KeyField := 'Id';
  cmbCombustivel.ListField := 'Codigo;Descricao';

end;

end.
