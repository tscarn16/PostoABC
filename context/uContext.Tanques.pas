unit uContext.Tanques;

interface

uses Generics.Collections, Datasnap.DBClient, Windows,
  uIDbContext, uDatabase.DbContext, uIDataBase, Vcl.Dialogs,

  uHelper,
  DTO.Tanque, uHelper.Funcoes;

type
  TTanquesContext<T: class> = class(TDbContext<TTanque>)

  end;

implementation

{ TTanquesContext }

end.
