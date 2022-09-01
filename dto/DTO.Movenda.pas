unit DTO.Movenda;

interface

uses Generics.Collections, uRTTI.Mapping.Attributes,

  uTipos;

type
  [Tabela('Movenda', 'Movimento de Venda')]
  TMovenda = class
    private
      FId: Integer;
      FData: TDateTime;

    protected
      function GetId: Integer;
      function GetData: TDateTime;

      procedure SetId(AValue: Integer);
      procedure SetData(AValue: TDateTime);

    public
      constructor Create;

    published
      [Coluna('Id', tpctInteger, tpcPrimaryKey, '', 'Id', 'GEN_MOVENDA_ID', '', '', '')]
      property Id: Integer read GetId write SetId;

      [Coluna('Data', tpctDateTime, tpcField, '', 'Data', '', '', '', '')]
      property Data: TDateTime read GetData write SetData;

  end;

implementation

{ TBomba }

constructor TMovenda.Create;
begin
  FId   := -1;
  FData := -1;

end;

function TMovenda.GetData: TDateTime;
begin
  Result := FData;

end;

function TMovenda.GetId: Integer;
begin
  Result := FId;

end;

procedure TMovenda.SetData(AValue: TDateTime);
begin
  FData := AValue;

end;

procedure TMovenda.SetId(AValue: Integer);
begin
  FId := AValue;

end;

end.
