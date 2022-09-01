unit DTO.Combustivel;

interface

uses Generics.Collections, uRTTI.Mapping.Attributes,
  uTipos;

type
  [Tabela('Combustiveis', 'Combustíveis')]
  TCombustivel = class
    private
      FId: Integer;
      FCodigo: String;
      FDescricao: String;

    protected
      function GetId: Integer;
      function GetCodigo: String;
      function GetDescricao: String;

      procedure SetId(AValue: Integer);
      procedure SetCodigo(Avalue: String);
      procedure SetDescricao(AValue: String);

    public
      constructor Create;

    published
      [Coluna('Id', tpctInteger, tpcPrimaryKey, '', 'Id', 'GEN_COMBUSTIVEIS_ID', '', '', '')]
      property Id: Integer read GetId write SetId;

      [Coluna('Codigo', tpctString, tpcField, '', 'Código', '', '', '', '')]
      property Codigo: String read GetCodigo write SetCodigo;

      [Coluna('Descricao', tpctString, tpcField, '', 'Descrição', '', '', '', '')]
      property Descricao: String read GetDescricao write SetDescricao;

  end;

implementation

{ TTanque }

constructor TCombustivel.Create;
begin
  FId        := -1;
  FCodigo    := '';
  FDescricao := '';

end;

function TCombustivel.GetCodigo: String;
begin
  Result := FCodigo;

end;

function TCombustivel.GetDescricao: String;
begin
  Result := FDescricao;

end;

function TCombustivel.GetId: Integer;
begin
  Result := FId;

end;

procedure TCombustivel.SetCodigo(Avalue: String);
begin
  FCodigo := AValue;

end;

procedure TCombustivel.SetDescricao(AValue: String);
begin
  FDescricao := AValue;

end;

procedure TCombustivel.SetId(AValue: Integer);
begin
  FId := AValue;

end;

end.
