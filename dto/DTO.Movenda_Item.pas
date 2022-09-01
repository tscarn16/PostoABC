unit DTO.Movenda_Item;

interface

uses Generics.Collections, uRTTI.Mapping.Attributes,

  uTipos;

type
  [Tabela('Movenda_Item', 'Movimento de Itens de Venda')]
  TMovenda_Item = class
    private
      FId: Integer;
      FId_Movenda: Integer;
      FId_Bomba: Integer;
      FValor: Currency;
      FQtd: Double;
      FAliquota: Currency;
      FVr_Imposto: Currency;

    protected
      function GetId: Integer;
      function GetId_Movenda: Integer;
      function GetId_Bomba: Integer;
      function GetValor: Currency;
      function GetQtd: Double;
      function GetAliquota: Currency;
      function GetVr_Imposto: Currency;

      procedure SetId(AValue: Integer);
      procedure SetId_Movenda(AValue: Integer);
      procedure SetId_Bomba(AValue: Integer);
      procedure SetValor(AValue: Currency);
      procedure SetQtd(AValue: Double);
      procedure SetAliquota(AValue: Currency);
      procedure SetVr_Imposto(AValue: Currency);

    public
      constructor Create;

    published
      [Coluna('Id', tpctInteger, tpcPrimaryKey, '', 'Id', 'GEN_MOVENDA_ID', '', '', '')]
      property Id: Integer read GetId write SetId;

      [Coluna('Id_Movenda', tpctInteger, tcpForeingKey, '', 'Movimento', 'Movenda', 'Id_Movenda', '', '')]
      property Id_Movenda: Integer read GetId_Movenda write SetId_Movenda;

      [Coluna('Id_Bomba', tpctInteger, tcpForeingKey, '', 'Item de Venda', 'Movenda_Item', 'Id_Bomba', '', '')]
      property Id_Bomba: Integer read GetId_Bomba write SetId_Bomba;

      [Coluna('Valor', tpctCurrency, tpcField, '', 'Valor Unitário', '', '', '', '')]
      property Valor: Currency read GetValor write SetValor;

      [Coluna('Qtd', tpctDouble, tpcField, '', 'Quantidade', '', '', '', '')]
      property Qtd: Double read GetQtd write SetQtd;

      [Coluna('Aliquota', tpctCurrency, tpcField, '', 'Alíquota', '', '', '', '')]
      property Aliquota: Currency read GetAliquota write SetAliquota;

      [Coluna('Vr_Imposto', tpctCurrency, tpcField, '', 'Valor Imposto', '', '', '', '')]
      property Vr_Imposto: Currency read GetVr_Imposto write SetVr_Imposto;

  end;

implementation

{ TBomba }

constructor TMovenda_Item.Create;
begin
  FId        := -1;

end;

function TMovenda_Item.GetAliquota: Currency;
begin
  Result := FAliquota;

end;

function TMovenda_Item.GetId: Integer;
begin
  Result := FId;

end;
function TMovenda_Item.GetId_Bomba: Integer;
begin
  Result := FId_Bomba;

end;

function TMovenda_Item.GetId_Movenda: Integer;
begin
  Result := FId_Movenda;

end;

function TMovenda_Item.GetQtd: Double;
begin
  Result := FQtd;

end;

function TMovenda_Item.GetValor: Currency;
begin
  Result := FValor;

end;

function TMovenda_Item.GetVr_Imposto: Currency;
begin
  Result := FVr_Imposto;

end;

procedure TMovenda_Item.SetQtd(AValue: Double);
begin
  FQtd := AValue;

end;

procedure TMovenda_Item.SetAliquota(AValue: Currency);
begin
  FAliquota := AValue;

end;

procedure TMovenda_Item.SetId(AValue: Integer);
begin
  FId := AValue;

end;

procedure TMovenda_Item.SetId_Bomba(AValue: Integer);
begin
  FId_Bomba := AValue;

end;

procedure TMovenda_Item.SetId_Movenda(AValue: Integer);
begin
  FId_Movenda := AValue;

end;

procedure TMovenda_Item.SetValor(AValue: Currency);
begin
  FValor := AValue;

end;

procedure TMovenda_Item.SetVr_Imposto(AValue: Currency);
begin
  FVr_Imposto := AValue;

end;

end.
