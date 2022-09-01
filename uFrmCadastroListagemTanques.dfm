inherited frmCadastroListagemTanques: TfrmCadastroListagemTanques
  Caption = 'Cadastro de Tanques'
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited PanelConteudo: TPanel
    inherited PanelGriidInformacoes: TPanel
      inherited GridListagem: TDBGrid
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgTitleClick, dgTitleHotTrack]
      end
    end
  end
end
