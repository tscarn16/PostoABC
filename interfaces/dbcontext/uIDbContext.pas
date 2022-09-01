unit uIDbContext;

interface

uses Generics.Collections, Classes, Datasnap.DBClient;

type
  IDbContext<T: class> = interface ['{48003E90-2F68-4F48-A877-7846AE943AE5}']

    function GetCds: TClientDataSet;

    function GetSQL: String;

    function ToList: TObjectList<T>;
    function ToCds: TClientDataSet;

    property Cds: TClientDataSet read GetCds;

  end;

implementation

end.

