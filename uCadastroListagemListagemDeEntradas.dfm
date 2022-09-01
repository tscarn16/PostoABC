inherited frmCadastroListagemListagemDeEntradas: TfrmCadastroListagemListagemDeEntradas
  Caption = 'Cadastro de Listagem de Entradas'
  ClientHeight = 591
  ClientWidth = 1299
  ExplicitLeft = 8
  ExplicitWidth = 1315
  ExplicitHeight = 630
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar1: TStatusBar
    Top = 566
    Width = 1299
    ExplicitTop = 566
    ExplicitWidth = 1299
  end
  inherited PanelConteudo: TPanel
    Width = 1299
    Height = 566
    ExplicitWidth = 1299
    ExplicitHeight = 566
    inherited Panel: TPanel
      Width = 1297
      ExplicitWidth = 1297
      inherited GroupPeriodo: TcxGroupBox
        Left = 901
        Top = 19
        ExplicitLeft = 901
        ExplicitTop = 19
      end
      inherited cxButton1: TcxButton
        Left = 1169
        Anchors = [akTop, akRight]
        ExplicitLeft = 1169
      end
      object cxLabel7: TcxLabel
        Left = 5
        Top = 3
        Caption = 'Empresa '
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.TextStyle = []
        Style.IsFontAssigned = True
      end
      object edtCodigoEmpresa: TcxTextEdit
        Left = 6
        Top = 19
        TabOrder = 3
        Width = 97
      end
      object btnLocEmpresa: TcxButton
        Left = 103
        Top = 17
        Width = 30
        Height = 25
        OptionsImage.Glyph.SourceDPI = 96
        OptionsImage.Glyph.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C00000026744558745469746C650046696E643B426172733B5269
          62626F6E3B5374616E646172643B536561726368BB659C080000009549444154
          785EA592C10DC3200C459B7598815118A21324ED0E6C81D299B8C01AAE5DFD5C
          ACDA4AE2C3932CFDAF27C03C8828C46FC8390B0B5398C64C017341660B507831
          6420D9E2090A8A83D99824601EC88A2768286DBA201264CD134C94D21F414236
          C382F015EE3E22811DEB3E30D6E8B31A02F7237DB4440B5C507E6BC9158125A9
          6705D649BA21B04F012AD399E72108F1057CFE2C0C2A4306D60000000049454E
          44AE426082}
        TabOrder = 4
      end
      object edtNomeEmpresa: TcxTextEdit
        Left = 133
        Top = 19
        TabOrder = 5
        Width = 428
      end
      object cxLabel8: TcxLabel
        Left = 6
        Top = 42
        Caption = 'Estabelecimento'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.TextStyle = []
        Style.IsFontAssigned = True
      end
      object edtCodigoEstabelecimento: TcxTextEdit
        Left = 6
        Top = 59
        TabOrder = 7
        Width = 97
      end
      object btnLocEstabelecimento: TcxButton
        Left = 103
        Top = 57
        Width = 30
        Height = 25
        OptionsImage.Glyph.SourceDPI = 96
        OptionsImage.Glyph.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C00000026744558745469746C650046696E643B426172733B5269
          62626F6E3B5374616E646172643B536561726368BB659C080000009549444154
          785EA592C10DC3200C459B7598815118A21324ED0E6C81D299B8C01AAE5DFD5C
          ACDA4AE2C3932CFDAF27C03C8828C46FC8390B0B5398C64C017341660B507831
          6420D9E2090A8A83D99824601EC88A2768286DBA201264CD134C94D21F414236
          C382F015EE3E22811DEB3E30D6E8B31A02F7237DB4440B5C507E6BC9158125A9
          6705D649BA21B04F012AD399E72108F1057CFE2C0C2A4306D60000000049454E
          44AE426082}
        TabOrder = 8
      end
      object edtNomeEstabelecimento: TcxTextEdit
        Left = 133
        Top = 59
        TabOrder = 9
        Width = 428
      end
      object cxLabel1: TcxLabel
        Left = 570
        Top = 42
        Caption = 'Setor de Estoque'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.TextStyle = []
        Style.IsFontAssigned = True
      end
      object edtCodigoSetorEstoque: TcxTextEdit
        Left = 570
        Top = 59
        TabOrder = 11
        Width = 97
      end
      object btnLocSetorEstoque: TcxButton
        Left = 667
        Top = 57
        Width = 30
        Height = 25
        OptionsImage.Glyph.SourceDPI = 96
        OptionsImage.Glyph.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C00000026744558745469746C650046696E643B426172733B5269
          62626F6E3B5374616E646172643B536561726368BB659C080000009549444154
          785EA592C10DC3200C459B7598815118A21324ED0E6C81D299B8C01AAE5DFD5C
          ACDA4AE2C3932CFDAF27C03C8828C46FC8390B0B5398C64C017341660B507831
          6420D9E2090A8A83D99824601EC88A2768286DBA201264CD134C94D21F414236
          C382F015EE3E22811DEB3E30D6E8B31A02F7237DB4440B5C507E6BC9158125A9
          6705D649BA21B04F012AD399E72108F1057CFE2C0C2A4306D60000000049454E
          44AE426082}
        TabOrder = 12
      end
      object edtNomeSetorEstoque: TcxTextEdit
        Left = 697
        Top = 59
        TabOrder = 13
        Width = 198
      end
      object cxLabel2: TcxLabel
        Left = 570
        Top = 1
        Caption = 'Fornecedor'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.TextStyle = []
        Style.IsFontAssigned = True
      end
      object edtCodigoFornecedor: TcxTextEdit
        Left = 570
        Top = 18
        TabOrder = 15
        Width = 97
      end
      object btnLocFornecedor: TcxButton
        Left = 667
        Top = 16
        Width = 30
        Height = 25
        OptionsImage.Glyph.SourceDPI = 96
        OptionsImage.Glyph.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C00000026744558745469746C650046696E643B426172733B5269
          62626F6E3B5374616E646172643B536561726368BB659C080000009549444154
          785EA592C10DC3200C459B7598815118A21324ED0E6C81D299B8C01AAE5DFD5C
          ACDA4AE2C3932CFDAF27C03C8828C46FC8390B0B5398C64C017341660B507831
          6420D9E2090A8A83D99824601EC88A2768286DBA201264CD134C94D21F414236
          C382F015EE3E22811DEB3E30D6E8B31A02F7237DB4440B5C507E6BC9158125A9
          6705D649BA21B04F012AD399E72108F1057CFE2C0C2A4306D60000000049454E
          44AE426082}
        TabOrder = 16
      end
      object edtNomeFornecedor: TcxTextEdit
        Left = 697
        Top = 18
        TabOrder = 17
        Width = 198
      end
    end
    inherited pnlTitulo: TPanel
      Width = 1297
      ExplicitWidth = 1297
    end
    inherited PanelGriidInformacoes: TPanel
      Width = 1297
      Height = 421
      ExplicitWidth = 1297
      ExplicitHeight = 421
      inherited GridListagem: TcxGrid
        Width = 1295
        Height = 419
        ExplicitWidth = 1295
        ExplicitHeight = 419
        inherited TVGridListagem: TcxGridDBTableView
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object TVGridListagemModeloNFDescricao: TcxGridDBColumn
            Caption = 'Modelo NF.'
            DataBinding.FieldName = 'ModeloNFDescricao'
            Width = 67
          end
          object TVGridListagemNumNota: TcxGridDBColumn
            Caption = 'Num. Nota'
            DataBinding.FieldName = 'NumNota'
            Width = 92
          end
          object TVGridListagemSerieNota: TcxGridDBColumn
            Caption = 'S'#233'rie'
            DataBinding.FieldName = 'SerieNota'
            Width = 40
          end
          object TVGridListagemOperacaoDescricao: TcxGridDBColumn
            Caption = 'Opera'#231#227'o'
            DataBinding.FieldName = 'OperacaoDescricao'
            Width = 96
          end
          object TVGridListagemFornecedorDescricao: TcxGridDBColumn
            Caption = 'Fornecedor'
            DataBinding.FieldName = 'FornecedorDescricao'
            Width = 345
          end
          object TVGridListagemSetorEstoqueDescricao: TcxGridDBColumn
            Caption = 'Setor Estoque'
            DataBinding.FieldName = 'SetorEstoqueDescricao'
            Width = 102
          end
          object TVGridListagemNumTransferencia: TcxGridDBColumn
            Caption = 'Num. Transfer'#234'ncia'
            DataBinding.FieldName = 'NumTransferencia'
            Width = 117
          end
          object TVGridListagemDataEntrada: TcxGridDBColumn
            Caption = 'Data Entrada'
            DataBinding.FieldName = 'DataEntrada'
            Width = 87
          end
          object TVGridListagemDataEmissao: TcxGridDBColumn
            Caption = 'Data Emiss'#227'o'
            DataBinding.FieldName = 'DataEmissao'
            Width = 95
          end
          object TVGridListagemValorTotalNota: TcxGridDBColumn
            Caption = 'Valor Total'
            DataBinding.FieldName = 'ValorTotalNota'
            Width = 87
          end
          object TVGridListagemAcrescimos: TcxGridDBColumn
            Caption = 'Acr'#233'scimos'
            DataBinding.FieldName = 'Acrescimos'
            Width = 83
          end
          object TVGridListagemDescontos: TcxGridDBColumn
            DataBinding.FieldName = 'Descontos'
            Width = 82
          end
        end
      end
    end
    inherited PanelPrincipal: TPanel
      Width = 1297
      ExplicitWidth = 1297
      inherited Separador2: TPanel
        Visible = False
      end
      inherited Separador3: TPanel
        Width = 114
        ExplicitWidth = 114
      end
      inherited btnSair: TcxButton
        Left = 1203
        ExplicitLeft = 1203
      end
    end
  end
  inherited Action: TActionList
    inherited actGravar: TAction
      Visible = False
    end
    inherited actCancelar: TAction
      Visible = False
    end
  end
  inherited ImageList: TcxImageList
    FormatVersion = 1
  end
end
