unit uDbContext;

interface

uses Generics.Collections,
  uHelper,

  uContext.Tanques, uContext.Bombas, uContext.Combustiveis, uContext.Movenda,
  uContext.Movenda_Item,

  DTO.Tanque, DTO.Bomba, DTO.Combustivel, DTO.Movenda, DTO.Movenda_Item;

type
  DbContext = class
  public
    class function Tanques: TTanquesContext<DTO.Tanque.TTanque>;
    class function Bombas: TBombasContext<DTO.Bomba.TBomba>;
    class function Combustiveis: TCombustiveisContext<DTO.Combustivel.TCombustivel>;

    class function Movenda: TMovendaContext<DTO.Movenda.TMovenda>;
    class function Movenda_Item: TMovenda_ItemContext<DTO.Movenda_Item.TMovenda_Item>;


  end;

implementation

{ DbContext }

class function DbContext.Bombas: TBombasContext<DTO.Bomba.TBomba>;
begin
  Result := TBombasContext<TBomba>.Create(Helper.ArqINI.Conexao.SGDB);

end;

class function DbContext.Combustiveis: TCombustiveisContext<DTO.Combustivel.TCombustivel>;
begin
  Result := TCombustiveisContext<TCombustivel>.Create(Helper.ArqINI.Conexao.SGDB);

end;

class function DbContext.Movenda: TMovendaContext<DTO.Movenda.TMovenda>;
begin
  Result := TMovendaContext<TMovenda>.Create(Helper.ArqINI.Conexao.SGDB);

end;
//
class function DbContext.Movenda_Item: TMovenda_ItemContext<DTO.Movenda_Item.TMovenda_Item>;
begin
  Result := TMovenda_ItemContext<TMovenda_Item>.Create(Helper.ArqINI.Conexao.SGDB);

end;

class function DbContext.Tanques: TTanquesContext<DTO.Tanque.TTanque>;
begin
  Result := TTanquesContext<TTanque>.Create(Helper.ArqINI.Conexao.SGDB);

end;

end.
