unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, datamoduleconnect, login, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Menus, Data.DB, Vcl.Grids, Vcl.DBGrids, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, Xml.xmldom, Xml.XMLIntf,
  Xml.XMLDoc, System.StrUtils, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

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
    DSMain: TDataSource;
    QMain: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TBRefreshClick(Sender: TObject);
    procedure TBSaveClick(Sender: TObject);
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
  QMain.Open;
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

procedure TFMain.TBSaveClick(Sender: TObject);
begin
  with dm.QTemp, SQL do begin
    Close;
    Clear;
    Add('INSERT INTO VALCURS (VALUTE_ID, VALCURS_DATE, VALCURS_VALUE, USER_ID)');
    Add('VALUES(:VALUTE_ID, :VALCURS_DATE, :VALCURS_VALUE, :USER_ID)');
    ParamByName('VALUTE_ID').AsInteger := 1;
    ParamByName('VALCURS_DATE').AsDateTime := Now;
    ParamByName('VALCURS_VALUE').AsFloat := strToFloat(SGCbr.Cells[1,0]);
    ParamByName('USER_ID').AsInteger := User.id;
    ExecSQL;
  end;
end;

procedure TFMain.fillSG;
begin
  SGCbr.Cells[0,0] := '$';
  SGCbr.Cells[0,1] := '€';
  SGCbr.Cells[0,2] := '£';
end;

end.
