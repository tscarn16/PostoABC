unit uDatabase.SQLite;

interface

uses uIDataBase;

type
  TSQLite = class(TInterfacedObject, IDataBase)
    FDriverDataBase: String;
    FServidor: String;
    FPorta: Integer;
    FUsuario: String;
    FSenha: String;
    FDataBase: String;
    FSGDB: String;

  private
    procedure SetDriverDataBase(AValue: String);
    procedure SetServidor(AValue: String);
    procedure SetPorta(AValue: Integer);
    procedure SetUsuario(AValue: String);
    procedure SetSenha(AValue: String);
    procedure SetDataBase(AValue: String);
    procedure SetSGDB(AValue: String);

    function GetDriverDataBase: String;
    function GetServidor: String;
    function GetPorta: Integer;
    function GetUsuario: String;
    function GetSenha: String;
    function GetDataBase: String;
    function GetSGDB: String;

  public
    constructor Create;

    property DriverDataBase: String read GetDriverDataBase write SetDriverDataBase;
    property Servidor: String read GetServidor write SetServidor;
    property Porta: Integer read GetPorta write SetPorta;
    property Usuario: String read GetUsuario write SetUsuario;
    property Senha: String read GetSenha write SetSenha;
    property DataBase: String read GetDataBase write SetDataBase;
    property SGDB: String read GetSGDB write SetSGDB;

  end;

implementation

constructor TSQLite.Create;
begin
  FDriverDataBase := 'FB';
  FServidor       := 'Localhost';
  FPorta          := 3050;
  FUsuario        := 'SYSDBA';
  FSenha          := 'masterkey';
  FDataBase       := '';
  FSGDB           := '';

end;

function TSQLite.GetDataBase: String;
begin
  Result := FDataBase;

end;

function TSQLite.GetDriverDataBase: String;
begin
  Result := FDriverDataBase;

end;

function TSQLite.GetPorta: Integer;
begin
  Result := FPorta;

end;

function TSQLite.GetSenha: String;
begin
  Result := FSenha;

end;

function TSQLite.GetServidor: String;
begin
  Result := FServidor;

end;

function TSQLite.GetSGDB: String;
begin
  Result := FSGDB;
end;

function TSQLite.GetUsuario: String;
begin
  Result := FUsuario;

end;

procedure TSQLite.SetDataBase(AValue: String);
begin
  FDataBase := AValue;

end;

procedure TSQLite.SetDriverDataBase(AValue: String);
begin
  FDriverDataBase := AValue;

end;

procedure TSQLite.SetPorta(AValue: Integer);
begin
  FPorta := AValue;

end;

procedure TSQLite.SetSenha(AValue: String);
begin
  FSenha := AValue;

end;

procedure TSQLite.SetServidor(AValue: String);
begin
  FServidor := AValue;

end;

procedure TSQLite.SetSGDB(AValue: String);
begin
  FSGDB := AValue;

end;

procedure TSQLite.SetUsuario(AValue: String);
begin
  FUsuario := AValue;

end;

end.
