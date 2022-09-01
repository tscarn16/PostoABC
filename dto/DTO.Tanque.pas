unit DTO.Tanque;

interface

uses Generics.Collections, uRTTI.Mapping.Attributes,
  uTipos;

type
  [Tabela('Tanques', 'Tanques')]
  TTanque = class
    private
      FId: Integer;
      FCodigo: String;
      FDescricao: String;
      FId_Combustivel: Integer;

    protected
      function GetId: Integer;
      function GetCodigo: String;
      function GetDescricao: String;
      function GetId_Combustivel: Integer;

      procedure SetId(AValue: Integer);
      procedure SetCodigo(Avalue: String);
      procedure SetDescricao(AValue: String);
      procedure SetId_Combustivel(AValue: Integer);

    public
      constructor Create;

    published
      [Coluna('Id', tpctInteger, tpcPrimaryKey, '', 'Id', 'GEN_TANQUES_ID', '', '', '')]
      property Id: Integer read GetId write SetId;

      [Coluna('Codigo', tpctString, tpcField, '', 'Código', '', '', '', '')]
      property Codigo: String read GetCodigo write SetCodigo;

      [Coluna('Descricao', tpctString, tpcField, '', 'Descrição', '', '', '', '')]
      property Descricao: String read GetDescricao write SetDescricao;

      [Coluna('Id_Combustivel', tpctInteger, tcpForeingKey, '', 'Combustível', 'Combustiveis', 'Id_Combustivel', '', '')]
      property Id_Combustivel: Integer read GetId_Combustivel write SetId_Combustivel;

  end;

implementation

{ TTanque }

constructor TTanque.Create;
begin
  FId        := -1;
  FCodigo    := '';
  FDescricao := '';

end;

function TTanque.GetCodigo: String;
begin
  Result := FCodigo;

end;

function TTanque.GetDescricao: String;
begin
  Result := FDescricao;

end;

function TTanque.GetId: Integer;
begin
  Result := FId;

end;

function TTanque.GetId_Combustivel: Integer;
begin
  Result := FId_Combustivel;

end;

procedure TTanque.SetCodigo(Avalue: String);
begin
  FCodigo := AValue;

end;

procedure TTanque.SetDescricao(AValue: String);
begin
  FDescricao := AValue;

end;

procedure TTanque.SetId(AValue: Integer);
begin
  FId := AValue;

end;

procedure TTanque.SetId_Combustivel(AValue: Integer);
begin
  FId_Combustivel := AValue;

end;

end.
