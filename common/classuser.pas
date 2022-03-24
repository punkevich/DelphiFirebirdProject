unit classuser;

interface

uses
  Classes, Sysutils, classconnection;

type
  TUser = class(TObject)
  private
    fid : integer;
    fusername : string;
    connection: TConnection;

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
  self.connection := TConnection.Create(self.id);
end;

destructor TUser.Destroy;
begin
  inherited;
  connection.Free;
end;

end.
