program wf;

uses
  Vcl.Forms,
  main in 'main.pas' {FMain},
  datamoduleconnect in 'datamoduleconnect.pas' {dm: TDataModule},
  login in 'common\login.pas' {FLogin},
  classuser in 'common\classuser.pas',
  classconnection in 'common\classconnection.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
