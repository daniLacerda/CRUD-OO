unit uDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, FireDAC.Phys.MSAccDef, FireDAC.Phys.ODBCBase,
  FireDAC.Phys.MSAcc, FireDAC.Comp.UI;

type
  TDataModule1 = class(TDataModule)
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    qryAutores: TFDQuery;
    DataSource1: TDataSource;
    conexao: TFDConnection;
    qryAutoresid_autor: TFDAutoIncField;
    qryAutoresnome_autor: TStringField;
    qryAutoreshora_log: TTimeField;
    qryAutoresdata_log: TDateField;
    qryLivros: TFDQuery;
    DataSource2: TDataSource;
    qryLivrosid_livro: TFDAutoIncField;
    qryLivrosnome_livro: TStringField;
    qryLivrosautor_livro: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
try
  conexao.Params.Add('DriverID=MySQL');
  conexao.Params.Add('Port=3306');
  conexao.Params.Add('Database=dblivraria');
  //conexao.Params.Add('User_Name=root');
  conexao.Params.Add('User_Name=root');
  conexao.Params.Add('Password=D40351038');
except on E: Exception do raise Exception.Create('Erro ao configurar a Conexão.');


end;
end;

end.
