unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, datamoduleconnect, login, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TFMain = class(TForm)
    PUserInfo: TPanel;
    LUserName: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;


implementation

uses
  classuser;

{$R *.dfm}

procedure TFMain.FormCreate(Sender: TObject);
var
  Action : TCloseAction;
begin
  dm := Tdm.Create(self);
  FLogin := TFLogin.Create(Self);
  if FLogin.ShowModal <> mrOk then begin
    Close;
    Application.Terminate;
  end;
  LUsername.Caption := User.username;
end;

end.
