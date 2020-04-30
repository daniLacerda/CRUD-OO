unit ClasseAutor;


interface
uses
SysUtils, uDataModule;
type
 TAutor = class
  private
    FNome : String;
    FidAutor : Integer;
    FHora : TTime;
    FData : TDate;
    procedure SetidAutor(const Value: Integer);
    procedure SetNome(const Value: String);
    procedure SetHora(const Value: TTime);
    procedure SetData(const Value: TDate);

  public
    property Nome : String read FNome write SetNome;
    property idAutor : Integer read FidAutor write SetidAutor;
    property Hora :TTime read FHora write SetHora;
    property Data : TDate read FData write SetData;

 end;

implementation

{ TAutor }


{ TAutor }

procedure TAutor.SetData(const Value: TDate);
begin
  Self.FData := Value;
end;

procedure TAutor.SetHora(const Value: TTime);
begin
  Self.FHora := Value;
end;

procedure TAutor.SetidAutor(const Value: Integer);
begin
  Self.FidAutor := Value;
end;

procedure TAutor.SetNome(const Value: String);
begin
  Self.FNome := Value;
end;

{ TAutor }


end.
