object DM_main: TDM_main
  OldCreateOrder = False
  Left = 561
  Top = 253
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
      'Select  emp.id as id,'
      '        emp.full_name,'
      '        emp.phone,'
      '        emp.birthday,'
      '        Case '
      '            WHEN emp.flag_fired = 1'
      '            THEN '#39#1044#1072#39
      '            Else '#39#1053#1077#1090#39
      '        END  flag_fired,'
      '        emp.flag_fired as id_flag_fired,'
      '        d.id as id_dept,'
      '        p.id as id_pos,'
      '        d.name as name_dept,'
      '        p.name as name_pos'
      'From employees emp'
      '     LEFT Join departments d On d.id = emp.id_dept'
      '     LEFT Join positions p On p.id = emp.id_pos '
      'Where 1 = 1'
      '&fio_filter')
    Left = 16
    Top = 136
    MacroData = <
      item
        Name = 'fio_filter'
        Value = 'and lower(full_name) like lower(:p_fio)'
        Active = False
      end>
  end
  object dsEmp: TDataSource
    DataSet = qryEmp
    Left = 64
    Top = 136
  end
  object qryReportEmp: TMyQuery
    Connection = DM_conn.MyConnDB
    SQL.Strings = (
      'Select  emp.id as id,'
      '        emp.full_name,'
      '        emp.phone,'
      '        emp.birthday,'
      '        Case '
      '            WHEN emp.flag_fired = 1'
      '            THEN '#39#1044#1072#39
      '            Else '#39#1053#1077#1090#39
      '        END  flag_fired,'
      '        emp.flag_fired as id_flag_fired,'
      '        d.id as id_dept,'
      '        p.id as id_pos,'
      '        d.name as name_dept,'
      '        p.name as name_pos,'
      '        p.salary'
      'From employees emp'
      '     LEFT Join departments d On d.id = emp.id_dept'
      '     LEFT Join positions p On p.id = emp.id_pos '
      'Where 1 = 1'
      '&fio_filter'
      '&fired_filter'
      '&only_fired_filter'
      '&dept_filter'
      '&post_filter')
    Active = True
    Left = 224
    Top = 120
    MacroData = <
      item
        Name = 'fio_filter'
        Value = 'and lower(full_name) like lower(:p_fio)'
        Active = False
      end
      item
        Name = 'fired_filter'
        Value = 'and flag_fired =1'
        Active = False
      end
      item
        Name = 'only_fired_filter'
        Value = 'and flag_fired =0'
        Active = False
      end
      item
        Name = 'dept_filter'
        Value = 'and d.id = :p_id_dept'
        Active = False
      end
      item
        Name = 'post_filter'
        Value = 'and p.id = :p_id_post'
        Active = False
      end>
  end
  object dsReportEmp: TDataSource
    DataSet = qryReportEmp
    Left = 224
    Top = 176
  end
end
