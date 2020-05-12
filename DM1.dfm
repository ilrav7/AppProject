object DM_conn: TDM_conn
  OldCreateOrder = False
  Left = 488
  Top = 234
  Height = 172
  Width = 341
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
    Left = 120
    Top = 16
  end
  object MyConnDB: TMyConnection
    Database = 'test'
    IsolationLevel = ilSerializable
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
    Left = 264
    Top = 16
  end
  object QryUsersApp: TMyQuery
    Connection = MyConnDB
    SQL.Strings = (
      'Select * '
      'From users_app'
      'Where 1 = 1'
      '&search_filter')
    Left = 200
    Top = 16
    MacroData = <
      item
        Name = 'search_filter'
        Value = 
          'and ( lower(login) like lower(:p_login)'#13#10'        OR'#13#10'         lo' +
          'wer(lastname) like lower(:p_lastname) )'
        Active = False
      end>
  end
end
