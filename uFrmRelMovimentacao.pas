unit uFrmRelMovimentacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, RLReport, Datasnap.DBClient;

type
  TForm1 = class(TForm)
    RLReport1: TRLReport;
    DataRelatorio: TDataSource;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    lblDe: TRLLabel;
    RLLabel2: TRLLabel;
    lblAte: TRLLabel;
    RLBand2: TRLBand;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel8: TRLLabel;
    ClientDataSet1: TClientDataSet;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText6: TRLDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
