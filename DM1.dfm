object DM_MAIN: TDM_MAIN
  OldCreateOrder = False
  Left = 472
  Top = 216
  Height = 371
  Width = 644
  object MyConnDB_INET: TMyConnection
    Database = 'sql7338523'
    Username = 'sql7338523'
    Password = 'TI8NtyLIFB'
    Server = 'sql7.freesqldatabase.com'
    Left = 32
    Top = 16
  end
  object QryTemp: TMyQuery
    Connection = MyConnDB
    SQL.Strings = (
      'Select * From Users_AppProject')
    Left = 128
    Top = 16
  end
  object MyConnDB: TMyConnection
    Database = 'test'
    Options.UseUnicode = True
    Username = 'root'
    Server = 'localhost'
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 72
  end
  object dsUsersApp: TDataSource
    DataSet = QryUsersApp
    Left = 256
    Top = 16
  end
  object QryUsersApp: TMyQuery
    Connection = MyConnDB
    SQL.Strings = (
      'Select * '
      'From users_app'
      'Where 1 = 1')
    Active = True
    Left = 320
    Top = 16
  end
end
