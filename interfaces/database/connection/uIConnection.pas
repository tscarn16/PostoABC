unit uIConnection;

interface

uses uTipos, uIDataBase;

type
  IConnection = interface ['{B0F66C09-77E2-4C5E-ADBE-9386BFA22CC3}']
    function GetDataBase: IDataBase;

    procedure SetDataBase(const AValue: IDataBase);

    procedure Prepare;
    procedure Open;

    property DataBase: IDataBase read GetDataBase write SetDataBase;

  end;

implementation

end.
