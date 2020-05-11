object DM_main: TDM_main
  OldCreateOrder = False
  Left = 595
  Top = 280
  Height = 310
  Width = 328
  object qryPost: TMyQuery
    Connection = DM_conn.MyConnDB
    SQL.Strings = (
      'Select * '
      'From positions'
      'Where 1 = 1'
      '&name_filter')
    Left = 16
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_name'
      end>
    MacroData = <
      item
        Name = 'name_filter'
        Value = 'and lower(name) like lower(:p_name) '
      end>
  end
  object dsPost: TDataSource
    DataSet = qryPost
    Left = 64
    Top = 8
  end
  object qryEmpty: TMyQuery
    Connection = DM_conn.MyConnDB
    Left = 272
    Top = 8
  end
  object qryDept: TMyQuery
    Connection = DM_conn.MyConnDB
    SQL.Strings = (
      'Select * '
      'From departments'
      'Where 1 = 1'
      '&name_filter')
    Left = 16
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_name'
      end>
    MacroData = <
      item
        Name = 'name_filter'
        Value = 'and lower(name) like lower(:p_name) '
      end>
  end
  object dsDept: TDataSource
    DataSet = qryDept
    Left = 64
    Top = 72
  end
  object qryEmp: TMyQuery
    Connection = DM_conn.MyConnDB
    SQL.Strings = (
      'Select * '
      'From employees '
      'Where 1 = 1'
      '&fio_filter')
    Active = True
    Left = 16
    Top = 136
    MacroData = <
      item
        Name = 'fio_filter'
      end>
  end
  object dsEmp: TDataSource
    DataSet = qryEmp
    Left = 64
    Top = 136
  end
end
