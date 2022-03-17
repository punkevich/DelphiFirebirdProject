unit login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, datamoduleconnect,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFLogin = class(TForm)
    LUser: TLabel;
    LPassword: TLabel;
    EUsername: TEdit;
    EPassword: TEdit;
    BEnter: TButton;
    LGuestLogin: TLabel;
    FDQuery: TFDQuery;
    procedure BEnterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;

implementation

{$R *.dfm}



procedure TFLogin.BEnterClick(Sender: TObject);
begin
  with FDQuery, SQL do begin
    Close;
    Clear;
    Add('SELECT ID FROM USERS WHERE USERNAME = :a');
    Add('AND PASSWORD = :b');
    ParamByName('a').AsString := EUsername.Text;
    ParamByName('b').AsString := EPassword.Text;
    Open;
    showmessage(inttostr(fieldbyname('id').AsInteger));
  end;
end;

end.
