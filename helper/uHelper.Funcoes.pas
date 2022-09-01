unit uHelper.Funcoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, ActnList, Data.DB, Datasnap.DBClient,
  Provider, DBGrids, StrUtils, Math, SqlExpr, FireDAC.Comp.Client,
  uDatabase.Connection,

  uTipos;

type
  TFuncoes = class
    class procedure Avisa(Mensagem: String; Titulo: String = 'Aviso'; Flags: Integer = 0); Overload;
    class procedure AvisaErro(Mensagem: string; Titulo: String = 'Erro');

    class function Confirma(Mensagem: String; Titulo: String = 'Informação'; Btn: Integer = MB_DEFBUTTON1): Boolean;

    class procedure CreateAndShowModal(ClassForm: TFormClass; var NewForm);

    class procedure StartTrans(Transacao: TFDTransaction);
    class procedure CommitTrans(Transacao: TFDTransaction);
    class procedure RollbackTrans(Transacao: TFDTransaction);

    class procedure FillCds(out Cds: TClientDataSet; StrSQL: String; Connection: TConnection); overload;
    class procedure FillCds(out Cds: TClientDataSet; StrSQL: String; Connection: TFDConnection); overload;
    class function FillCds(StrSQL: String; Connection: TFDConnection): TClientDataSet; overload;

    class procedure ExecutaSql(StrSQL: String; Connection: TConnection);

    class function GetValGenerator(pGenerator: String; Connection: TFDConnection): Integer;
    class function GetValCampoInt(pStrSQL: String; Default: Integer; Connection: TFDConnection): Integer;
    class function GetValCampoStr(pStrSQL: String; Connection: TFDConnection): String;

    class procedure PesqProdutoServico(Valor: String; Cds: TClientDataSet; vTipoPesquisa: TTipoPesquisa);

  end;

  TFuncoesClass = Class of  TFuncoes;

implementation

{ Funcoes }

class procedure TFuncoes.Avisa(Mensagem, Titulo: String; Flags: Integer);
begin
  Application.MessageBox(Pchar(Mensagem), Pchar(Titulo), Flags);

end;

class procedure TFuncoes.AvisaErro(Mensagem, Titulo: String);
begin
  Application.MessageBox(Pchar(Mensagem), Pchar(Titulo), MB_OK + MB_ICONERROR + MB_DEFBUTTON1 + MB_TOPMOST + MB_APPLMODAL);

end;

class procedure TFuncoes.CommitTrans(Transacao: TFDTransaction);
begin
  Transacao.Commit;

end;

class function TFuncoes.Confirma(Mensagem, Titulo: String; Btn: Integer): Boolean;
begin
  Result := (Application.MessageBox(Pchar(Mensagem), Pchar(Titulo), MB_YESNO + MB_ICONQUESTION + Btn + MB_TOPMOST+MB_APPLMODAL) = ID_YES);

end;

class procedure TFuncoes.CreateAndShowModal(ClassForm: TFormClass; var NewForm);
var
  Instance: TForm;
begin
  Instance := TForm(ClassForm.NewInstance);
  TForm(NewForm) := Instance;
  try
    Instance.Create(nil);
    with Instance do
    begin
      ShowModal;
    end;
  finally
    FreeAndNil(Instance);
  end;

end;

class procedure TFuncoes.FillCds(out Cds: TClientDataSet; StrSQL: String; Connection: TConnection);
var
  q: TFDQuery;
  p: TDataSetProvider;
  I: Integer;
Begin
  try
    q := TFDQuery.Create(nil);
    if (Cds = nil) then
      Cds := TClientDataSet.Create(q);

    Screen.cursor := crSQLWait;

    q.Connection := Connection.Conexao;

    q.SQL.Text := LowerCase(StrSQL);

    p := TDataSetProvider.Create(q);

    p.DataSet := q;
    p.Options := p.Options + [poRetainServerOrder];

    Cds.Close;
    Cds.Data := p.Data;
    Cds.Open;

    for i := 0 to Cds.Fields.Count -1 do
    begin
      if (pfInUpdate in Cds.Fields[I].ProviderFlags) or (pfInWhere in Cds.Fields[I].ProviderFlags) or
         (pfInKey in Cds.Fields[I].ProviderFlags) or (pfHidden in Cds.Fields[I].ProviderFlags) then
        Cds.Fields[i].ProviderFlags := [pfInUpdate, pfInWhere];

      Cds.Fields[i].Required := False;
      Cds.Fields[i].ReadOnly := False;
    end;

    Cds.LogChanges := False;

  finally
    Screen.cursor := crDefault;
  end;

end;

class procedure TFuncoes.PesqProdutoServico(Valor: String; Cds: TClientDataSet; vTipoPesquisa: TTipoPesquisa);
begin

end;

class procedure TFuncoes.RollbackTrans(Transacao: TFDTransaction);
begin
  Transacao.Rollback;

end;

class procedure TFuncoes.StartTrans(Transacao: TFDTransaction);
begin
  Transacao.StartTransaction;

end;

class procedure TFuncoes.ExecutaSql(StrSQL: String; Connection: TConnection);
var
  q: TFDQuery;
begin
  try
    q := TFDQuery.Create(nil);
    q.Connection := Connection.Conexao;
    q.SQL.Text := StrSQL;

    q.ExecSQL;
  finally
    FreeAndNil(q);

  end;

end;

class procedure TFuncoes.FillCds(out Cds: TClientDataSet; StrSQL: String; Connection: TFDConnection);
var
  q: TFDQuery;
  p: TDataSetProvider;
  I: Integer;
Begin
  try
    q := TFDQuery.Create(nil);
    if (Cds = nil) then
      Cds := TClientDataSet.Create(q);

    Screen.cursor := crSQLWait;

    q.Connection := Connection;

    q.SQL.Text := LowerCase(StrSQL);

    p := TDataSetProvider.Create(q);

    p.DataSet := q;
    p.Options := p.Options + [poRetainServerOrder];

    Cds.Close;
    Cds.Data := p.Data;
    Cds.Open;

    for i := 0 to Cds.Fields.Count -1 do
    begin
      if (pfInUpdate in Cds.Fields[I].ProviderFlags) or (pfInWhere in Cds.Fields[I].ProviderFlags) or
         (pfInKey in Cds.Fields[I].ProviderFlags) or (pfHidden in Cds.Fields[I].ProviderFlags) then
        Cds.Fields[i].ProviderFlags := [pfInUpdate, pfInWhere];

      Cds.Fields[i].Required := False;
      Cds.Fields[i].ReadOnly := False;
    end;

    Cds.LogChanges := False;

  finally
    Screen.cursor := crDefault;
  end;
end;

class function TFuncoes.FillCds(StrSQL: String; Connection: TFDConnection): TClientDataSet;
var
  q: TFDQuery;
  p: TDataSetProvider;
  I: Integer;
Begin
  try
    Connection.Close;
    Connection.Open;

    q := TFDQuery.Create(nil);
    Result := TClientDataSet.Create(q);

    Screen.cursor := crSQLWait;

    q.Connection := Connection;

    q.SQL.Text := Trim(StrSQL);

    p := TDataSetProvider.Create(q);

    p.DataSet := q;
    p.Options := p.Options + [poRetainServerOrder];

    Result.Close;
    Result.Data := p.Data;
    Result.Open;

    for i := 0 to Result.Fields.Count -1 do
    begin
      if (pfInUpdate in Result.Fields[I].ProviderFlags) or (pfInWhere in Result.Fields[I].ProviderFlags) or
         (pfInKey in Result.Fields[I].ProviderFlags) or (pfHidden in Result.Fields[I].ProviderFlags) then
        Result.Fields[i].ProviderFlags := [pfInUpdate, pfInWhere];

      Result.Fields[i].Required := False;
      Result.Fields[i].ReadOnly := False;
    end;

    Result.LogChanges := False;

  finally
    Screen.cursor := crDefault;
  end;

end;

class function TFuncoes.GetValCampoInt(pStrSQL: String; Default: Integer; Connection: TFDConnection): Integer;
var
  Cds: TClientDataSet;
begin
  Cds := TClientDataSet.Create(nil);

  Try
    FillCds(Cds, pStrSQL, Connection);

    if Cds.RecordCount > 0 then
      Result := Cds.Fields.FieldByNumber(1).AsInteger

    else
      Result := Default;

  Finally
    FreeAndNil(Cds);

  End;

end;

class function TFuncoes.GetValCampoStr(pStrSQL: String; Connection: TFDConnection): String;
var
  Cds: TClientDataSet;
begin
  Cds := TClientDataSet.Create(nil);

  Try
    FillCds(Cds, pStrSQL, Connection);
    Result := Cds.Fields.FieldByNumber(1).AsString;

  Finally
    FreeAndNil(Cds);

  End;

end;

class function TFuncoes.GetValGenerator(pGenerator: String; Connection: TFDConnection): Integer;
var
  StrSQL: String;
begin
  if (Connection.DriverName = 'FB') then
    StrSQL := 'SELECT GEN_ID('+pGenerator+', 1) FROM RDB$DATABASE'
  else
    Avisa('SGDB não implementado');

  Result := GetValCampoInt(StrSQL, 1, Connection);

end;

end.
