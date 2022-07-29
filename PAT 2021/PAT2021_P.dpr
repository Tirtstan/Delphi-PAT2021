program PAT2021_P;

uses
  Vcl.Forms,
  frmHomePage_U in 'frmHomePage_U.pas' {frmWelcome},
  frmLoginPage_U in 'frmLoginPage_U.pas' {frmLogin},
  frmRegisterPage_U in 'frmRegisterPage_U.pas' {frmRegister},
  frmFilmDiscovery_U in 'frmFilmDiscovery_U.pas' {frmFilmDiscovery},
  frmMovieInfo_U in 'frmMovieInfo_U.pas' {frmMovieInfo},
  clsValidation_U in 'clsValidation_U.pas',
  frmAdminPage_U in 'frmAdminPage_U.pas' {frmAdmin},
  dbPAT in 'dbPAT.pas' {dbmPAT: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmWelcome, frmWelcome);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmRegister, frmRegister);
  Application.CreateForm(TfrmFilmDiscovery, frmFilmDiscovery);
  Application.CreateForm(TfrmMovieInfo, frmMovieInfo);
  Application.CreateForm(TfrmAdmin, frmAdmin);
  Application.CreateForm(TdbmPAT, dbmPAT);
  Application.Run;
end.
