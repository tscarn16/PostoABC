inherited frmCadastroTanquesDetalhe: TfrmCadastroTanquesDetalhe
  Caption = 'Listagem de Tanque'
  ClientHeight = 173
  ClientWidth = 571
  OnShow = FormShow
  ExplicitWidth = 587
  ExplicitHeight = 212
  PixelsPerInch = 96
  TextHeight = 13
  inherited frmCadastroDetalhePadrao: TPanel
    Width = 571
    Height = 173
    ExplicitWidth = 571
    ExplicitHeight = 173
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
      Width = 58
      Height = 13
      Caption = 'Combust'#237'vel'
    end
    inherited Panel3: TPanel
      Top = 142
      Width = 569
      ExplicitTop = 142
      ExplicitWidth = 569
      inherited btnGravar: TSpeedButton
        Left = 280
        ExplicitLeft = 280
      end
      inherited btnCancelar: TSpeedButton
        Left = 419
        ExplicitLeft = 419
      end
      inherited Separador2: TPanel
        Left = 395
        ExplicitLeft = 395
      end
      inherited Panel4: TPanel
        Left = 534
        ExplicitLeft = 534
      end
    end
    inherited edtCodigo: TDBEdit
      TabOrder = 2
    end
    object edtDescricao: TDBEdit
      Left = 15
      Top = 81
      Width = 242
      Height = 21
      DataField = 'Descricao'
      DataSource = DataDetalhes
      TabOrder = 1
    end
    object cmbCombustivel: TDBLookupComboBox
      Left = 296
      Top = 81
      Width = 197
      Height = 21
      DataSource = DataDetalhes
      TabOrder = 3
    end
  end
  inherited DataDetalhes: TDataSource
    Left = 216
    Top = 21
  end
  inherited Action: TActionList
    Left = 399
    Top = 23
  end
  object CdsCombustiveis: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 312
    Top = 16
  end
  object DataCombustiveis: TDataSource
    DataSet = CdsCombustiveis
    Left = 488
    Top = 24
  end
end
