object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 194
  Width = 266
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=D:\solindata\INFO.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'CharacterSet=UTF8'
      'DriverID=FB')
    Connected = True
    Left = 32
    Top = 16
  end
  object QTemp: TFDQuery
    Connection = FDConnection
    Transaction = FDTransaction
    Left = 112
    Top = 16
  end
  object FDTransaction: TFDTransaction
    Connection = FDConnection
    Left = 200
    Top = 16
  end
end
