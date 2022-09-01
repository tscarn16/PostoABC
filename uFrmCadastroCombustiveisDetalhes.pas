unit uFrmCadastroCombustiveisDetalhes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CadastroDetalhePadrao, System.Actions,
  Vcl.ActnList, Data.DB, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Datasnap.DBClient,

  uDbContext, uHelper;

type
  TfrmCadastroCombustiveisDetalhes = class(TfrmCadastroDetalhePadrao)
    Label1: TLabel;
    edtDescricao: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroCombustiveisDetalhes: TfrmCadastroCombustiveisDetalhes;

implementation

{$R *.dfm}

end.
