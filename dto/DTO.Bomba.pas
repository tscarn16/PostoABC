unit DTO.Bomba;

interface

uses Generics.Collections, uRTTI.Mapping.Attributes,

  uTipos,

  DTO.Tanque;

type
  [Tabela('Bombas', 'Bombas')]
  TBomba = class
    private
      FId: Integer;
      FCodigo: String;
      FDescricao: String;
      FId_Tanque: Integer;

    protected
      function GetId: Integer;
      function GetCodigo: String;
      function GetDescricao: String;
      function GetId_Tanque: Integer;

      procedure SetId(AValue: Integer);
      procedure SetCodigo(Avalue: String);
      procedure SetDescricao(AValue: String);
      procedure SetId_Tanque(AValue: Integer);

    public
      constructor Create;

    published
      [Coluna('Id', tpctInteger, tpcPrimaryKey, '', 'Id', 'GEN_TANQUES_ID', '', '', '')]
      property Id: Integer read GetId write SetId;

      [Coluna('Codigo', tpctString, tpcField, '', 'Código', '', '', '', '')]
      property Codigo: String read GetCodigo write SetCodigo;

      [Coluna('Descricao', tpctString, tpcField, '', 'Descrição', '', '', '', '')]
      property Descricao: String read GetDescricao write SetDescricao;

      [Coluna('Id_Tanque', tpctInteger, tcpForeingKey, '', 'Descrição', 'Tanques', 'Id_Tanque', '', '')]
      property Id_Tanque: Integer read GetId_Tanque write SetId_Tanque;

  end;

implementation

{ TBomba }

constructor TBomba.Create;
begin
  FId        := -1;
  FCodigo    := '';
  FDescricao := '';
  FId_Tanque := -1;

end;

function TBomba.GetCodigo: String;
begin
  Result := FCodigo;

end;

function TBomba.GetDescricao: String;
begin
  Result := FDescricao;

end;

function TBomba.GetId: Integer;
begin
  Result := FId;

end;

function TBomba.GetId_Tanque: Integer;
begin
  Result := FId_Tanque;

end;

procedure TBomba.SetCodigo(Avalue: String);
begin
  FCodigo := AValue;

end;

procedure TBomba.SetDescricao(AValue: String);
begin
  FDescricao := AValue;

end;

procedure TBomba.SetId(AValue: Integer);
begin
  FId := AValue;

end;

procedure TBomba.SetId_Tanque(AValue: Integer);
begin
  FId_Tanque := AValue;

end;

end.
