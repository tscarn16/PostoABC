unit uRTTI.Mapping.Attributes;

interface

uses Generics.Collections, Data.DB, Classes, SysUtils,
  Rtti, TypInfo,
  uTipos;

type
  TTabela = class

  end;

  Tabela = class(TCustomAttribute)
  private
    FNome: String;
    FDescricao: String;

  public
    constructor Create(Const ANome: String; Const ADescricao: String); overload;

    property Nome: String read FNome write FNome;
    property Descricao: String read FDescricao write FDescricao;

  end;

  Coluna = class(TCustomAttribute)
  private
    FNome: String;
    FTipo: tpCampoTabela;
    FConstraint: tpConstraint;
    FValorDefault: String;
    FDescricao: String;
    FForeingKey: String;
    FTabelaFK: String;
    FCampoFK: String;
    FSequence: String;

  public
    constructor Create(const ANome: String;
                       const ATipo: tpCampoTabela;
                       const AConstraint: tpConstraint;
                       const AValorDefault: String;
                       const ADescricao: String;
                       const ASequence: String;
                       const AForeingKey: String;
                       const ATabelaFK: String;
                       const ACampoFK: String); overload;

    property Nome: String read FNome write FNome;
    property Tipo: tpCampoTabela read FTipo write FTipo;
    property Constraint: tpConstraint read FConstraint write FConstraint;
    property ValorDefault: String read FValorDefault write FValorDefault;
    property Descricao: String read FDescricao write FDescricao;
    property ForeingKey: String read FForeingKey write FForeingKey;
    property TabelaFK: String read FTabelaFK write FTabelaFK;
    property CampoFK: String read FCampoFK write FCampoFK;
    property Sequence: String read FSequence write FSequence;

  end;

implementation

{ Tabela }

constructor Tabela.Create(const ANome, ADescricao: String);
begin
  FNome := ANome;
  FDescricao := ADescricao;

end;

{ Coluna }

constructor Coluna.Create(const ANome: String; const ATipo: tpCampoTabela;
  const AConstraint: tpConstraint; const AValorDefault: String;
  const ADescricao, ASequence, AForeingKey, ATabelaFK, ACampoFK: String);
begin
  FNome := ANome;
  FTipo := ATipo;
  FConstraint := AConstraint;
  FValorDefault := AValorDefault;
  FDescricao := ADescricao;
  FSequence := ASequence;
  FForeingKey := AForeingKey;
  FTabelaFK := ATabelaFK;
  FCampoFK := ACampoFK;

end;

end.
