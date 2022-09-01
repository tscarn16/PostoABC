unit uTipos;

interface

type
  tpAction = (actInsert, actDelete, actUpdate);

  tpCampoTabela = (tpctString, tpctInteger, tpctDateTime, tpctDouble, tpctCurrency);

  tpConstraint = (tpcField, tpcPrimaryKey, tcpForeingKey);

  TpTipoCampo = (tcInteger, tcString, tcDia, tcHora, tcBoolean, tcMonetario,
                 tcMonetario3Casas, tcDecimal, tcLookupComboBox, tcChave);

  TTipoPesquisa = (tpCombustivel);

implementation

end.
