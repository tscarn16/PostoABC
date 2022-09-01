unit CadastroListagemPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormPadrao, DB, Menus, ImgList, DBClient, ActnList, StdCtrls,
  ComCtrls, Buttons, ExtCtrls, CadastroDetalhePadrao,
  System.ImageList, System.Actions, Vcl.Grids, Vcl.DBGrids,

  uDmConexao;

type
  TfrmCadastroListagemPadrao = class(TFormPadrao)
    PanelPrincipal: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    pnlSep: TPanel;
    StatusBar1: TStatusBar;
    PanelConteudo: TPanel;
    pnlTitulo: TPanel;
    PanelGriidInformacoes: TPanel;
    Action: TActionList;
    actSair: TAction;
    actPrimeiro: TAction;
    actAnterior: TAction;
    actProximo: TAction;
    actUltimo: TAction;
    actNovo: TAction;
    actEditar: TAction;
    actExcluir: TAction;
    actGravar: TAction;
    actCancelar: TAction;
    actImprimir: TAction;
    actBuscar: TAction;
    actInformacao: TAction;
    DataCadastro: TDataSource;
    ImageList1: TImageList;
    Menu1: TMainMenu;
    CdsCadastro: TClientDataSet;
    GridListagem: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure actNovoExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actPrimeiroExecute(Sender: TObject);
    procedure actProximoExecute(Sender: TObject);
    procedure actUltimoExecute(Sender: TObject);
    procedure DataCadastroStateChange(Sender: TObject);
    procedure actAnteriorExecute(Sender: TObject);
    procedure GridListagemDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    pFormDetalhe: TfrmCadastroDetalhePadrao;
    pMaximiza: Boolean;
    FPesquisando: Boolean;
    FEditando: Boolean;

  public
    function GetSql: String; virtual; abstract;

    procedure LoadData; virtual; abstract;
    procedure DoUpdate; virtual; abstract;
    procedure DoExclude; virtual; abstract;
    procedure NewRecord; virtual; abstract;
    procedure DoInsert; virtual; abstract;

    property FormDetalhe: TfrmCadastroDetalhePadrao read pFormDetalhe write pFormDetalhe;
    property Maximiza: Boolean read pMaximiza write pMaximiza;
    property Pesquisando: Boolean read FPesquisando write FPesquisando;
    property Editando: Boolean read FEditando write FEditando;

  end;

var
  frmCadastroListagemPadrao: TfrmCadastroListagemPadrao;
  StrSql: String;

implementation

uses uHelper;

{$R *.dfm}

procedure TfrmCadastroListagemPadrao.actAnteriorExecute(Sender: TObject);
begin
  inherited;
  if CdsCadastro.RecordCount > 0 then
    CdsCadastro.Prior
  else
    Helper.Funcoes.Avisa('Não exite nenhum registro cadastrado!');

end;

procedure TfrmCadastroListagemPadrao.actCancelarExecute(Sender: TObject);
begin
  inherited;
  CdsCadastro.Cancel;

end;

procedure TfrmCadastroListagemPadrao.actEditarExecute(Sender: TObject);
begin
  try
    if CdsCadastro.IsEmpty then
    begin
      Helper.Funcoes.Avisa('Nenhum registro encontrado');
      Exit;

    end;

    if Assigned(FormDetalhe) then
    begin
      with Self.FormDetalhe do
      begin
        Editando := False;
        DataDetalhes.DataSet := CdsCadastro;

        CdsCadastro.Edit;

        ShowModal;

        if Salvar then
        begin
          DoUpdate;
          LoadData;

        end;

      end;
    end;

  except on E: Exception do
    Helper.Funcoes.AvisaErro(E.Message, 'Erro ao editar o registro!')

  end;

end;

procedure TfrmCadastroListagemPadrao.actExcluirExecute(Sender: TObject);
begin
  try
    if CdsCadastro.IsEmpty then
    begin
      Helper.Funcoes.Avisa('Nenhum registro encontrado');
      Exit;

    end;

    if Helper.Funcoes.Confirma('Deseja realmente excluir este registro?') then
    begin
      CdsCadastro.Delete;
      DoExclude;
      LoadData;

    end;

  except on E: Exception do
    Helper.Funcoes.AvisaErro(E.Message, 'Erro ao excluir o registro!')

  end;

end;

procedure TfrmCadastroListagemPadrao.actNovoExecute(Sender: TObject);
begin
  try
    if Assigned(FormDetalhe) then
    begin
      with FormDetalhe do
      Begin
        DataDetalhes.DataSet := CdsCadastro;

        if CdsCadastro.State in ([dsEdit,dsInsert]) then
          CdsCadastro.Cancel;

        DataDetalhes.DataSet.Append;
        ShowModal;

        if Salvar then
        begin
          Helper.Funcoes.StartTrans(DMConexao.TransactionPrincipal);
          NewRecord;
          DoInsert;
          Helper.Funcoes.CommitTrans(DMConexao.TransactionPrincipal);

          LoadData;

        end else
          if CdsCadastro.State in ([dsEdit,dsInsert]) then
            CdsCadastro.Cancel;
      end;

    end;

  except on E: Exception do
    Helper.Funcoes.AvisaErro(E.Message, 'Erro ao cadastrar o registro!')

  end;

end;

procedure TfrmCadastroListagemPadrao.actPrimeiroExecute(Sender: TObject);
begin
  inherited;
  if CdsCadastro.RecordCount > 0 then
    CdsCadastro.First
  else
    Helper.Funcoes.Avisa('Não exite nenhum registro cadastrado!');

end;

procedure TfrmCadastroListagemPadrao.actProximoExecute(Sender: TObject);
begin
  inherited;
  if CdsCadastro.RecordCount > 0 then
    CdsCadastro.Next
  else
    Helper.Funcoes.Avisa('Não exite nenhum registro cadastrado!');

end;

procedure TfrmCadastroListagemPadrao.actSairExecute(Sender: TObject);
begin
  inherited;
  Close;

end;

procedure TfrmCadastroListagemPadrao.actUltimoExecute(Sender: TObject);
begin
  inherited;
  if CdsCadastro.RecordCount > 0 then
    CdsCadastro.Last

  else
    Helper.Funcoes.Avisa('Não exite nenhum registro cadastrado!');

end;

procedure TfrmCadastroListagemPadrao.DataCadastroStateChange(Sender: TObject);
begin
  inherited;
  actPrimeiro.Enabled := not(CdsCadastro.State in [dsEdit, dsInsert]);
  actProximo.Enabled := actPrimeiro.Enabled;
  actAnterior.Enabled := actPrimeiro.Enabled;
  actUltimo.Enabled := actPrimeiro.Enabled;
  actNovo.Enabled := not(CdsCadastro.State in [dsEdit, dsInsert]);
  actEditar.Enabled := actNovo.Enabled;
  actExcluir.Enabled := actNovo.Enabled;
  actBuscar.Enabled := actNovo.Enabled;
  actGravar.Enabled := not(actNovo.Enabled);
  actCancelar.Enabled := not(actNovo.Enabled);

end;

procedure TfrmCadastroListagemPadrao.FormCreate(Sender: TObject);
begin
  inherited;
  Pesquisando := False;

  if Maximiza then
    Self.WindowState := wsMaximized;

  Self.Menu := Menu;
  StrSql := GetSql;

  if StrSql = '' then
  begin
    Helper.Funcoes.AvisaErro('Str inicial não implementado!');
    Abort;

  end else
    Helper.Funcoes.FillCds(CdsCadastro, StrSql, DmConexao.Conexao);

  DataCadastroStateChange(Self);

  if FormDetalhe <> nil then
    FormDetalhe.DataDetalhes.DataSet := CdsCadastro;

end;

procedure TfrmCadastroListagemPadrao.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(CdsCadastro);

end;

procedure TfrmCadastroListagemPadrao.FormShow(Sender: TObject);
begin
  LoadData;

end;

procedure TfrmCadastroListagemPadrao.GridListagemDblClick(Sender: TObject);
begin
  inherited;
  actEditarExecute(Self);

end;

end.
