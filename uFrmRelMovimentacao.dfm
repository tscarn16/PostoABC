object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 746
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = DataRelatorio
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 35
      BandType = btHeader
      object RLLabel1: TRLLabel
        Left = 112
        Top = 11
        Width = 307
        Height = 16
        Caption = 'Posto ABC - Relat'#243'rio de Movimenta'#231#227'o por Per'#237'odo'
      end
      object lblDe: TRLLabel
        Left = 456
        Top = 11
        Width = 54
        Height = 16
        Caption = '00/00/00'
      end
      object RLLabel2: TRLLabel
        Left = 516
        Top = 11
        Width = 22
        Height = 16
        Caption = 'at'#233
      end
      object lblAte: TRLLabel
        Left = 544
        Top = 11
        Width = 54
        Height = 16
        Caption = '00/00/00'
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 73
      Width = 718
      Height = 32
      BandType = btColumnHeader
      object RLLabel3: TRLLabel
        Left = 16
        Top = 13
        Width = 31
        Height = 16
        Caption = 'Data'
      end
      object RLLabel4: TRLLabel
        Left = 120
        Top = 13
        Width = 77
        Height = 16
        Caption = 'Cod. Tanque'
      end
      object RLLabel5: TRLLabel
        Left = 205
        Top = 13
        Width = 121
        Height = 16
        Caption = 'Desc. Tanque'
      end
      object RLLabel7: TRLLabel
        Left = 434
        Top = 13
        Width = 111
        Height = 16
        Caption = 'Desc. Bomba'
      end
      object RLLabel6: TRLLabel
        Left = 344
        Top = 13
        Width = 76
        Height = 16
        Caption = 'Cod. Bomba'
      end
      object RLLabel8: TRLLabel
        Left = 560
        Top = 13
        Width = 125
        Height = 16
        Caption = 'Valor Abastecimento'
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 105
      Width = 718
      Height = 17
      object RLDBText1: TRLDBText
        Left = 16
        Top = 0
        Width = 89
        Height = 16
        DataField = 'DATA'
        DataSource = DataRelatorio
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 120
        Top = 0
        Width = 77
        Height = 16
        DataField = 'COD_TANQUE'
        DataSource = DataRelatorio
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 205
        Top = 0
        Width = 121
        Height = 16
        DataField = 'DESC_TANQUE'
        DataSource = DataRelatorio
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 352
        Top = 0
        Width = 76
        Height = 16
        DataField = 'COD_BOMBA'
        DataSource = DataRelatorio
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 434
        Top = 0
        Width = 111
        Height = 16
        DataField = 'DESC_BOMBA'
        DataSource = DataRelatorio
        Text = ''
      end
      object RLDBText6: TRLDBText
        Left = 560
        Top = 0
        Width = 129
        Height = 16
        DataField = 'VALOR'
        DataSource = DataRelatorio
        DisplayMask = 'R$ 0.00##'
        Text = ''
      end
    end
  end
  object DataRelatorio: TDataSource
    DataSet = ClientDataSet1
    Left = 488
    Top = 456
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 376
    Top = 336
  end
end
