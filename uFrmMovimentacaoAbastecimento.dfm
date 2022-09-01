inherited frmMovimentacaoAbastecimento: TfrmMovimentacaoAbastecimento
  Caption = 'Movimenta'#231#227'o de Abastecimento'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelGriidInformacoes: TPanel
    inherited PanelSaida: TPanel
      object edtData: TDBEdit
        Left = 7
        Top = 26
        Width = 121
        Height = 21
        DataField = 'DATA'
        DataSource = DataCadastro
        TabOrder = 0
      end
    end
  end
  inherited DataCadastro: TDataSource
    Left = 528
    Top = 256
  end
  inherited ImageList: TImageList
    Left = 360
    Top = 224
  end
  inherited Action: TActionList
    Left = 191
    Top = 207
  end
  inherited CdsCadastro: TClientDataSet
    Left = 425
    Top = 241
  end
end
