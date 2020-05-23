object DM_conn: TDM_conn
  OldCreateOrder = False
  Left = 544
  Top = 251
  Height = 262
  Width = 425
  object MyConnDB: TMyConnection
    Database = 'sql7339909'
    IsolationLevel = ilSerializable
    Options.UseUnicode = True
    Username = 'sql7339909'
    Password = 'XMF4ZyAhHn'
    Server = 'www.db4free.net'
    LoginPrompt = False
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
  object MyConnDB_l: TMyConnection
    Database = 'test'
    IsolationLevel = ilSerializable
    Options.UseUnicode = True
    Username = 'root'
    Server = 'localhost'
    LoginPrompt = False
    Left = 64
    Top = 72
  end
end
