object Livraria: TLivraria
  Left = 0
  Top = 0
  Caption = 'Livraria'
  ClientHeight = 552
  ClientWidth = 921
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFundo: TPanel
    Left = 8
    Top = 8
    Width = 905
    Height = 532
    TabOrder = 0
    object pnlAutores: TPanel
      Left = 16
      Top = 47
      Width = 449
      Height = 474
      Enabled = False
      TabOrder = 1
      Visible = False
      object Label1: TLabel
        Left = 35
        Top = 78
        Width = 60
        Height = 13
        Caption = 'ID do Autor:'
      end
      object Label2: TLabel
        Left = 19
        Top = 113
        Width = 76
        Height = 13
        Caption = 'Nome do Autor:'
      end
      object lblModoAutor: TLabel
        Left = 360
        Top = 10
        Width = 66
        Height = 13
        Caption = 'Modo: Leitura'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object pnlA_Operacoes: TPanel
        Left = 8
        Top = 10
        Width = 166
        Height = 41
        TabOrder = 0
        object btnA_Alterar: TButton
          Left = 0
          Top = 9
          Width = 51
          Height = 25
          Caption = 'Alterar'
          TabOrder = 0
          OnClick = btnA_AlterarClick
        end
        object btnA_Incluir: TButton
          Left = 57
          Top = 9
          Width = 51
          Height = 25
          Caption = 'Incluir'
          TabOrder = 1
          OnClick = btnA_IncluirClick
        end
        object btnA_Excluir: TButton
          Left = 108
          Top = 9
          Width = 51
          Height = 25
          Caption = 'Excluir'
          TabOrder = 2
          OnClick = btnA_ExcluirClick
        end
      end
      object edtId_Autores: TEdit
        Left = 101
        Top = 75
        Width = 44
        Height = 21
        TabOrder = 1
      end
      object edtNome_Autores: TEdit
        Left = 101
        Top = 110
        Width = 204
        Height = 21
        TabOrder = 2
      end
      object btnA_Anterior: TButton
        Left = 150
        Top = 73
        Width = 53
        Height = 25
        Caption = 'Anterior'
        TabOrder = 3
        OnClick = btnA_AnteriorClick
      end
      object btnA_Proximo: TButton
        Left = 203
        Top = 73
        Width = 53
        Height = 25
        Caption = 'Proximo'
        TabOrder = 4
        OnClick = btnA_ProximoClick
      end
      object btnVerLivros: TButton
        Left = 311
        Top = 108
        Width = 121
        Height = 25
        Caption = 'Ver Livro Deste Autor'
        TabOrder = 5
        OnClick = btnVerLivrosClick
      end
      object pnlA_Confirmar: TPanel
        Left = 274
        Top = 427
        Width = 167
        Height = 41
        TabOrder = 6
        object btnA_Cancelar: TButton
          Left = 5
          Top = 7
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 0
          OnClick = btnA_CancelarClick
        end
        object btnA_Salvar: TButton
          Left = 86
          Top = 7
          Width = 75
          Height = 25
          Caption = 'Salvar'
          TabOrder = 1
          OnClick = btnA_SalvarClick
        end
      end
      object dbGridAutores: TDBGrid
        Left = 8
        Top = 139
        Width = 433
        Height = 282
        DataSource = DataModule1.DataSource1
        TabOrder = 7
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = dbGridAutoresCellClick
        OnColumnMoved = dbGridAutoresColumnMoved
        OnKeyDown = dbGridAutoresKeyDown
      end
    end
    object btnAbrirConsulta: TButton
      Left = 24
      Top = 16
      Width = 129
      Height = 25
      Caption = 'Abrir Consulta'
      TabOrder = 0
      OnClick = btnAbrirConsultaClick
    end
    object pnlLivros: TPanel
      Left = 471
      Top = 47
      Width = 418
      Height = 474
      Enabled = False
      TabOrder = 2
      Visible = False
      object Label3: TLabel
        Left = 40
        Top = 78
        Width = 56
        Height = 13
        Caption = 'ID do Livro:'
      end
      object Label4: TLabel
        Left = 25
        Top = 113
        Width = 72
        Height = 13
        Caption = 'Nome do Livro:'
      end
      object Label5: TLabel
        Left = 278
        Top = 113
        Width = 60
        Height = 13
        Caption = 'ID do Autor:'
      end
      object lblModoLivro: TLabel
        Left = 328
        Top = 10
        Width = 66
        Height = 13
        Caption = 'Modo: Leitura'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edtId_Livro: TEdit
        Left = 102
        Top = 75
        Width = 51
        Height = 21
        TabOrder = 0
      end
      object edtNome_Livro: TEdit
        Left = 103
        Top = 110
        Width = 169
        Height = 21
        TabOrder = 1
      end
      object edtAutor_Livro: TEdit
        Left = 344
        Top = 110
        Width = 51
        Height = 21
        TabOrder = 2
      end
      object pnlL_Operacoes: TPanel
        Left = 16
        Top = 10
        Width = 165
        Height = 41
        TabOrder = 3
        object btnL_Excluir: TButton
          Left = 107
          Top = 8
          Width = 50
          Height = 25
          Caption = 'Excluir'
          TabOrder = 0
          OnClick = btnL_ExcluirClick
        end
        object btnL_Alterar: TButton
          Left = 7
          Top = 8
          Width = 50
          Height = 25
          Caption = 'Alterar'
          TabOrder = 1
          OnClick = btnA_AlterarClick
        end
        object btnL_Incluir: TButton
          Left = 57
          Top = 8
          Width = 49
          Height = 25
          Caption = 'Incluir'
          TabOrder = 2
          OnClick = btnL_IncluirClick
        end
      end
      object btnProximoLivro: TButton
        Left = 211
        Top = 73
        Width = 52
        Height = 25
        Caption = 'Proximo'
        TabOrder = 4
        OnClick = btnProximoLivroClick
      end
      object btnAnteriorlivro: TButton
        Left = 159
        Top = 73
        Width = 52
        Height = 25
        Caption = 'Anterior'
        TabOrder = 5
        OnClick = btnAnteriorlivroClick
      end
      object DBGrid2: TDBGrid
        Left = 8
        Top = 137
        Width = 401
        Height = 284
        DataSource = DataModule1.DataSource2
        TabOrder = 6
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object pnlL_Confirmar: TPanel
        Left = 240
        Top = 427
        Width = 169
        Height = 41
        TabOrder = 7
        object btnL_Salvar: TButton
          Left = 86
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Salvar'
          TabOrder = 0
          OnClick = btnL_SalvarClick
        end
        object btnL_Cancelar: TButton
          Left = 5
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 1
          OnClick = btnL_CancelarClick
        end
      end
    end
    object btnFecharConsulta: TButton
      Left = 159
      Top = 16
      Width = 129
      Height = 25
      Caption = 'Fechar Consulta'
      Enabled = False
      TabOrder = 3
      OnClick = btnFecharConsultaClick
    end
  end
end
