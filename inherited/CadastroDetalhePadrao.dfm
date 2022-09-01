inherited frmCadastroDetalhePadrao: TfrmCadastroDetalhePadrao
  ClientHeight = 250
  ClientWidth = 471
  ExplicitWidth = 487
  ExplicitHeight = 289
  PixelsPerInch = 96
  TextHeight = 13
  object frmCadastroDetalhePadrao: TPanel
    Left = 0
    Top = 0
    Width = 471
    Height = 250
    Align = alClient
    TabOrder = 0
    object lblCodigo: TLabel
      Left = 15
      Top = 14
      Width = 38
      Height = 13
      Caption = 'C'#243'digo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel3: TPanel
      Left = 1
      Top = 219
      Width = 469
      Height = 30
      Align = alBottom
      TabOrder = 0
      object btnGravar: TSpeedButton
        Left = 180
        Top = 1
        Width = 115
        Height = 28
        Action = actGravar
        Align = alRight
        ExplicitLeft = 186
      end
      object btnCancelar: TSpeedButton
        Left = 319
        Top = 1
        Width = 115
        Height = 28
        Action = actCancelar
        Align = alRight
        ExplicitLeft = 325
      end
      object Separador2: TPanel
        Left = 295
        Top = 1
        Width = 24
        Height = 28
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
      end
      object Panel4: TPanel
        Left = 434
        Top = 1
        Width = 34
        Height = 28
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
      end
    end
    object edtCodigo: TDBEdit
      Left = 15
      Top = 33
      Width = 121
      Height = 21
      DataField = 'Codigo'
      DataSource = DataDetalhes
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object DataDetalhes: TDataSource
    Left = 40
    Top = 221
  end
  object Action: TActionList
    Left = 383
    Top = 119
    object actGravar: TAction
      Category = 'Cadastro'
      Caption = 'F9 | Confirmar'
      ImageIndex = 5
      ShortCut = 120
      OnExecute = actGravarExecute
    end
    object actCancelar: TAction
      Category = 'Cadastro'
      Caption = 'F12 | Cancelar'
      ImageIndex = 6
      ShortCut = 123
      OnExecute = actCancelarExecute
    end
  end
end
