unit frmAdminPage_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, dbPAT, ComCtrls, Data.DB, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Buttons, ADODB;

type
  TfrmAdmin = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    btnBackAdmin: TButton;
    Label2: TLabel;
    dbgCriticReviews: TDBGrid;
    Label3: TLabel;
    dbgUsers: TDBGrid;
    Label4: TLabel;
    dbgUserReviews: TDBGrid;
    dbgMovies: TDBGrid;
    dbnMovies: TDBNavigator;
    dbnCriticReviews: TDBNavigator;
    dbnUsers: TDBNavigator;
    dbnUserReviews: TDBNavigator;
    Button1: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnBackAdminClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdmin: TfrmAdmin;

implementation

uses
  frmLoginPage_U;

{$R *.dfm}

procedure TfrmAdmin.BitBtn1Click(Sender: TObject);
begin
  Application.MainForm.Close;
  Application.Terminate;
end;

procedure TfrmAdmin.btnBackAdminClick(Sender: TObject);
begin
  frmAdmin.Hide;
  frmLogin.show;
end;

procedure TfrmAdmin.Button1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmAdmin.FormCreate(Sender: TObject);
begin
  frmAdmin.Position := poScreenCenter;
end;

procedure TfrmAdmin.FormShow(Sender: TObject);
begin


  // Allow for scrolling

  VertScrollBar.Range := 1000;
  ShowScrollBar(Handle, SB_BOTH, True);

  // Connecting tables to grids

  dbmPAT.tblMovies.Open;
  dbgMovies.DataSource := dbmPAT.dsrMovies;

  dbmPAT.tblCriticReviews.Open;
  dbgCriticReviews.DataSource := dbmPAT.dsrCriticReviews;

  dbmPAT.tblUserReviews.Open;
  dbgUserReviews.DataSource := dbmPAT.dsrUserReviews;

  dbmPAT.tblUsers.Open;
  dbgUsers.DataSource := dbmPAT.dsrUsers;

  // Correct Format for grids
  with dbgMovies do
  begin
    Columns[0].Width := 100;
    Columns[1].Width := 300;
    Columns[2].Width := 200;
    Columns[3].Width := 200;
    Columns[4].Width := 200;
    Columns[5].Width := 200;
    Columns[6].Width := 200;
    Columns[7].Width := 100;
  end;

  with dbgCriticReviews do
  begin
    Columns[0].Width := 100;
    Columns[1].Width := 100;
    Columns[2].Width := 100;
    Columns[3].Width := 100;
    Columns[4].Width := 200;
    Columns[5].Width := 400;
  end;

  with dbgUserReviews do
  begin
    Columns[0].Width := 100;
    Columns[1].Width := 400;
    Columns[2].Width := 100;
    Columns[3].Width := 100;
    Columns[4].Width := 200;
  end;

  with dbgUsers do
  begin
    Columns[0].Width := 100;
    Columns[1].Width := 100;
    Columns[2].Width := 200;
    Columns[3].Width := 300;
    Columns[4].Width := 200;
    Columns[5].Width := 200;
    Columns[6].Width := 100;
  end;

  dbgMovies.Font.Color := clBlack;
  dbgCriticReviews.Font.Color := clBlack;
  dbgUserReviews.Font.Color := clBlack;
  dbgUsers.Font.Color := clBlack;

  // Sorting Database Correctly

  with dbmPAT do
  begin
    tblMovies.Sort := 'MovieID ASC';
    tblCriticReviews.Sort := 'CriticID ASC';
    tblUserReviews.Sort := 'UserID ASC';
    tblUsers.Sort := 'UserID ASC';
  end;

  // DB navigator

  dbnMovies.DataSource := dbmPAT.dsrMovies;
  dbnCriticReviews.DataSource := dbmPAT.dsrCriticReviews;
  dbnUserReviews.DataSource := dbmPAT.dsrUserReviews;
  dbnUsers.DataSource := dbmPAT.dsrUsers;
end;

end.
