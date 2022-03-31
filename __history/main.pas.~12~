unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, datamoduleconnect, login, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Menus, Data.DB, Vcl.Grids, Vcl.DBGrids, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Xml.xmldom, Xml.XMLIntf,
  Xml.XMLDoc, System.StrUtils;

type
  TFMain = class(TForm)
    PUserInfo: TPanel;
    LUserName: TLabel;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    DBMain: TDBGrid;
    SGCbr: TStringGrid;
    LCbr: TLabel;
    TBRefresh: TButton;
    TBSave: TButton;
    HTTP: TIdHTTP;
    XMLDocument: TXMLDocument;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TBRefreshClick(Sender: TObject);
  private
    procedure fillSG;
  public
    { Public declarations }
  end;

var
  FMain: TFMain;


implementation

uses
  classuser;

{$R *.dfm}

procedure TFMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  User.Free;
  User := nil;
end;

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
  XMLDocument := TXMLDocument.Create(self);
  LUsername.Caption := User.username;
  fillSG;
end;

procedure TFMain.TBRefreshClick(Sender: TObject);
var
  i : integer;
  StringStream : TStringStream;
  xmlNode : IXMLNode;
begin
  try
    StringStream := TStringStream.Create(
      HTTP.Get('http://www.cbr.ru/scripts/XML_daily.asp?date_req=' + DateToStr(Now))
    );
  except
    ShowMessage('Ошибка.');
  end;
  XMLDocument.LoadFromStream(StringStream);
  for i := 0 to XMLDocument.ChildNodes['ValCurs'].ChildNodes.Count - 1 do begin
    xmlNode := XMLDocument.ChildNodes['ValCurs'].ChildNodes[i];
    Case IndexStr(xmlNode.Attributes['ID'], ['R01235', 'R01239', 'R01035']) of
      0 : SGCbr.Cells[1,0] := xmlNode.ChildNodes['Value'].Text; // $
      1 : SGCbr.Cells[1,1] := xmlNode.ChildNodes['Value'].Text; // €
      2 : SGCbr.Cells[1,2] := xmlNode.ChildNodes['Value'].Text; // £
    end;
  end;

end;

procedure TFMain.fillSG;
begin
  SGCbr.Cells[0,0] := '$';
  SGCbr.Cells[0,1] := '€';
  SGCbr.Cells[0,2] := '£';
end;

end.
