program ufProjeto;

uses
  Vcl.Forms,
  ufPrincipal in 'ufPrincipal.pas' {Livraria},
  uDataModule in 'uDataModule.pas' {DataModule1: TDataModule},
  ClasseAutor in 'ClasseAutor.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TLivraria, Livraria);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;

end.
