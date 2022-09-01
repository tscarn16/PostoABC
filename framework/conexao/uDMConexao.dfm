object DMConexao: TDMConexao
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 196
  Width = 463
  object Conexao: TFDConnection
    Params.Strings = (
      'User_Name=postgres'
      'Password=thiagos'
      'Database=ERP'
      'Server=localhost'
      'DriverID=PG')
    LoginPrompt = False
    Transaction = TransactionPrincipal
    Left = 42
    Top = 16
  end
  object TransactionPrincipal: TFDTransaction
    Options.AutoStop = False
    Connection = Conexao
    Left = 178
    Top = 16
  end
  object TransactionAuxiliar: TFDTransaction
    Options.AutoStop = False
    Connection = Conexao
    Left = 282
    Top = 16
  end
end
