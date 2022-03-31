object FMain: TFMain
  Left = 0
  Top = 0
  Caption = 'Delphi + Firebird testproject'
  ClientHeight = 553
  ClientWidth = 787
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LCbr: TLabel
    Left = 672
    Top = 205
    Width = 58
    Height = 13
    Caption = #1050#1091#1088#1089' '#1062#1041' '#1056#1060
  end
  object PUserInfo: TPanel
    Left = 0
    Top = 0
    Width = 241
    Height = 153
    TabOrder = 0
    object LUserName: TLabel
      Left = 104
      Top = 24
      Width = 54
      Height = 13
      Caption = 'LUserName'
    end
  end
  object DBMain: TDBGrid
    Left = 40
    Top = 224
    Width = 329
    Height = 169
    DataSource = DSMain
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'VALCURS_ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'VALUTE_NAME_RUS'
        Title.Caption = #1042#1072#1083#1102#1090#1072
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALCURS_DATE'
        Title.Caption = #1044#1072#1090#1072
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALCURS_VALUE'
        Title.Caption = #1050#1091#1088#1089
        Width = 72
        Visible = True
      end>
  end
  object SGCbr: TStringGrid
    Left = 632
    Top = 224
    Width = 137
    Height = 120
    ColCount = 2
    RowCount = 3
    FixedRows = 0
    TabOrder = 2
    ColWidths = (
      64
      64)
    RowHeights = (
      24
      24
      24)
  end
  object TBRefresh: TButton
    Left = 694
    Top = 350
    Width = 75
    Height = 25
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100
    TabOrder = 3
    OnClick = TBRefreshClick
  end
  object TBSave: TButton
    Left = 694
    Top = 381
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 4
    OnClick = TBSaveClick
  end
  object MainMenu1: TMainMenu
    Left = 48
    Top = 488
    object N1: TMenuItem
      Caption = #1048#1085#1092#1086
    end
    object N2: TMenuItem
      Caption = #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088
    end
  end
  object HTTP: TIdHTTP
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 120
    Top = 488
  end
  object XMLDocument: TXMLDocument
    Left = 192
    Top = 488
  end
  object DSMain: TDataSource
    DataSet = QMain
    Left = 48
    Top = 424
  end
  object QMain: TFDQuery
    Connection = dm.FDConnection
    SQL.Strings = (
      
        'SELECT A.VALCURS_ID, B.VALUTE_NAME_RUS, A.VALCURS_DATE, A.VALCUR' +
        'S_VALUE'
      'FROM VALCURS A'
      'LEFT JOIN VALUTE B ON A.VALUTE_ID = B.VALUTE_ID ')
    Left = 104
    Top = 424
  end
end
