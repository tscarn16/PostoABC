unit uIDatabase;

interface

type
  IDataBase = interface ['{B151E490-E031-4FFA-A0C9-749EC296ED93}']
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

    property DriverDataBase: String read GetDriverDataBase write SetDriverDataBase;
    property Servidor: String read GetServidor write SetServidor;
    property Porta: Integer read GetPorta write SetPorta;
    property Usuario: String read GetUsuario write SetUsuario;
    property Senha: String read GetSenha write SetSenha;
    property DataBase: String read GetDataBase write SetDataBase;
    property SGDB: String read GetSGDB write SetSGDB;

  end;

implementation

end.
