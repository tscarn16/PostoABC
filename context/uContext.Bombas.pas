unit uContext.Bombas;

interface

uses Generics.Collections, Datasnap.DBClient, Windows,
  uIDbContext, uDatabase.DbContext, uIDataBase, Vcl.Dialogs,

  uRTTI.Mapping.Attributes,

  Rtti, TypInfo,

  uHelper,

  DTO.Bomba, uHelper.Funcoes;

type
  TBombasContext<T: class> = class(TDbContext<TBomba>)

  end;

implementation

{ TTanquesContext }

end.
