unit uDMConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, Data.DB, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Phys.PG, FireDAC.Phys.PGDef, IniFiles,

  uHelper;

type
  TDMConexao = class(TDataModule)
    Conexao: TFDConnection;
    TransactionPrincipal: TFDTransaction;
    TransactionAuxiliar: TFDTransaction;
    procedure DataModuleCreate(Sender: TObject);

  protected
    ParametrosBancoDeDados: TFDConnectionDefParams;

    procedure InicializaObjetos;

  end;

var
  DMConexao: TDMConexao;

implementation

{$R *.dfm}

{ TDMConexao }

procedure TDMConexao.DataModuleCreate(Sender: TObject);
begin
  InicializaObjetos;

end;

procedure TDMConexao.InicializaObjetos;
begin
  Conexao.Transaction := TransactionPrincipal;

  with Conexao.Params do begin
    Clear;
    Add('DriverID=FB');
    Add('Server='+ Helper.ArqINI.Conexao.Servidor);
    Add('Database='+ Helper.ArqINI.Conexao.DataBase);
    Add('User_Name='+ Helper.ArqINI.Conexao.Usuario);
    Add('Password='+ Helper.ArqINI.Conexao.Senha);
  end;

  Conexao.Open;

end;

end.
