unit uFrmCadastroBombasDetalhes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CadastroDetalhePadrao, System.Actions,
  Vcl.ActnList, Data.DB, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Datasnap.DBClient,

  uDbContext, uHelper;

type
  TfrmCadastroBombasDetalhe = class(TfrmCadastroDetalhePadrao)
    Label1: TLabel;
    edtDescricao: TDBEdit;
    cmbTanque: TDBLookupComboBox;
    DataTanques: TDataSource;
    CdsTanques: TClientDataSet;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroBombasDetalhe: TfrmCadastroBombasDetalhe;

implementation

{$R *.dfm}

procedure TfrmCadastroBombasDetalhe.FormShow(Sender: TObject);
begin
  inherited;
  CdsTanques := DbContext.Tanques.FindAll.ToCds;
  DataTanques.DataSet := CdsTanques;

  cmbTanque.DataField := 'Id_Tanque';
  cmbTanque.ListSource := DataTanques;
  cmbTanque.KeyField := 'Id';
  cmbTanque.ListField := 'Codigo;Descricao';

end;

end.
