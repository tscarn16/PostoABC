unit uDatabase.Factory;

interface

uses uIDatabase,
  uDatabase.Firebird;

type
  FactoryDatabase = class
    class function CreateFirebid: IDatabase;
    class function CreateSQLite: IDatabase;

  end;

implementation

{ Factory }

class function FactoryDatabase.CreateFirebid: IDatabase;
begin
  Result := TFireBird.Create;

end;

class function FactoryDatabase.CreateSQLite: IDatabase;
begin
  Result := TSQLite.Create;

end;

end.
