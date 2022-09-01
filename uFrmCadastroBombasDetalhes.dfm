inherited frmCadastroBombasDetalhe: TfrmCadastroBombasDetalhe
  Caption = 'Cadastro de Bomba'
  ClientHeight = 164
  ClientWidth = 529
  OnShow = FormShow
  ExplicitWidth = 545
  ExplicitHeight = 203
  PixelsPerInch = 96
  TextHeight = 13
  inherited frmCadastroDetalhePadrao: TPanel
    Width = 529
    Height = 164
    ExplicitWidth = 529
    ExplicitHeight = 164
    object Label1: TLabel [1]
      Left = 15
      Top = 62
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label2: TLabel [2]
      Left = 296
      Top = 62
      Width = 36
      Height = 13
      Caption = 'Tanque'
    end
    inherited Panel3: TPanel
      Top = 133
      Width = 527
      ExplicitTop = 133
      ExplicitWidth = 527
      inherited btnGravar: TSpeedButton
        Left = 238
        ExplicitLeft = 238
      end
      inherited btnCancelar: TSpeedButton
        Left = 377
        ExplicitLeft = 377
      end
      inherited Separador2: TPanel
        Left = 353
        ExplicitLeft = 353
      end
      inherited Panel4: TPanel
        Left = 492
        ExplicitLeft = 492
      end
    end
    object edtDescricao: TDBEdit
      Left = 15
      Top = 81
      Width = 242
      Height = 21
      DataField = 'Descricao'
      DataSource = DataDetalhes
      TabOrder = 2
    end
    object cmbTanque: TDBLookupComboBox
      Left = 296
      Top = 81
      Width = 197
      Height = 21
      DataSource = DataDetalhes
      TabOrder = 3
    end
  end
  inherited DataDetalhes: TDataSource
    Left = 176
    Top = 13
  end
  inherited Action: TActionList
    Left = 263
    Top = 7
  end
  object DataTanques: TDataSource
    DataSet = CdsTanques
    Left = 448
    Top = 32
  end
  object CdsTanques: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 376
    Top = 16
  end
end
