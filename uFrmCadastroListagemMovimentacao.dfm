inherited frmCadastroListagemMovimentacao: TfrmCadastroListagemMovimentacao
  Caption = 'Movimenta'#231#227'o de Abastecimentos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelConteudo: TPanel
    inherited PanelGriidInformacoes: TPanel
      inherited GridListagem: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Title.Caption = 'Id Venda'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA'
            Title.Caption = 'Data Venda'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TANQUE_CODIGO'
            Title.Caption = 'Cod. Tanque'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TANQUE_DESCRICAO'
            Title.Caption = 'Desc. Tanque'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BOMBA_CODIGO'
            Title.Caption = 'Cod. Bomba'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BOMBA_DESCRICAO'
            Title.Caption = 'Des. Bomba'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTD'
            Title.Caption = 'Quantidade'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Title.Caption = 'Valor'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALIQUOTA'
            Title.Caption = 'Al'#237'quota'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VR_IMPOSTO'
            Title.Caption = 'Imposto'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_TOTAL'
            Title.Caption = 'Valor Total'
            Width = 75
            Visible = True
          end>
      end
    end
  end
end
