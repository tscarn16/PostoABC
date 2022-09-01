unit uDatabase.DbContext;

interface

uses Generics.Collections, Datasnap.DBClient, System.Rtti, TypInfo, Dialogs,
  uIDBContext, uIConnection, uIDataBase, Data.DB, SysUtils, Variants,

  uTipos,

  uRTTI.Mapping.Attributes,

  uHelper,

  uDatabase.Connection;

type
  TDbContext<T: class> = class(TInterfacedObject, IDbContext<T>)
  private
    FCds: TClientDataset;
    function Instance: T;

    function CreateItemList: T;

  protected
    function GetCds: TClientDataSet;

    function GetSQL: String; overload;
    function GetSQL(Obj: T): String; overload;

    function GetUpdate(Obj: T): String;
    function GetDelete(Obj: T): String;
    function GetInsert(Obj: T): String;

    function RecuperaNomeTabela: String;
    function MontaCamposQuery: String;

  public
    Connection: TConnection;

    constructor Create(ADataBase: IDataBase);

    function FindAll: TDbContext<T>;
    function Find(Obj: T): TDbContext<T>;

    function Update(Obj: T): Boolean;
    function Delete(Obj: T): Boolean;
    function Insert(Obj: T): Boolean;

    function ToList: TObjectList<T>;
    function ToCds: TClientDataSet;

    property Cds: TClientDataSet read FCds;

  end;

implementation

{ TDbContext<T> }

constructor TDbContext<T>.Create(ADataBase: IDataBase);
begin
  Connection := TConnection.Create(ADataBase);
  Connection.Prepare;
  Connection.Open;

end;

function TDbContext<T>.CreateItemList: T;
var
  iFieldCount: Integer;
begin
  Result := Instance;

  for iFieldCount := 0 to FCds.FieldCount - 1 do
    SetPropValue(Result, FCds.Fields[iFieldCount].FieldName, FCds.Fields[iFieldCount].Value);

end;

function TDbContext<T>.Find(Obj: T): TDbContext<T>;
begin
  Helper.Funcoes.FillCds(FCds, GetSql(Obj), Connection);

end;

function TDbContext<T>.FindAll: TDbContext<T>;
var
  Obj: T;
begin
  Helper.Funcoes.FillCds(FCds, GetSql, Connection);

end;

function TDbContext<T>.GetCds: TClientDataSet;
begin
  Result := FCds;

end;

function TDbContext<T>.GetDelete(Obj: T): String;
var
  RttiCtx: TRttiContext;
  RttiColuna: Coluna;
  RttiColunaProp: TRttiProperty;
  sFields, sWhere: String;
begin
  try
    RttiCtx := TRttiContext.Create;

    for RttiColunaProp in RttiCtx.GetType(TypeInfo(T)).GetProperties do
    begin
      RttiColuna := Helper.RTTI.GetPersistColuna(RttiColunaProp);
      if RttiColuna is Coluna then
        case Coluna(RttiColuna).Constraint of
          tpcPrimaryKey:
          begin
            sWhere := sWhere + Coluna(RttiColuna).Nome + ' = ' + IntToStr(GetPropValue(Obj, Coluna(RttiColuna).Nome)) + ', '

          end;

        end;

    end;

    Result := 'DELETE FROM '+ RecuperaNomeTabela +' WHERE '+ sWhere;

    Result := Copy(Trim(Result), 0, Length(Trim(Result)) -1)

  finally
    RttiCtx.Free;

  end;

end;

function TDbContext<T>.GetInsert(Obj: T): String;
var
  RttiCtx: TRttiContext;
  RttiColuna: Coluna;
  RttiColunaProp: TRttiProperty;
  sFields, sValues: String;
begin
  try
    RttiCtx := TRttiContext.Create;

    for RttiColunaProp in RttiCtx.GetType(TypeInfo(T)).GetProperties do
    begin
      RttiColuna := Helper.RTTI.GetPersistColuna(RttiColunaProp);
      if RttiColuna is Coluna then
        case Coluna(RttiColuna).Constraint of
          tpcField:
          begin
            sFields := sFields + Coluna(RttiColuna).Nome + ', ';

            if Coluna(RttiColuna).Tipo = tpctString then
              sValues := sValues + QuotedStr(GetPropValue(Obj, Coluna(RttiColuna).Nome)) + ', '

            else if Coluna(RttiColuna).Tipo = tpctInteger then
              sValues := sValues + GetPropValue(Obj, Coluna(RttiColuna).Nome) + ', '

            else if Coluna(RttiColuna).Tipo = tpctDateTime then
              sValues := sValues + QuotedStr(FormatDateTime('dd.mm.yyyy',  GetPropValue(Obj, Coluna(RttiColuna).Nome))) + ', '

            else if Coluna(RttiColuna).Tipo = tpctDouble then
              sValues := sValues + FloatToStr(GetPropValue(Obj, Coluna(RttiColuna).Nome)) + ', '

            else if Coluna(RttiColuna).Tipo = tpctCurrency then
              sValues := sValues + StringReplace(VarToStr(GetPropValue(Obj, Coluna(RttiColuna).Nome)), ',', '.', [rfReplaceAll, rfIgnoreCase]) + ', ';

          end;
          tpcPrimaryKey:
          begin
            sFields := sFields + Coluna(RttiColuna).Nome + ', ';
            if GetPropValue(Obj, Coluna(RttiColuna).Nome) > 0 then
              sValues := sValues + VarToStr(GetPropValue(Obj, Coluna(RttiColuna).Nome)) + ', '
            else
              sValues := sValues + '(SELECT NEXT VALUE FOR '+ Coluna(RttiColuna).Sequence +' FROM RDB$DATABASE), '

          end;

          tcpForeingKey:
          begin
            sFields := sFields + Coluna(RttiColuna).Nome + ', ';
            sValues := sValues + VarToStr(GetPropValue(Obj, Coluna(RttiColuna).Nome)) + ', ';

          end;

        end;

    end;

    sFields := Copy(Trim(sFields), 0, Length(Trim(sFields))-1);
    sValues := Copy(Trim(sValues), 0, Length(Trim(sValues))-1);

    Result := 'INSERT INTO '+ RecuperaNomeTabela +
              ' ('+ sFields +') '+
              'VALUES'+
              ' ('+ sValues + ')';

  finally
    RttiCtx.Free;

  end;

end;

function TDbContext<T>.GetSQL(Obj: T): String;
var
  RttiCtx: TRttiContext;
  RttiColuna: Coluna;
  RttiColunaProp: TRttiProperty;
  sFields, sWhere, sInnerJoin: String;
begin
  try
    RttiCtx := TRttiContext.Create;

    for RttiColunaProp in RttiCtx.GetType(TypeInfo(T)).GetProperties do
    begin
      RttiColuna := Helper.RTTI.GetPersistColuna(RttiColunaProp);
      if RttiColuna is Coluna then
        case Coluna(RttiColuna).Constraint of
          tpcPrimaryKey:
          begin
            sWhere := sWhere + Coluna(RttiColuna).Nome + ' = ' + IntToStr(GetPropValue(Obj, Coluna(RttiColuna).Nome)) + ', '

          end;

        end;

    end;

    sFields := Copy(Trim(sFields), 0, Length(Trim(sFields))-1);
    sWhere := Copy(Trim(sWhere), 0, Length(Trim(sWhere))-1);

    Result := 'SELECT '+ MontaCamposQuery +
              '  FROM '+ RecuperaNomeTabela +' '+
              'WHERE ' + sWhere;

  finally
    RttiCtx.Free;

  end;

end;

function TDbContext<T>.GetSQL: String;
begin
  Result :=
    'SELECT '+ MontaCamposQuery +
    ' FROM ' + RecuperaNomeTabela;

end;

function TDbContext<T>.GetUpdate(Obj: T): String;
var
  RttiCtx: TRttiContext;
  RttiColuna: Coluna;
  RttiColunaProp: TRttiProperty;
  sFields, sWhere, sInnerJoin: String;
begin
  try
    RttiCtx := TRttiContext.Create;

    for RttiColunaProp in RttiCtx.GetType(TypeInfo(T)).GetProperties do
    begin
      RttiColuna := Helper.RTTI.GetPersistColuna(RttiColunaProp);
      if RttiColuna is Coluna then
        case Coluna(RttiColuna).Constraint of
          tpcPrimaryKey:
          begin
            sWhere := sWhere + Coluna(RttiColuna).Nome + ' = ' + IntToStr(GetPropValue(Obj, Coluna(RttiColuna).Nome)) + ', '

          end;
          tpcField:
          begin
            if Coluna(RttiColuna).Tipo = tpctString then
            begin
              sFields := sFields + Coluna(RttiColuna).Nome + ' = ' + QuotedStr(GetPropValue(Obj, Coluna(RttiColuna).Nome)) + ', '

            end else if Coluna(RttiColuna).Tipo = tpctInteger then
            begin
              sFields := sFields + Coluna(RttiColuna).Nome + ' = ' + IntToStr(GetPropValue(Obj, Coluna(RttiColuna).Nome)) + ', '

            end else if Coluna(RttiColuna).Tipo = tpctDateTime then
            begin
              sFields := sFields + Coluna(RttiColuna).Nome + ' = ' +
                QuotedStr(FormatDateTime('dd.mm.yyyy',  GetPropValue(Obj, Coluna(RttiColuna).Nome))) + ', '

            end else if Coluna(RttiColuna).Tipo = tpctCurrency then
            begin
              sFields := sFields + Coluna(RttiColuna).Nome + ' = ' + StringReplace(CurrToStr(GetPropValue(Obj, Coluna(RttiColuna).Nome)), ',', '.', [rfReplaceAll, rfIgnoreCase]) + ', ';

            end;
          end;
          tcpForeingKey:
          begin
              sFields := sFields + Coluna(RttiColuna).Nome + ' = ' + IntToStr(GetPropValue(Obj, Coluna(RttiColuna).Nome)) + ', '

          end;
        end;

    end;

    sFields := Copy(Trim(sFields), 0, Length(Trim(sFields))-1);
    sWhere := Copy(Trim(sWhere), 0, Length(Trim(sWhere))-1);

    Result := 'UPDATE '+ RecuperaNomeTabela + ' SET '+
                 sFields + ' ' +
              'WHERE ' + sWhere;

  finally
    RttiCtx.Free;

  end;

end;

function TDbContext<T>.Instance: T;
begin
  Result := T(GetTypeData(PTypeInfo(TypeInfo(T)))^.ClassType.Create);

end;

function TDbContext<T>.MontaCamposQuery: String;
var
  RttiCtx: TRttiContext;
begin
  try
    RttiCtx := TRttiContext.Create;

    Result := Helper.RTTI.CamposTabela(RttiCtx.GetType(TypeInfo(T)));

  finally
    RttiCtx.Free;

  end;

end;

function TDbContext<T>.RecuperaNomeTabela: String;
var
  RttiCtx: TRttiContext;
begin
  try
    RttiCtx := TRttiContext.Create;

    Result := Helper.RTTI.NomeTabela(RttiCtx.GetType(TypeInfo(T)));

  finally
    RttiCtx.Free;

  end;


end;

function TDbContext<T>.ToCds: TClientDataSet;
begin
  Result := FCds;

end;

function TDbContext<T>.ToList: TObjectList<T>;
begin
  Result := TObjectList<T>.Create;
  Helper.Funcoes.FillCds(FCds, GetSql, Connection);

  FCds.First;
  while Not(Cds.Eof) do
  begin
    Result.Add(CreateItemList);

    FCds.Next;

  end;

end;

function TDbContext<T>.Update(Obj: T): Boolean;
begin
  Helper.Funcoes.ExecutaSql(GetUpdate(Obj), Connection);

end;

function TDbContext<T>.Delete(Obj: T): Boolean;
begin
  Helper.Funcoes.ExecutaSql(GetDelete(Obj), Connection);

end;

function TDbContext<T>.Insert(Obj: T): Boolean;
begin
  Helper.Funcoes.ExecutaSql(GetInsert(Obj), Connection);

end;

end.

