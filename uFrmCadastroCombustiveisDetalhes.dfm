inherited frmCadastroCombustiveisDetalhes: TfrmCadastroCombustiveisDetalhes
  Caption = 'Cadastro de Combust'#237'vel'
  ClientHeight = 159
  ClientWidth = 428
  ExplicitWidth = 444
  ExplicitHeight = 198
  PixelsPerInch = 96
  TextHeight = 13
  inherited frmCadastroDetalhePadrao: TPanel
    Width = 428
    Height = 159
    ExplicitWidth = 428
    ExplicitHeight = 159
    object Label1: TLabel [1]
      Left = 15
      Top = 62
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    inherited Panel3: TPanel
      Top = 128
      Width = 426
      ExplicitTop = 128
      ExplicitWidth = 426
      inherited btnGravar: TSpeedButton
        Left = 137
        ExplicitLeft = 137
      end
      inherited btnCancelar: TSpeedButton
        Left = 276
        ExplicitLeft = 276
      end
      inherited Separador2: TPanel
        Left = 252
        ExplicitLeft = 252
      end
      inherited Panel4: TPanel
        Left = 391
        ExplicitLeft = 391
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
  end
  inherited DataDetalhes: TDataSource
    Left = 192
    Top = 21
  end
  inherited Action: TActionList
    Left = 271
    Top = 15
  end
end
