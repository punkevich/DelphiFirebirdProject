unit classuser;

interface

uses
  Classes, Sysutils;

type
  TUser = class(TObject)
  private
    fid : integer;
    fusername : string;
  public
    constructor Create(id: integer);
    destructor Destroy; override;

    property id: integer read fid;
    property username: string read fusername;
  end;

var
  User: TUser;

implementation

uses
  datamoduleconnect;

constructor TUser.Create(id: integer);
begin
  self.fid := id;
  with dm.QTemp, SQL do begin
    Close;
    Clear;
    Add('SELECT USERNAME FROM USERS WHERE ID = :ID');
    ParamByName('ID').AsInteger := id;
    Open;
    self.fusername := FieldByName('USERNAME').AsString;
  end;
end;

destructor TUser.Destroy;
begin
  inherited;
end;

end.
