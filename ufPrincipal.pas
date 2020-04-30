unit ufPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Phys.Intf, FireDAC.Phys,
  FireDAC.Comp.DataSet,
  FireDAC.Stan.Param, FireDAC.Phys.MySQLDef,
  uDataModule,
  FireDAC.UI.Intf, FireDAC.VCLUI.Wait, FireDAC.Phys.MySQL, FireDAC.Stan.Intf,
  FireDAC.Comp.UI, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys.MSAccDef,
  FireDAC.Phys.ODBCBase, FireDAC.Phys.MSAcc, ClasseAutor;

type
  TModo = (modoInclusao, modoAlteracao, modoLeitura);
  TDataModule = class(TDataModule1);

  TLivraria = class(TForm)
    pnlFundo: TPanel;
    pnlAutores: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    pnlA_Operacoes: TPanel;
    btnA_Alterar: TButton;
    btnA_Incluir: TButton;
    btnA_Excluir: TButton;
    edtId_Autores: TEdit;
    edtNome_Autores: TEdit;
    btnA_Anterior: TButton;
    btnA_Proximo: TButton;
    btnVerLivros: TButton;
    pnlA_Confirmar: TPanel;
    btnA_Cancelar: TButton;
    btnA_Salvar: TButton;
    btnAbrirConsulta: TButton;
    dbGridAutores: TDBGrid;
    lblModoAutor: TLabel;
    pnlLivros: TPanel;
    btnFecharConsulta: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtId_Livro: TEdit;
    edtNome_Livro: TEdit;
    edtAutor_Livro: TEdit;
    pnlL_Operacoes: TPanel;
    btnL_Excluir: TButton;
    btnL_Alterar: TButton;
    btnL_Incluir: TButton;
    lblModoLivro: TLabel;
    btnProximoLivro: TButton;
    btnAnteriorlivro: TButton;
    DBGrid2: TDBGrid;
    pnlL_Confirmar: TPanel;
    btnL_Salvar: TButton;
    btnL_Cancelar: TButton;

    procedure btnAbrirConsultaClick(Sender: TObject);
    procedure btnA_ProximoClick(Sender: TObject);
    procedure btnA_AnteriorClick(Sender: TObject);
    procedure btnA_AlterarClick(Sender: TObject);
    procedure btnA_IncluirClick(Sender: TObject);
    procedure btnA_ExcluirClick(Sender: TObject);
    procedure btnA_SalvarClick(Sender: TObject);
    procedure btnA_CancelarClick(Sender: TObject);
    procedure btnVerLivrosClick(Sender: TObject);
    procedure btnAnteriorlivroClick(Sender: TObject);
    procedure btnProximoLivroClick(Sender: TObject);
    procedure btnL_AlterarClick(Sender: TObject);
    procedure btnL_IncluirClick(Sender: TObject);
    procedure btnL_CancelarClick(Sender: TObject);
    procedure btnL_SalvarClick(Sender: TObject);
    procedure btnFecharConsultaClick(Sender: TObject);
    procedure btnL_ExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbGridAutoresCellClick(Column: TColumn);
    procedure dbGridAutoresColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure dbGridAutoresKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FAutor : TAutor;
    FModo: TModo;
    procedure ConsultarLinhas_Autor;
    procedure ConsultarLinhas_Livro;
    procedure ConexaoBD;
    procedure AfterScrollDS(ADataSet : TDataSet);
    procedure EstadoBotoesCancelarSalvarExcluir;
    procedure EstadoBotoesAlterar;
    procedure EstadoBotoesIncluir;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Livraria: TLivraria;

implementation

{$R *.dfm}

procedure TLivraria.ConexaoBD;
begin
  if DataModule1.conexao.Connected = False then
  begin
    DataModule1.conexao.Connected := True;
    ShowMessage('Banco de Dados Conectado.');
  end
  else
  begin
    DataModule1.conexao.Connected := False;
    ShowMessage('Banco de Dados Desconectado.');
  end;
end;

procedure TLivraria.btnL_AlterarClick(Sender: TObject);
begin
  {btnVerLivros.Enabled := False;
  btnL_Alterar.Enabled := False;
  btnL_Incluir.Enabled := False;
  btnL_Excluir.Enabled := True;
  btnL_Cancelar.Enabled := True;
  btnL_Salvar.Enabled := True;
  edtId_Livro.ReadOnly := True;
  edtNome_Livro.ReadOnly := False;}
end;

procedure TLivraria.btnAnteriorlivroClick(Sender: TObject);
begin
  DataModule1.qryLivros.Prior;
  ConsultarLinhas_Livro;
end;

procedure TLivraria.btnA_AlterarClick(Sender: TObject);
begin
  //EstadoBotoesAlterar;
    if TButton(Sender).Name = 'btnA_Alterar' then
  begin
    btnA_Cancelar.Enabled := True;
    btnA_Salvar.Enabled := True;
    btnVerLivros.Enabled := False;
    btnA_Alterar.Enabled := False;
    btnA_Incluir.Enabled := False;
    btnA_Excluir.Enabled := True;
    edtId_Autores.ReadOnly := True;
    edtNome_Autores.ReadOnly := False;
    edtNome_Autores.SetFocus;
    lblModoAutor.Caption := 'Modo: Alteração';
    FModo := modoAlteracao;
  end
  else
  if TButton(Sender).Name = 'btnL_Alterar' then
  begin
    btnVerLivros.Enabled := False;
    btnL_Alterar.Enabled := False;
    btnL_Incluir.Enabled := False;
    btnL_Excluir.Enabled := True;
    btnL_Cancelar.Enabled := True;
    btnL_Salvar.Enabled := True;
    edtId_Livro.ReadOnly := True;
    edtNome_Livro.ReadOnly := False;
    edtAutor_Livro.ReadOnly := True;
    edtNome_Livro.SetFocus;
    lblModoLivro.Caption := 'Modo: Alteração';
    FModo := modoAlteracao;
  end;
end;

procedure TLivraria.btnA_AnteriorClick(Sender: TObject);
begin
  DataModule1.qryAutores.Prior;
  ConsultarLinhas_Autor;
end;

procedure TLivraria.btnA_CancelarClick(Sender: TObject);
begin
  btnA_Cancelar.Enabled := False;
  btnA_Salvar.Enabled := False;

  ConsultarLinhas_Autor;
  btnVerLivros.Enabled := True;
  btnA_Alterar.Enabled := True;
  btnA_Incluir.Enabled := True;
  btnA_Excluir.Enabled := False;
  edtId_Autores.ReadOnly := True;
  edtNome_Autores.ReadOnly := True;
  lblModoAutor.Caption := 'Modo: Leitura';
  FModo := modoLeitura;
end;

procedure TLivraria.btnA_ExcluirClick(Sender: TObject);
begin
  if DataModule1.conexao.ExecSQL('DELETE FROM autores WHERE id_autor=' +
    QuotedStr(edtId_Autores.Text)) > 0 then
  begin
    ShowMessage('Excluido com sucesso!');
    EstadoBotoesCancelarSalvarExcluir;
    DataModule1.qryAutores.Refresh;
  end;
end;

procedure TLivraria.btnA_IncluirClick(Sender: TObject);
begin
  EstadoBotoesIncluir;
  edtNome_Autores.SetFocus;
  FModo := modoInclusao;
  lblModoAutor.Caption := 'Modo: Inclusão';
end;

procedure TLivraria.btnA_ProximoClick(Sender: TObject);
begin
  DataModule1.qryAutores.Next;
  ConsultarLinhas_Autor;
end;

procedure TLivraria.btnA_SalvarClick(Sender: TObject);

begin
  if FModo = modoLeitura then
    Exit;

  if FModo = modoInclusao then
  begin
    edtId_Autores.ReadOnly := False;
    DataModule1.qryAutores.Append;
  end
  else
    DataModule1.qryAutores.Edit;

  FAutor.Nome := edtNome_Autores.Text;
  FAutor.Hora := Time();
  FAutor.Data := Date();

  DataModule1.qryAutores.FieldByName('nome_autor').Value := FAutor.Nome;
  DataModule1.qryAutores.FieldByName('hora_log').Value := FAutor.Hora;
  DataModule1.qryAutores.FieldByName('data_log').Value := FAutor.Data;
  DataModule1.qryAutores.Post;
  EstadoBotoesCancelarSalvarExcluir;
  FModo := modoLeitura;
  lblModoAutor.Caption := 'Modo: Leitura';

  if dbGridAutores.CanFocus then
    dbGridAutores.SetFocus;
end;

procedure TLivraria.btnFecharConsultaClick(Sender: TObject);
begin
  DataModule1.conexao.Connected := False;
  DataModule1.qryAutores.Active := False;
  pnlAutores.Enabled := False;
  pnlAutores.Visible := False;

  DataModule1.qryLivros.Active := False;
  pnlLivros.Enabled := False;
  pnlLivros.Visible := False;
  btnFecharConsulta.Enabled := False;
  btnAbrirConsulta.Enabled := True;

end;

procedure TLivraria.btnL_IncluirClick(Sender: TObject);
begin
  lblModoLivro.Caption := 'Modo: Inclusão';
  btnVerLivros.Enabled := False;
  btnL_Alterar.Enabled := False;
  btnL_Incluir.Enabled := False;
  btnL_Excluir.Enabled := False;
  btnL_Cancelar.Enabled := True;
  btnL_Salvar.Enabled := True;
  edtId_Livro.ReadOnly := True;
  edtNome_Livro.ReadOnly := False;
  edtNome_Livro.Clear;
  edtNome_Livro.SetFocus;
  if edtAutor_Livro.Text = '' then
  begin
    edtAutor_Livro.ReadOnly := False;
  end else
  begin
  edtAutor_Livro.ReadOnly := True;
  FModo := modoInclusao;
  end;
end;

procedure TLivraria.btnProximoLivroClick(Sender: TObject);
begin
  DataModule1.qryLivros.Next;
  ConsultarLinhas_Livro;
end;

procedure TLivraria.btnL_SalvarClick(Sender: TObject);
begin
  if FModo = modoLeitura then
    Exit;

  if FModo = modoInclusao then
  begin
    edtId_Livro.ReadOnly := False;
    DataModule1.qryLivros.Append;
    DataModule1.qryLivros.FieldByName('nome_livro').Value :=
      edtNome_Livro.Text;
    DataModule1.qryLivros.FieldByName('autor_livro').Value :=
      edtAutor_Livro.Text;
  end
  else
  begin
    DataModule1.qryLivros.Edit;
  end;
  DataModule1.qryLivros.FieldByName('nome_livro').Value :=
    edtNome_Livro.Text;
  DataModule1.qryLivros.FieldByName('autor_livro').Value :=
    edtAutor_Livro.Text;
  btnL_Salvar.Enabled := False;
  DataModule1.qryLivros.Post;
  btnL_Alterar.Enabled := True;
  btnL_Incluir.Enabled := True;
  btnL_Excluir.Enabled := False;
  btnL_Cancelar.Enabled := False;
  edtId_Livro.ReadOnly := True;
  edtNome_Livro.ReadOnly := True;
  FModo := modoLeitura;
  lblModoLivro.Caption := 'Modo: Leitura';
end;

procedure TLivraria.ConsultarLinhas_Livro;
begin
  edtId_Livro.Text := DataModule1.qryLivros.FieldByName('id_livro').AsString;
  edtNome_Livro.Text := DataModule1.qryLivros.FieldByName
    ('nome_livro').AsString;
  edtAutor_Livro.Text := DataModule1.qryLivros.FieldByName
    ('autor_livro').AsString;
end;



procedure TLivraria.dbGridAutoresCellClick(Column: TColumn);
begin
  ConsultarLinhas_Autor();
end;

procedure TLivraria.dbGridAutoresColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  ConsultarLinhas_Autor();
end;

procedure TLivraria.dbGridAutoresKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_down then
  begin
    if btnA_Proximo.Enabled then
      btnA_Proximo.Click;

    Abort;
  end;

  if Key = vk_up then
  begin
    if btnA_Anterior.Enabled then
      btnA_Anterior.Click;

    Abort;
  end;
end;



{procedure TLivraria.EstadoBotoesAlterar;
begin
  if TButton(Sender).Name = 'btnA_Alterar' then
  begin
    btnA_Cancelar.Enabled := True;
    btnA_Salvar.Enabled := True;
    btnVerLivros.Enabled := False;
    btnA_Alterar.Enabled := False;
    btnA_Incluir.Enabled := False;
    btnA_Excluir.Enabled := True;
    edtId_Autores.ReadOnly := True;
    edtNome_Autores.ReadOnly := False;
  end
  else
  if TButton(Sender).Name = 'btnL_Alterar' then
  begin
    btnVerLivros.Enabled := False;
    btnL_Alterar.Enabled := False;
    btnL_Incluir.Enabled := False;
    btnL_Excluir.Enabled := True;
    btnL_Cancelar.Enabled := True;
    btnL_Salvar.Enabled := True;
    edtId_Livro.ReadOnly := True;
    edtNome_Livro.ReadOnly := False;
    edtAutor_Livro.ReadOnly := True;
  end;
end;  }

procedure TLivraria.EstadoBotoesCancelarSalvarExcluir;
begin
  btnVerLivros.Enabled := True;
  btnA_Cancelar.Enabled := False;
  btnA_Excluir.Enabled := False;
  btnA_Salvar.Enabled := False;
  btnA_Alterar.Enabled := True;
  btnA_Incluir.Enabled := True;
  edtId_Autores.ReadOnly := True;
  edtNome_Autores.ReadOnly := True;
end;

procedure TLivraria.EstadoBotoesIncluir;
begin
  btnVerLivros.Enabled := False;
  btnA_Alterar.Enabled := False;
  btnA_Incluir.Enabled := False;
  btnA_Excluir.Enabled := False;
  btnA_Cancelar.Enabled := True;
  btnA_Salvar.Enabled := True;
  edtId_Autores.ReadOnly := True;
  edtNome_Autores.ReadOnly := False;
  edtNome_Autores.Clear;
end;

procedure TLivraria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(Self.FAutor);
end;

procedure TLivraria.FormCreate(Sender: TObject);
begin
  self.FAutor := TAutor.Create;
end;

procedure TLivraria.btnVerLivrosClick(Sender: TObject);
begin
  pnlLivros.Enabled := True;
  DataModule1.qryLivros.Active := Active;
  DataModule1.qryLivros.SQL.Text :=
    ('SELECT id_livro, nome_livro, autor_livro FROM livros WHERE autor_livro ='
    + edtId_Autores.Text + '');

  try
    DataModule1.qryLivros.AfterScroll := AfterScrollDS;
    DataModule1.qryLivros.Open;
  except
    on E: Exception do
      raise Exception.Create('Falha ao abrir a consulta de Livros!' +
        E.Message);
  end;
  pnlLivros.Enabled := True;
  pnlLivros.Visible := True;
  DataModule1.qryLivros.FetchAll;
  DataModule1.qryLivros.First;

  ConsultarLinhas_Livro();
  btnL_Salvar.Enabled := False;
  btnL_Cancelar.Enabled := False;
  edtId_Livro.ReadOnly := True;
  edtNome_Livro.ReadOnly := True;
  edtAutor_Livro.ReadOnly := True;
  DataModule1.qryLivros.FindKey([edtId_Autores.Text]);

  DataModule1.qryLivros.Open;
  DataModule1.qryLivros.Refresh;
end;

  procedure TLivraria.btnL_CancelarClick(Sender: TObject);
begin
  lblModoLivro.Caption := 'Modo: Leitura';
  ConsultarLinhas_Livro;
  btnVerLivros.Enabled := True;
  btnL_Alterar.Enabled := True;
  btnL_Incluir.Enabled := True;
  btnL_Excluir.Enabled := False;
  btnL_Cancelar.Enabled := False;
  btnL_Salvar.Enabled := False;
  edtId_Livro.ReadOnly := True;
  edtNome_Livro.ReadOnly := True;
  FModo := modoLeitura;
end;

procedure TLivraria.btnL_ExcluirClick(Sender: TObject);
begin
if DataModule1.conexao.ExecSQL('DELETE FROM livros WHERE id_livro=' +
    QuotedStr(edtId_Livro.Text)) > 0 then
  begin
    ShowMessage('Excluido com sucesso!');
    edtId_Livro.ReadOnly := True;
    edtNome_Livro.ReadOnly := True;
    edtAutor_Livro.ReadOnly := True;
    DataModule1.qryLivros.Refresh;
    btnL_Alterar.Enabled := True;
    btnL_Incluir.Enabled := True;
    btnL_Excluir.Enabled := False;
    btnL_Salvar.Enabled := False;
    btnL_Cancelar.Enabled := False;
  end;
end;

procedure TLivraria.ConsultarLinhas_Autor;
begin
  Self.FAutor.idAutor := DataModule1.qryAutores.FieldByName
    ('id_autor').AsInteger;
  Self.FAutor.Nome := DataModule1.qryAutores.FieldByName
    ('nome_autor').AsString;;
  Self.FAutor.Data := DataModule1.qryAutores.FieldByName
    ('data_log').AsDateTime;
  Self.FAutor.Hora := DataModule1.qryAutores.FieldByName
    ('hora_log').AsDateTime;

  edtNome_Autores.Text := Self.FAutor.Nome;
  edtId_Autores.Text   := DataModule1.qryAutores.FieldByName
    ('id_autor').AsString;
end;

procedure TLivraria.AfterScrollDS(ADataSet: TDataSet);
begin
  ConsultarLinhas_Autor();
end;

procedure TLivraria.btnAbrirConsultaClick(Sender: TObject);
begin
  if btnFecharConsulta.Enabled = False then
    btnFecharConsulta.Enabled := True;
  btnA_Cancelar.Enabled := False;
  btnA_Salvar.Enabled := False;
  ConexaoBD;
  DataModule1.qryAutores.Active := Active;
  DataModule1.qryAutores.SQL.Text :=
  'SELECT id_autor, nome_autor, hora_log, data_log FROM autores';
  try
    DataModule1.qryAutores.Open;
  except
    on E: Exception do
      raise Exception.Create('Falha ao abrir a consulta de Autores!' + E.Message);
  end;
  pnlAutores.Enabled := True;
  pnlAutores.Visible := True;
  btnA_Excluir.Enabled := False;
  DataModule1.qryAutores.FetchAll;
  DataModule1.qryAutores.First;
  ConsultarLinhas_Autor();

  //pnlA_Confirmar.Enabled := False;
  //pnlA_Operacoes.Enabled := True;
  edtId_Autores.ReadOnly := True;
  edtNome_Autores.ReadOnly := True;
  btnAbrirConsulta.Enabled := False;

  if dbGridAutores.CanFocus then
    dbGridAutores.SetFocus;
  end;
end.
