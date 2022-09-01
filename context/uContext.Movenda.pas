unit uContext.Movenda;

interface

uses Generics.Collections, Datasnap.DBClient, Windows,
  uIDbContext, uDatabase.DbContext, uIDataBase, Vcl.Dialogs,

  uRTTI.Mapping.Attributes,

  Rtti, TypInfo,

  uHelper,

  DTO.Movenda, uHelper.Funcoes;

type
  TMovendaContext<T: class> = class(TDbContext<TMovenda>)

  end;

implementation

{ TTanquesContext }

end.
