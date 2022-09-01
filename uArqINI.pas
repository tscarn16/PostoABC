unit uArqINI;

interface

uses SysUtils, IniFiles,

  uDatabase.Connection,

  uDatabase.Firebird, uDatabase.SQLite,

  uIDatabase;

type
  TConexao = class
    protected
      FArqIni: TIniFile;

      FBancoDeDados: String;
      FServidor: String;
      FPorta: Integer;
      FUsuario: String;
      FSenha: String;
      FDataBase: String;
      FSGDB: IDatabase;

    private
      function GetBancoDeDados: String;
      function GetServidor: String;
      function GetPorta: Integer;
      function GetUsuario: String;
      function GetSenha: String;
      function GetDataBase: String;
      function GetSGDB: IDatabase;

      procedure SetBancoDeDados(const AValue: String);
      procedure SetServidor(const AValue: string);
      procedure SetPorta(const AValue: integer);
      procedure SetUsuario(const AValue: string);
      procedure SetSenha(const AValue: string);
      procedure SetDataBase(const AValue: String);
      procedure SetSGDB(const AValue: IDatabase);

    public
      property BancoDeDados: String read GetBancoDeDados write SetBancoDeDados;
      property Servidor: string read GetServidor write SetServidor;
      property Porta: integer read GetPorta write SetPorta;
      property Usuario: string read GetUsuario write SetUsuario;
      property Senha: string read GetSenha write SetSenha;
      property DataBase: String read GetDataBase write SetDataBase;
      property SGDB: IDatabase read GetSGDB write SetSGDB;

      constructor Create(AArqIni: TIniFile);

  end;

  TArqINI = class
  protected
    FArqIni: TIniFile;

    FConexao: TConexao;

  private
    function GetConexao: TConexao;

    procedure SetConexao(Value: TConexao);

  public
    property Conexao: TConexao read GetConexao write SetConexao;

    constructor Create;

end;

implementation

{$REGION '  TConexao'}
{ TConexao }
constructor TConexao.Create(AArqIni: TIniFile);
begin
  FArqIni := AArqIni;

  FBancoDeDados := GetBancoDeDados; //FArqIni.ReadString('CONEXAO', 'Servidor', FServidor);
  FServidor     := GetServidor;     //FArqIni.ReadString('CONEXAO', 'Servidor', FServidor);
  FPorta        := GetPorta;        //FArqIni.ReadInteger('CONEXAO', 'Porta', FPorta);
  FUsuario      := GetUsuario;      //FArqIni.ReadString('CONEXAO', 'Usuario', FUsuario);
  FSenha        := GetSenha;        //FArqIni.ReadString('CONEXAO', 'Senha', FSenha);
  FDataBase     := GetDataBase;     //FArqIni.ReadString('CONEXAO', 'DataBase', FDataBase);

end;

function TConexao.GetBancoDeDados: String;
begin
  Result := FArqIni.ReadString('CONEXAO', 'Servidor', FServidor);

end;

function TConexao.GetServidor: String;
begin
  Result := FArqIni.ReadString('CONEXAO', 'Servidor', FServidor);

end;

function TConexao.GetSGDB: IDatabase;
var
  strDatabase: String;
begin
  strDatabase := FArqIni.ReadString('CONEXAO', 'SGDB', strDatabase);

  if strDatabase = 'Firebird' then
    Result := TFireBird.Create
  else if strDatabase = 'SQLite' then
    Result := TSQLite.Create;

  Result.Servidor := FServidor;
  Result.DataBase := FDataBase;
  Result.Porta    := FPorta;
  Result.Usuario  := FUsuario;
  Result.Senha    := FSenha;

end;

function TConexao.GetPorta: Integer;
begin
  Result := FArqIni.ReadInteger('CONEXAO', 'Porta', FPorta);

end;

function TConexao.GetUsuario: String;
begin
  Result := FArqIni.ReadString('CONEXAO', 'Usuario', FUsuario);

end;

function TConexao.GetSenha: String;
begin
  Result := FArqIni.ReadString('CONEXAO', 'Senha', FSenha);

end;

function TConexao.GetDataBase: String;
begin
  Result := FArqIni.ReadString('CONEXAO', 'Database', FDatabase);

end;

procedure TConexao.SetBancoDeDados(const AValue: String);
begin
    FBancoDeDados := AValue;

end;

procedure TConexao.SetServidor(const AValue: String);
begin
  FArqIni.WriteString('CONEXAO', 'Servdor', AValue);

end;

procedure TConexao.SetSGDB(const AValue: IDatabase);
begin
  FSGDB := AValue;

end;

procedure TConexao.SetPorta(const AValue: Integer);
begin
  FArqIni.WriteInteger('CONEXAO', 'Porta', AValue);

end;

procedure TConexao.SetUsuario(const AValue: String);
begin
  FArqIni.WriteString('CONEXAO', 'Usuario', AValue);

end;

procedure TConexao.SetSenha(const AValue: String);
begin
  FArqIni.WriteString('CONEXAO', 'Senha', AValue);

end;


procedure TConexao.SetDataBase(const AValue: String);
begin
  FArqIni.WriteString('CONEXAO', 'DataBase', AValue);

end;

{$ENDREGION}

{$REGION '  TArqINI'}
function TArqINI.GetConexao: TConexao;
begin
  Result := FConexao;

end;

procedure TArqINI.SetConexao(Value: TConexao);
begin
  FConexao := Value;

end;

constructor TArqINI.Create;
begin
  FArqIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'PostoABC.ini');

  FConexao := TConexao.Create(FArqIni);

end;

{$ENDREGION}

end.

