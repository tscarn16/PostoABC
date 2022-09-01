inherited frmPrincipal: TfrmPrincipal
  Caption = 'Posto ABC'
  ClientHeight = 628
  ClientWidth = 870
  Menu = MainMenu1
  WindowState = wsMaximized
  ExplicitWidth = 886
  ExplicitHeight = 687
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 160
    Top = 240
    object Cadastrs1: TMenuItem
      Caption = 'Cadastros'
      object Combustveis1: TMenuItem
        Caption = 'Combust'#237'veis'
        OnClick = Combustveis1Click
      end
      object Bombas1: TMenuItem
        Caption = 'Tanques'
        OnClick = Bombas1Click
      end
      object Bombas2: TMenuItem
        Caption = 'Bombas'
        OnClick = Bombas2Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Caption = 'Sair'
        OnClick = Sair1Click
      end
    end
    object Movimentao1: TMenuItem
      Caption = 'Movimenta'#231#227'o'
      object Abastecimento1: TMenuItem
        Caption = 'Abastecimento'
        OnClick = Abastecimento1Click
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object ListagemdeAbastecimentos1: TMenuItem
        Caption = 'Listagem de Abastecimentos'
        OnClick = ListagemdeAbastecimentos1Click
      end
    end
  end
end
