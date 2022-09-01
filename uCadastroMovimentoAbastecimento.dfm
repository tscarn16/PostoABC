inherited frmCadastroMovimentoCombustivelDetalhe: TfrmCadastroMovimentoCombustivelDetalhe
  Caption = 'frmCadastroMovimentoCombustivelDetalhe'
  ClientHeight = 440
  OnShow = FormShow
  ExplicitHeight = 479
  PixelsPerInch = 96
  TextHeight = 13
  inherited frmCadastroDetalhePadrao: TPanel
    Height = 440
    ExplicitHeight = 440
    inherited lblCodigo: TLabel
      Left = 39
      Top = 478
      Visible = False
      ExplicitLeft = 39
      ExplicitTop = 478
    end
    object Label2: TLabel [1]
      Left = 15
      Top = 6
      Width = 32
      Height = 13
      Caption = 'Bomba'
    end
    object Label3: TLabel [2]
      Left = 15
      Top = 61
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object Label4: TLabel [3]
      Left = 230
      Top = 61
      Width = 56
      Height = 13
      Caption = 'Quantidade'
    end
    object Label1: TLabel [4]
      Left = 230
      Top = 6
      Width = 36
      Height = 13
      Caption = 'Tanque'
    end
    object Label5: TLabel [5]
      Left = 342
      Top = 61
      Width = 66
      Height = 13
      Caption = 'Valor Imposto'
    end
    inherited Panel3: TPanel
      Top = 409
      ExplicitTop = 409
    end
    inherited edtCodigo: TDBEdit
      Left = 39
      Top = 497
      DataField = ''
      DataSource = nil
      Visible = False
      ExplicitLeft = 39
      ExplicitTop = 497
    end
    object cmbBomba: TDBLookupComboBox
      Left = 15
      Top = 25
      Width = 197
      Height = 21
      DataField = 'Id_Bomba'
      DataSource = DataDetalhes
      ListSource = DataBomba
      TabOrder = 2
    end
    object edtValorUnitario: TDBEdit
      Left = 15
      Top = 80
      Width = 197
      Height = 21
      DataField = 'Valor'
      DataSource = DataDetalhes
      TabOrder = 3
    end
    object edtQuantidade: TDBEdit
      Left = 230
      Top = 80
      Width = 98
      Height = 21
      DataField = 'Qtd'
      DataSource = DataDetalhes
      TabOrder = 4
    end
    object cmbTanque: TDBLookupComboBox
      Left = 230
      Top = 25
      Width = 205
      Height = 21
      DataField = 'Id_Tanque'
      DataSource = DataBomba
      ListSource = DataTanque
      ReadOnly = True
      TabOrder = 5
    end
    object edtValorImposto: TDBEdit
      Left = 342
      Top = 80
      Width = 93
      Height = 21
      DataField = 'Aliquota'
      DataSource = DataDetalhes
      TabOrder = 6
    end
    object GroupBox1: TGroupBox
      Left = 15
      Top = 256
      Width = 420
      Height = 137
      Caption = 'Valor Total'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      object lblValorTotal: TLabel
        Left = 24
        Top = 53
        Width = 165
        Height = 52
        Caption = 'R$ 0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -43
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object GroupBox2: TGroupBox
      Left = 15
      Top = 111
      Width = 420
      Height = 137
      Caption = 'Valor Imposto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      object lblValorImposto: TLabel
        Left = 24
        Top = 53
        Width = 165
        Height = 52
        Caption = 'R$ 0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -43
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  inherited DataDetalhes: TDataSource
    Left = 368
    Top = 237
  end
  inherited Action: TActionList
    Left = 367
    Top = 359
  end
  object DataBomba: TDataSource
    DataSet = CdsBomba
    Left = 312
    Top = 288
  end
  object DataTanque: TDataSource
    DataSet = CdsTanque
    Left = 344
    Top = 144
  end
  object CdsBomba: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 288
  end
  object CdsTanque: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 280
    Top = 144
  end
end
