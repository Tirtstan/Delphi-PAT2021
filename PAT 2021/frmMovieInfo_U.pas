unit frmMovieInfo_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ComCtrls, Vcl.Buttons, dbPAT;

type
  TfrmMovieInfo = class(TForm)
    Panel1: TPanel;
    imgMovieInfo: TImage;
    btnBackMovieInfo: TButton;
    imgStar1: TImage;
    imgStar2: TImage;
    imgStar3: TImage;
    imgStar4: TImage;
    imgStar5: TImage;
    redCritic: TRichEdit;
    Label1: TLabel;
    redUser: TRichEdit;
    Label2: TLabel;
    redDescription: TRichEdit;
    Label3: TLabel;
    btnReview: TBitBtn;
    btnDeleteReview: TBitBtn;
    redWriteAReview: TRichEdit;
    pnlLoading: TPanel;
    btnGo: TButton;
    lblMovieName: TLabel;
    lblDate: TLabel;
    lblDirector: TLabel;
    lblDistributor: TLabel;
    lblGenre: TLabel;
    lblBoxOffice: TLabel;
    lblLength: TLabel;
    Button1: TButton;
    btnConfirmReview: TBitBtn;
    lblMaxCharacters: TLabel;
    procedure btnBackMovieInfoClick(Sender: TObject);
    procedure btnConfirmReviewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnReviewClick(Sender: TObject);
    procedure btnDeleteReviewClick(Sender: TObject);
    procedure redWriteAReviewChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMovieInfo: TfrmMovieInfo;
  sUserRating: string;
  iUserReviewID: integer;

implementation

uses
  frmFilmDiscovery_U, frmLoginPage_U;

{$R *.dfm}

procedure TfrmMovieInfo.btnConfirmReviewClick(Sender: TObject);
var
  dCurrentDate: TDateTime;

begin
  dCurrentDate := now;
  dbmPAT.tblUserReviews.Open;

  iUserReviewID := 0;

  with dbmPAT do
  begin
    tblUserReviews.Last;
    iUserReviewID := tblUserReviews['UserReviewID'];
    tblUserReviews.insert;
    tblUserReviews.Append;
    tblUserReviews['UserReviewID'] := iUserReviewID + 2;
    tblUserReviews['UserReview'] := redWriteAReview.Text;
    tblUserReviews['UserID'] := iUserID;
    tblUserReviews['MovieID'] := iMovieID;
    tblUserReviews['UserRating'] := StrToInt(sUserRating);
    tblUserReviews['UserReviewDate'] := DateToStr(dCurrentDate);
    tblUserReviews.Post;
    tblUserReviews.Refresh;
  end;
  ShowMessage('Review Posted!');

  redUser.Clear;
  dbmPAT.tblUserReviews.First;

  while not(dbmPAT.tblUserReviews.Eof) do
  begin
    if dbmPAT.tblUserReviews['MovieID'] = iMovieID then
    begin
      redUser.Lines.Add('(' + IntToStr(dbmPAT.tblUserReviews['UserRating']) +
        ') ' + DateToStr(dbmPAT.tblUserReviews['UserReviewDate']));
      redUser.Lines.Add(dbmPAT.tblUserReviews['UserReview'] + #13);
    end;
    dbmPAT.tblUserReviews.Next;
  end;

  btnConfirmReview.Visible := false;
  redWriteAReview.Visible := false;
  btnDeleteReview.Enabled := true;
  lblMaxCharacters.Visible := false;
end;

procedure TfrmMovieInfo.btnBackMovieInfoClick(Sender: TObject);
begin
  frmMovieInfo.Hide;
  frmFilmDiscovery.Show;
  pnlLoading.Visible := true;
end;

procedure TfrmMovieInfo.btnDeleteReviewClick(Sender: TObject);
var
  bFlag: boolean;
  iYesOrNo: integer;
begin
  dbmPAT.tblUserReviews.Open;
  dbmPAT.tblUserReviews.First;
  iYesOrNo := MessageDlg('Are you sure you want to delete your review?',
    mtConfirmation, [mbYes, mbNo], 0, mbYes);

  if iYesOrNo = mrYes then
  begin
    bFlag := false;
    while not(dbmPAT.tblUserReviews.Eof) AND (bFlag = false) do
    begin
      if dbmPAT.tblUserReviews['UserID'] = iUserID then
      begin
        dbmPAT.tblUserReviews.Delete;
        dbmPAT.tblUserReviews.Refresh;
        bFlag := true;
      end;
      dbmPAT.tblUserReviews.Next;
    end;

    ShowMessage('Review deleted!');
    btnReview.Enabled := true;
    btnDeleteReview.Enabled := false;

    redUser.Clear;
    dbmPAT.tblUsers.Open;
    dbmPAT.tblUsers.First;
    dbmPAT.tblUserReviews.First;

    while not(dbmPAT.tblUserReviews.Eof) do
    begin
      if (dbmPAT.tblUserReviews['MovieID'] = iMovieID) then
      begin
        redUser.Lines.Add('(' + IntToStr(dbmPAT.tblUserReviews['UserRating']) +
          ') ' + DateToStr(dbmPAT.tblUserReviews['UserReviewDate']));
        redUser.Lines.Add(dbmPAT.tblUserReviews['UserReview'] + #13);
      end;
      dbmPAT.tblUserReviews.Next;
    end;
  end
  else if iYesOrNo = mrNo then
  begin
    btnReview.Enabled := false;
    btnDeleteReview.Enabled := true;
  end;

end;

procedure TfrmMovieInfo.btnGoClick(Sender: TObject);
var
  i, iPos, k, iAverageUserRating, iSumUserRating: integer;
  tDescriptions: TextFile;
  sLine, sDescriptions, sMovieID: string;
  bFlag: boolean;
  iCount: integer;
begin
  btnReview.Enabled := true;
  btnDeleteReview.Enabled := false;

  imgStar1.Visible := false;
  imgStar2.Visible := false;
  imgStar3.Visible := false;
  imgStar4.Visible := false;
  imgStar5.Visible := false;

  redCritic.Clear;
  redUser.Clear;
  redDescription.Clear;
  redWriteAReview.Clear;

  bFlag := true;

  if FileExists('descriptions.txt') then
  begin
    assignfile(tDescriptions, 'descriptions.txt');
    Reset(tDescriptions);
    while NOT(sMovieID = IntToStr(iMovieID)) AND (bFlag = true) do
    begin
      readln(tDescriptions, sLine);
      iPos := pos('|', sLine);
      sMovieID := copy(sLine, 1, iPos - 1);
      if sMovieID = IntToStr(iMovieID) then
      begin
        Delete(sLine, 1, iPos);
        iPos := pos('.', sLine);
        sDescriptions := copy(sLine, 1, iPos);
        redDescription.Text := (sDescriptions);
        bFlag := false;
      end;
    end;
    closeFile(tDescriptions);
  end
  else
  begin
    ShowMessage('"Descriptions" file for a movie''s info is missing.');
    closeFile(tDescriptions);
  end;

  dbmPAT.tblCriticReviews.Open;
  dbmPAT.tblMovies.Open;
  dbmPAT.tblUserReviews.Open;
  dbmPAT.tblUsers.Open;

  dbmPAT.tblMovies.First;
  dbmPAT.tblUserReviews.First;
  dbmPAT.tblCriticReviews.First;
  dbmPAT.tblUsers.First;

  pnlLoading.Visible := false;

  while NOT(dbmPAT.tblMovies['MovieID'] = iMovieID) do
  begin
    dbmPAT.tblMovies.Next;
  end;

  for i := 1 to 30 do
  begin
    if i = iMovieID then
    begin
      imgMovieInfo.Picture.LoadFromFile(arrMoviePosters[iMovieID]);
      with dbmPAT do
      begin
        lblMovieName.Caption := tblMovies['MovieName'];
        lblDate.Caption := tblMovies['ReleaseDate'];
        lblDirector.Caption := tblMovies['DirectorName'];
        lblDistributor.Caption := tblMovies['DistributorName'];
        lblGenre.Caption := tblMovies['GenreType'];
        lblBoxOffice.Caption := tblMovies['BoxOfficeAmount'];
        lblLength.Caption := tblMovies['MovieLength'];
      end;
    end;
  end;

  iCount := 1;
  while not(dbmPAT.tblUserReviews.Eof) do
  begin
    if dbmPAT.tblUserReviews['MovieID'] = iMovieID then
    begin
      redUser.Lines.Add('(' + IntToStr(dbmPAT.tblUserReviews['UserRating']) +
        ') ' + DateToStr(dbmPAT.tblUserReviews['UserReviewDate']));
      redUser.Lines.Add(dbmPAT.tblUserReviews['UserReview'] + #13);
    end;
    inc(iCount);
    iSumUserRating := iSumUserRating + dbmPAT.tblUserReviews['UserRating'];
    dbmPAT.tblUserReviews.Next;
  end;

  iAverageUserRating := iSumUserRating div iCount;

  if iAverageUserRating = 1 then
  begin
    imgStar1.Visible := true;
  end;
  if iAverageUserRating = 2 then
  begin
    imgStar1.Visible := true;
    imgStar2.Visible := true;
  end;
  if iAverageUserRating = 3 then
  begin
    imgStar1.Visible := true;
    imgStar2.Visible := true;
    imgStar3.Visible := true;
  end;
  if iAverageUserRating = 4 then
  begin
    imgStar1.Visible := true;
    imgStar2.Visible := true;
    imgStar3.Visible := true;
    imgStar4.Visible := true;
  end;
  if iAverageUserRating = 5 then
  begin
    imgStar1.Visible := true;
    imgStar2.Visible := true;
    imgStar3.Visible := true;
    imgStar4.Visible := true;
    imgStar5.Visible := true;
  end;

  while not(dbmPAT.tblCriticReviews.Eof) do
  begin
    if dbmPAT.tblCriticReviews['MovieID'] = dbmPAT.tblMovies['MovieID'] then
    begin
      redCritic.Lines.Add(dbmPAT.tblCriticReviews['CriticName'] + ' (' +
        IntToStr(dbmPAT.tblCriticReviews['CriticReviews']) + ') ' + #13 +
        DateToStr(dbmPAT.tblCriticReviews['CriticReviewDate']));
      redCritic.Lines.Add(dbmPAT.tblCriticReviews['CriticReviewQuote'] + #13);
    end;
    dbmPAT.tblCriticReviews.Next;
  end;

  dbmPAT.tblCriticReviews.First;
  while not(dbmPAT.tblCriticReviews['MovieID'] = iMovieID) do
  begin
    dbmPAT.tblCriticReviews.Next;
  end;

  bFlag := false;
  dbmPAT.tblUserReviews.First;
  repeat
    if dbmPAT.tblUserReviews['UserID'] = iUserID then
    begin
      bFlag := true;
    end;
    dbmPAT.tblUserReviews.Next;
  until (dbmPAT.tblUserReviews.Eof) OR (bFlag = true);

  if (dbmPAT.tblUserReviews['UserID'] = dbmPAT.tblUsers['UserID']) AND
    (dbmPAT.tblUserReviews['MovieID'] = dbmPAT.tblMovies['MovieID']) then
  begin
    btnReview.Enabled := false;
    btnDeleteReview.Enabled := true;
  end;

end;

procedure TfrmMovieInfo.btnReviewClick(Sender: TObject);
begin
  sUserRating := InputBox('User rating of the movie',
    'Enter a number from 1 to 5', '');
  if (sUserRating = '1') or (sUserRating = '2') or (sUserRating = '3') or
    (sUserRating = '4') or (sUserRating = '5') then
  begin
    redWriteAReview.Visible := true;
    btnReview.Enabled := false;
    btnConfirmReview.Visible := true;
  end
  else
  begin
    ShowMessage('Value doesn''t fall into ''1 to 5''');
  end;
  lblMaxCharacters.Visible := true;
end;

procedure TfrmMovieInfo.Button1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMovieInfo.FormCreate(Sender: TObject);
begin
  frmMovieInfo.Position := poScreenCenter;
  pnlLoading.Visible := true;
  btnConfirmReview.Visible := false;
  redWriteAReview.MaxLength := 255;
  lblMaxCharacters.Visible := false;

end;

procedure TfrmMovieInfo.redWriteAReviewChange(Sender: TObject);
var
  iCharactersLeft: integer;
begin
  iCharactersLeft := 255 - (length(redWriteAReview.Text));
  lblMaxCharacters.Caption := 'Characters Left: ' + IntToStr(iCharactersLeft);
end;

end.
