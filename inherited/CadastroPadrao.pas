unit CadastroPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormPadrao, DB, DBClient, ActnList, ComCtrls, Menus, ExtCtrls,
  StdCtrls, Buttons, CadastroDetalhePadrao, System.Actions, System.ImageList,
  Vcl.ImgList, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCadastroPadrao = class(TFormPadrao)
    Menu: TMainMenu;
    Cadastro1: TMenuItem;
    Panel3: TPanel;
    StatusBar: TStatusBar;
    DataCadastro: TDataSource;
    Panel1: TPanel;
    GridCadastros: TDBGrid;
    i1: TMenuItem;
    F1: TMenuItem;
    DelExcluir1: TMenuItem;
    F2: TMenuItem;
    F3: TMenuItem;
    E1: TMenuItem;
    CdsCadastro: TClientDataSet;
    Action: TActionList;
    actSair: TAction;
    actNovo: TAction;
    actEditar: TAction;
    actExcluir: TAction;
    actImprimir: TAction;
    actBuscar: TAction;
    btnIncluir: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnSair: TSpeedButton;
    ImageList1: TImageList;
    procedure actEditarExecute(Sender: TObject);
    procedure actNovoExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridCadastrosDblClick(Sender: TObject);

  private
    FMaximiza: Boolean;
    FPesquisando: Boolean;
    FEditando: Boolean;
    FVariosRegistros: Boolean;

    FFormDetalhe: TfrmCadastroDetalhePadrao;

    procedure Atualiza;

  protected

  public
    procedure LoadData; virtual; abstract;
    procedure DoUpdate; virtual; abstract;
    procedure DoExclude; virtual; abstract;
    procedure DoInsert; virtual; abstract;

    property FormDetalhe: TfrmCadastroDetalhePadrao read FFormDetalhe write FFormDetalhe;
    property Maximiza: Boolean read FMaximiza write FMaximiza;
    property Pesquisando: Boolean read FPesquisando write FPesquisando;
    property Editando: Boolean read FEditando write FEditando;
    property VariosRegistros: Boolean read FVariosRegistros write FVariosRegistros;

  end;


var
  frmCadastroPadrao: TfrmCadastroPadrao;

implementation

uses uHelper;

{$R *.dfm}


{ TfrmCadastroPadrao }

procedure TfrmCadastroPadrao.actEditarExecute(Sender: TObject);
begin
  try
    if CdsCadastro.IsEmpty then
    begin
      Helper.Funcoes.Avisa('Nenhum registro encontrado');
      Exit;

    end;

    if Assigned(Self.FFormDetalhe) then
      with Self.FormDetalhe do
      begin
        Editando := False;
        DataDetalhes.DataSet := CdsCadastro;

        CdsCadastro.Edit;

        ShowModal;

        if Salvar then
          DoUpdate;

      end;

    Atualiza;

  except on E: Exception do
    Helper.Funcoes.AvisaErro(E.Message, 'Erro ao editar o registro!')

  end;

end;

procedure TfrmCadastroPadrao.actExcluirExecute(Sender: TObject);
begin
  try
    if CdsCadastro.IsEmpty then
    begin
      Helper.Funcoes.Avisa('Nenhum registro encontrado');
      Exit;

    end;

    if Helper.Funcoes.Confirma('Deseja realmente excluir este registro?') then
    begin
        DoExclude;

        CdsCadastro.Delete;

    end;

  except on E: Exception do
    Helper.Funcoes.AvisaErro(E.Message, 'Erro ao excluir o registro!')

  end;

end;

procedure TfrmCadastroPadrao.actNovoExecute(Sender: TObject);
begin
  try
    Self.GridCadastros.Enabled := False;

    if Assigned(FormDetalhe) then
    begin
      with FormDetalhe do
      Begin
        Self.GridCadastros.Enabled := True;

        DataDetalhes.DataSet := CdsCadastro;

        if CdsCadastro.State in ([dsEdit,dsInsert]) then
          CdsCadastro.Cancel;

        CdsCadastro.Append;
        ShowModal;

        if Salvar then
        begin
          DoInsert;
          LoadData;

        end;
      end;
    end;

  except on E: Exception do
    Helper.Funcoes.AvisaErro(E.Message, 'Erro ao cadastrar o registro!')

  end;

end;

procedure TfrmCadastroPadrao.actSairExecute(Sender: TObject);
begin
  inherited;
  Close;

end;

procedure TfrmCadastroPadrao.Atualiza;
begin

end;

procedure TfrmCadastroPadrao.FormCreate(Sender: TObject);
begin
  inherited;
  VariosRegistros := False;
  Pesquisando := False;

  if Maximiza then
    Self.WindowState := wsMaximized;

end;

procedure TfrmCadastroPadrao.FormShow(Sender: TObject);
begin
  if Maximiza then
    Self.WindowState := wsMaximized;

  Pesquisando := False;

  LoadData;

  if FormDetalhe <> nil then
    FormDetalhe.DataDetalhes.DataSet := CdsCadastro;

end;

procedure TfrmCadastroPadrao.GridCadastrosDblClick(Sender: TObject);
begin
  inherited;
  actEditarExecute(Self);

end;

end.

