unit uHelper.RTTI;

interface

uses Classes, SysUtils, Data.DB, Rtti, TypInfo, uRTTI.Mapping.Attributes;

type
  TRTTI = class
    class function NomeTabela(RttiContext: TRttiType): String;
    class function CamposTabela(RttiContext: TRttiType): String;

    class function GetPersistTabela(Obj: TRttiType): Tabela;
    class function GetPersistColuna(Obj: TRttiObject): Coluna;

    class procedure BindValue(RttiContext: TRttiType; AFiled: TField);

  end;

  TRTTIClass = Class of TRTTI;

implementation

{ TRTTI }

class procedure TRTTI.BindValue(RttiContext: TRttiType; AFiled: TField);
var
  prop: TRttiProperty;
  RttiColuna: Coluna;
  RttiColunaProp: TRttiProperty;
begin
    for RttiColunaProp in RttiContext.GetProperties do
    begin
      RttiColuna := GetPersistColuna(RttiColunaProp);

      if RttiColuna is Coluna then
        if UpperCase(Coluna(RttiColuna).Nome) = UpperCase(AFiled.FieldName) then
          prop.SetValue(Self, TValue.From(AFiled.AsString))

    end;

end;

class function TRTTI.CamposTabela(RttiContext: TRttiType): String;
var
  RttiColuna: Coluna;
  RttiColunaProp: TRttiProperty;
begin
  try
    for RttiColunaProp in RttiContext.GetProperties do
    begin
      RttiColuna := GetPersistColuna(RttiColunaProp);
      if RttiColuna is Coluna then
        Result := Result + Coluna(RttiColuna).Nome + ', ';

    end;

  finally
    Result := Copy(Result, 0, UTF8IdentLength(Result) -2)

  end;

end;

class function TRTTI.GetPersistColuna(Obj: TRttiObject): Coluna;
var
  Atrib: TCustomAttribute;
begin
  Result := Nil;

  for Atrib in Obj.GetAttributes do
  begin
    if Atrib is Coluna then
    begin
      Result := Coluna(Atrib);
      break;

    end;

  end;

end;

class function TRTTI.GetPersistTabela(Obj: TRttiType): Tabela;
var
  Atrib: TCustomAttribute;
begin
  Result := Nil;

  for Atrib in Obj.GetAttributes do
  begin
    if Atrib is Tabela then
    begin
      Result := Tabela(Atrib);
      break;

    end;

  end;

end;

class function TRTTI.NomeTabela(RttiContext: TRttiType): String;
var
  RttiTabela: Tabela;
begin
  try
    RttiTabela := GetPersistTabela(RttiContext);
    if RttiTabela is Tabela then
      Result := (Tabela(RttiTabela).Nome);

  finally

  end;

end;

end.
