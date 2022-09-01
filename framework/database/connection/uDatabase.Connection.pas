unit uDatabase.Connection;

interface

uses System.Generics.Defaults, Vcl.Forms,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, Data.DB, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Phys.PG,
  FireDAC.Phys.PGDef,
  uTipos, uIConnection, uIDataBase,
  uDataBase.Firebird, uDataBase.SQLite;

type
  TConnection = class(TInterfacedObject, IConnection)
  protected
    FDataBase: IDataBase;

  private
    function GetDataBase: IDataBase;

    procedure SetDataBase(const AValue: IDataBase);

  public
    Conexao: TFDConnection;
    Transacao: TFDTransaction;

    constructor Create(ADataBase: IDatabase);

    procedure Prepare;
    procedure Open;

    property DataBase: IDataBase read GetDataBase write SetDataBase;

  end;

implementation

{ TConexao<T> }

constructor TConnection.Create(ADataBase: IDatabase);
begin
  FDataBase := ADataBase;
  Conexao := TFDConnection.Create(Application);
  Transacao := TFDTransaction.Create(Conexao);

end;

function TConnection.GetDataBase: IDataBase;
begin
  Result := FDataBase;

end;

procedure TConnection.Open;
begin
  Conexao.Open;

  Conexao.Connected;

end;

procedure TConnection.Prepare;
begin
  Conexao.Transaction := Transacao;

  with Conexao.Params do begin
    Clear;
    Add('DriverID='+ FDataBase.DriverDataBase);
    Add('Server='+ FDataBase.Servidor);
    Add('Database='+ FDataBase.DataBase);
    Add('User_Name='+ FDataBase.Usuario);
    Add('Password='+ FDataBase.Senha);
  end;

end;

procedure TConnection.SetDataBase(const AValue: IDataBase);
begin
  FDataBase := AValue;

end;

end.

