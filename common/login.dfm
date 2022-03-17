object FLogin: TFLogin
  Left = 0
  Top = 0
  Caption = #1042#1093#1086#1076
  ClientHeight = 265
  ClientWidth = 332
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LUser: TLabel
    Left = 48
    Top = 72
    Width = 72
    Height = 13
    Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
  end
  object LPassword: TLabel
    Left = 48
    Top = 128
    Width = 37
    Height = 13
    Caption = #1055#1072#1088#1086#1083#1100
  end
  object LGuestLogin: TLabel
    Left = 129
    Top = 236
    Width = 82
    Height = 13
    Caption = #1042#1086#1081#1090#1080' '#1082#1072#1082' '#1075#1086#1089#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
  end
  object EUsername: TEdit
    Left = 152
    Top = 69
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object EPassword: TEdit
    Left = 152
    Top = 125
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object BEnter: TButton
    Left = 136
    Top = 192
    Width = 75
    Height = 25
    Caption = #1042#1093#1086#1076
    TabOrder = 2
    OnClick = BEnterClick
  end
  object FDQuery: TFDQuery
    Connection = dm.FDConnection
    Left = 32
    Top = 192
  end
end
