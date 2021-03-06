unit classconnection;

interface

uses
  Classes, Sysutils;

type
  TConnection = class(TObject)
    private
      connection_id : integer;
      user_id : integer;
    public
      constructor Create(user_id: integer);
      destructor Destroy; override;
  end;

implementation

uses
  datamoduleconnect, classuser;

constructor TConnection.Create(user_id: integer);
begin
  self.user_id := user_id;
  with dm.QTemp, SQL do begin
    Close;
    Clear;
    Add('EXECUTE PROCEDURE CONNECTIONS_START(:USER_ID)');
    ParamByName('USER_ID').AsInteger := user_id;
    Open;
    self.connection_id := FieldByName('CONNECTION_ID').AsInteger;
  end;
end;

destructor TConnection.Destroy;
begin
  inherited;
  with dm.QTemp, SQL do begin
    Close;
    Clear;
    Add('EXECUTE PROCEDURE CONNECTIONS_END(:CONNECTION_ID)');
    ParamByName('CONNECTION_ID').AsInteger := connection_id;
    ExecSQL;
  end;
end;

end.
