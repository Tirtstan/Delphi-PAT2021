unit dbPAT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, Data.DB, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Buttons, ADODB;

type
  TdbmPAT = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    conPAT2021DB: TADOConnection;
    tblCriticReviews, tblMovies, tblUserReviews, tblUsers: TADOTable;
    dsrCriticReviews, dsrMovies, dsrUserReviews, dsrUsers: TDataSource;
  end;

var
  dbmPAT: TdbmPAT;

implementation

uses
  frmAdminPage_U;

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TdbmPAT.DataModuleCreate(Sender: TObject);
begin

  conPAT2021DB := TADOConnection.Create(dbmPAT);

  tblCriticReviews := TADOTable.Create(dbmPAT);
  tblMovies := TADOTable.Create(dbmPAT);
  tblUserReviews := TADOTable.Create(dbmPAT);
  tblUsers := TADOTable.Create(dbmPAT);

  dsrCriticReviews := TDataSource.Create(dbmPAT);
  dsrMovies := TDataSource.Create(dbmPAT);
  dsrUserReviews := TDataSource.Create(dbmPAT);
  dsrUsers := TDataSource.Create(dbmPAT);

  conPAT2021DB.Close;
  conPAT2021DB.ConnectionString :=
    'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=' +
    ExtractFilePath(ParamStr(0)) + 'PAT2021DB.mdb' +
    ';Persist Security Info=False';

  conPAT2021DB.LoginPrompt := False;
  conPAT2021DB.Open;

  tblCriticReviews.Connection := conPAT2021DB;
  tblCriticReviews.TableName := 'tblCriticReviews';

  tblMovies.Connection := conPAT2021DB;
  tblMovies.TableName := 'tblMovies';

  tblUserReviews.Connection := conPAT2021DB;
  tblUserReviews.TableName := 'tblUserReviews';

  tblUsers.Connection := conPAT2021DB;
  tblUsers.TableName := 'tblUsers';

  dsrCriticReviews.DataSet := tblCriticReviews;
  dsrMovies.DataSet := tblMovies;
  dsrUserReviews.DataSet := tblUserReviews;
  dsrUsers.DataSet := tblUsers;

  tblCriticReviews.Open;
  tblMovies.Open;
  tblUserReviews.Open;
  tblUsers.Open;
end;

end.
