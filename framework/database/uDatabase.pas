unit uDatabase;

interface

uses uIDataBase;

type
  TDataBase = class(TInterfacedObject, IDataBase)
  protected
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

constructor TDataBase.Create;
begin
  FServidor := '';
  FPorta    := -1;
  FUsuario  := '';
  FSenha    := '';
  FDataBase := '';

end;

function TDataBase.GetDataBase: String;
begin
  Result := FDataBase;

end;

function TDataBase.GetDriverDataBase: String;
begin
  Result := FDriverDataBase;

end;

function TDataBase.GetPorta: Integer;
begin
  Result := FPorta;

end;

function TDataBase.GetSenha: String;
begin
  Result := FSenha;

end;

function TDataBase.GetServidor: String;
begin
  Result := FServidor;

end;

function TDataBase.GetSGDB: String;
begin
  Result := FSGDB;

end;

function TDataBase.GetUsuario: String;
begin
  Result := FUsuario;

end;

procedure TDataBase.SetDataBase(AValue: String);
begin
  FDataBase := AValue;

end;

procedure TDataBase.SetDriverDataBase(AValue: String);
begin
  FDriverDataBase := AValue;

end;

procedure TDataBase.SetPorta(AValue: Integer);
begin
  FPorta := AValue;

end;

procedure TDataBase.SetSenha(AValue: String);
begin
  FSenha := AValue;

end;

procedure TDataBase.SetServidor(AValue: String);
begin
  FServidor := AValue;

end;

procedure TDataBase.SetSGDB(AValue: String);
begin
  FSGDB := AValue;

end;

procedure TDataBase.SetUsuario(AValue: String);
begin
  FUsuario := AValue;

end;

end.
