object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'FormMain'
  ClientHeight = 264
  ClientWidth = 569
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrdCities: TDBGrid
    Left = 48
    Top = 16
    Width = 441
    Height = 169
    DataSource = dsCities
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CITY_ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Visible = True
      end>
  end
  object conMain: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDAORA.1;Password=w;User ID=chtpz;Data Source=127.0.0.' +
      '1;Persist Security Info=True'
    Provider = 'MSDAORA.1'
    Left = 16
    Top = 16
  end
  object dsCities: TDataSource
    DataSet = tblCities
    Left = 208
    Top = 96
  end
  object tblCities: TADOTable
    Active = True
    Connection = conMain
    CursorType = ctStatic
    TableName = 'CITY'
    Left = 312
    Top = 104
  end
end
