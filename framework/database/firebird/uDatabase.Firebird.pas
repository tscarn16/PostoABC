unit uDatabase.Firebird;

interface

uses uIDataBase;

type
  TFireBird = class(TInterfacedObject, IDataBase)
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

constructor TFireBird.Create;
begin
  FDriverDataBase := 'FB';
  FServidor       := 'Localhost';
  FPorta          := 3050;
  FUsuario        := 'SYSDBA';
  FSenha          := 'masterkey';
  FDataBase       := '';

end;

function TFireBird.GetDataBase: String;
begin
  Result := FDataBase;

end;

function TFireBird.GetDriverDataBase: String;
begin
  Result := FDriverDataBase;

end;

function TFireBird.GetPorta: Integer;
begin
  Result := FPorta;

end;

function TFireBird.GetSenha: String;
begin
  Result := FSenha;

end;

function TFireBird.GetServidor: String;
begin
  Result := FServidor;

end;

function TFireBird.GetSGDB: String;
begin
  Result := FSGDB;

end;

function TFireBird.GetUsuario: String;
begin
  Result := FUsuario;

end;

procedure TFireBird.SetDataBase(AValue: String);
begin
  FDataBase := AValue;

end;

procedure TFireBird.SetDriverDataBase(AValue: String);
begin
  FDriverDataBase := AValue;

end;

procedure TFireBird.SetPorta(AValue: Integer);
begin
  FPorta := AValue;

end;

procedure TFireBird.SetSenha(AValue: String);
begin
  FSenha := AValue;

end;

procedure TFireBird.SetServidor(AValue: String);
begin
  FServidor := AValue;

end;

procedure TFireBird.SetSGDB(AValue: String);
begin
  FSGDB := AValue;

end;

procedure TFireBird.SetUsuario(AValue: String);
begin
  FUsuario := AValue;

end;

end.
