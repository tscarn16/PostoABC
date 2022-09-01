unit uContext.Movenda_Item;

interface

uses Generics.Collections, Datasnap.DBClient, Windows,
  uIDbContext, uDatabase.DbContext, uIDataBase, Vcl.Dialogs,

  uRTTI.Mapping.Attributes,

  Rtti, TypInfo,

  uHelper,

  DTO.Movenda_Item, uHelper.Funcoes;

type
  TMovenda_ItemContext<T: class> = class(TDbContext<TMovenda_Item>)

  end;

implementation

{ TTanquesContext }

end.
