unit CadastroDetalhePadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormPadrao, StdCtrls, Buttons, ExtCtrls, DB, Menus, System.ImageList,
  Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmCadastroDetalhePadrao = class(TFormPadrao)
    frmCadastroDetalhePadrao: TPanel;
    DataDetalhes: TDataSource;
    Action: TActionList;
    actGravar: TAction;
    actCancelar: TAction;
    Panel3: TPanel;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    Separador2: TPanel;
    Panel4: TPanel;
    lblCodigo: TLabel;
    edtCodigo: TDBEdit;
    procedure actGravarExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);

  private
    FSalvar: Boolean;

  public
    property Salvar: Boolean read FSalvar write FSalvar;

  end;

var
  frmCadastroDetalhePadrao: TfrmCadastroDetalhePadrao;

implementation

{$R *.dfm}

procedure TfrmCadastroDetalhePadrao.actCancelarExecute(Sender: TObject);
begin
  inherited;
  DataDetalhes.DataSet.Cancel;
  Salvar := False;

  Close;

end;

procedure TfrmCadastroDetalhePadrao.actGravarExecute(Sender: TObject);
begin
  inherited;
  Salvar := True;

  Close;

end;

end.
