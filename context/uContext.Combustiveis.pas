unit uContext.Combustiveis;

interface

uses Generics.Collections, Datasnap.DBClient, Windows,
  uIDbContext, uDatabase.DbContext, uIDataBase, Vcl.Dialogs,

  uRTTI.Mapping.Attributes,

  Rtti, TypInfo,

  uHelper,

  DTO.Combustivel, uHelper.Funcoes;

type
  TCOmbustiveisContext<T: class> = class(TDbContext<TCombustivel>)

  end;

implementation

{ TTanquesContext }

end.
