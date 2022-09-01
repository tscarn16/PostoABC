unit uHelper;

interface

uses uTipos, uArqINI,
  uHelper.Funcoes, uHelper.RTTI;

type
  Helper = class
    private
      class var FArqINI: TArqINI;

    public
      class function ArqINI: TArqINI;
      class function Funcoes: TFuncoesClass;
      class function RTTI: TRTTIClass;

  end;

implementation

{ Helper }

class function Helper.ArqINI: TArqINI;
begin
  if not Assigned(FArqINI) then
    FArqINI := TArqINI.Create;

  Result := FArqINI;

end;

class function Helper.Funcoes: TFuncoesClass;
begin
  Result := TFuncoes;

end;

class function Helper.RTTI: TRTTIClass;
begin
  Result := TRTTI;

end;

initialization

finalization

end.
