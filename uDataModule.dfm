object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 293
  Width = 395
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 305
    Top = 176
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 304
    Top = 224
  end
  object qryAutores: TFDQuery
    ActiveStoredUsage = [auRunTime]
    Connection = conexao
    SQL.Strings = (
      'SELECT * from autores')
    Left = 71
    Top = 7
    object qryAutoresid_autor: TFDAutoIncField
      FieldName = 'id_autor'
      Origin = 'id_autor'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryAutoresnome_autor: TStringField
      FieldName = 'nome_autor'
      Origin = 'nome_autor'
      Required = True
      Size = 30
    end
    object qryAutoreshora_log: TTimeField
      FieldName = 'hora_log'
      Origin = 'hora_log'
    end
    object qryAutoresdata_log: TDateField
      FieldName = 'data_log'
      Origin = 'data_log'
    end
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = qryAutores
    Left = 119
    Top = 8
  end
  object conexao: TFDConnection
    Params.Strings = (
      'DriverID=MySQL')
    ConnectedStoredUsage = [auRunTime]
    LoginPrompt = False
    Left = 15
    Top = 8
  end
  object qryLivros: TFDQuery
    ActiveStoredUsage = [auRunTime]
    IndexFieldNames = 'id_livro'
    Connection = conexao
    SQL.Strings = (
      'SELECT * FROM livros')
    Left = 16
    Top = 72
    object qryLivrosid_livro: TFDAutoIncField
      FieldName = 'id_livro'
      Origin = 'id_livro'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryLivrosnome_livro: TStringField
      FieldName = 'nome_livro'
      Origin = 'nome_livro'
      Required = True
      Size = 40
    end
    object qryLivrosautor_livro: TIntegerField
      FieldName = 'autor_livro'
      Origin = 'autor_livro'
    end
  end
  object DataSource2: TDataSource
    AutoEdit = False
    DataSet = qryLivros
    Left = 16
    Top = 128
  end
end
