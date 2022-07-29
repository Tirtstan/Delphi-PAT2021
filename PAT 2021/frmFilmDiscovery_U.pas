unit frmFilmDiscovery_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.jpeg, Vcl.Buttons, math, dbPAT;

type
  TfrmFilmDiscovery = class(TForm)
    pnlFilmDiscovery: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnSignOut: TButton;
    imgCurrentlyPopular: TImage;
    imgTopSellers: TImage;
    imgRecentlyReleased: TImage;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    ScrollBox2: TScrollBox;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Image16: TImage;
    Image17: TImage;
    Image18: TImage;
    Image19: TImage;
    Image20: TImage;
    ScrollBox3: TScrollBox;
    Image21: TImage;
    Image22: TImage;
    Image23: TImage;
    Image24: TImage;
    Image25: TImage;
    Image26: TImage;
    Image27: TImage;
    Image28: TImage;
    Image29: TImage;
    Image30: TImage;
    Button1: TButton;
    procedure btnSignOutClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure Image11Click(Sender: TObject);
    procedure Image12Click(Sender: TObject);
    procedure Image13Click(Sender: TObject);
    procedure Image14Click(Sender: TObject);
    procedure Image15Click(Sender: TObject);
    procedure Image16Click(Sender: TObject);
    procedure Image17Click(Sender: TObject);
    procedure Image18Click(Sender: TObject);
    procedure Image19Click(Sender: TObject);
    procedure Image20Click(Sender: TObject);
    procedure Image21Click(Sender: TObject);
    procedure Image22Click(Sender: TObject);
    procedure Image23Click(Sender: TObject);
    procedure Image24Click(Sender: TObject);
    procedure Image25Click(Sender: TObject);
    procedure Image26Click(Sender: TObject);
    procedure Image27Click(Sender: TObject);
    procedure Image28Click(Sender: TObject);
    procedure Image29Click(Sender: TObject);
    procedure Image30Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  iMovieID: integer;
  frmFilmDiscovery: TfrmFilmDiscovery;
  arrMoviePosters: array [1 .. 30] of string = (
    'shrek.jpeg',
    'amongus.jpg',
    'pixels.jpg',
    'ben10.jpg',
    'minions.jpg',
    'iceage.jpg',
    'overthehedge.jpg',
    'tallgirl.jpg',
    'theloudhouse.jpg',
    'centralintelligence.jpg',
    'freeguy.jpg',
    'shrekforeverafter.jpg',
    'clutchpowers.jpg',
    'click.jpg',
    'rampage.jpg',
    'avatar.jpg',
    'starwars.jpeg',
    'bladerunner2049.jpg',
    'thegreenmile.jpg',
    'thelegomovie.jpg',
    'hesallthat.jpg',
    'diaryofawimpykid.jpg',
    'landofthelost.jpg',
    'fightclub.jpg',
    'fortnite.jpg',
    'wreckitralph.jpg',
    'lifeofpi.jpg',
    '1917.jpg',
    'epic.jpg',
    'sharknado.jpg'
  );

implementation

uses
  frmHomePage_U, frmMovieInfo_U;

{$R *.dfm}

procedure TfrmFilmDiscovery.BitBtn1Click(Sender: TObject);
begin
  Application.MainForm.Close;
  Application.Terminate;
end;

procedure TfrmFilmDiscovery.BitBtn2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmFilmDiscovery.btnSignOutClick(Sender: TObject);
begin
  frmFilmDiscovery.Hide;
  frmWelcome.show;
end;

procedure TfrmFilmDiscovery.Button1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmFilmDiscovery.FormCreate(Sender: TObject);
var
  iRandom1, iRandom2, iRandom3, iRandom4, i, j, iRepeat1, iRepeat2,
    iRepeat3: integer;
  bImage1, bImage2, bImage3, bImage4: boolean;
  y: integer;
begin

  iMovieID := 0;
  frmFilmDiscovery.Position := poScreenCenter;
  VertScrollBar.Range := 1100;
  HorzScrollBar.Range := 1000;

  ScrollBox1.HorzScrollBar.Visible := True;
  ScrollBox1.HorzScrollBar.Range := 1000;
  ScrollBox1.AutoScroll := True;

  ScrollBox2.HorzScrollBar.Range := 1000;
  ScrollBox2.AutoScroll := True;

  ScrollBox3.HorzScrollBar.Range := 1000;
  ScrollBox3.AutoScroll := True;
  ShowScrollBar(Handle, SB_BOTH, True);

  for i := 1 to 30 do
  begin
    case i of
      1:
        begin
          Image1.Proportional := True;
          Image1.Picture.LoadFromFile(arrMoviePosters[i]);
        end;
      2:
        begin
          Image2.Proportional := True;
          Image2.Picture.LoadFromFile(arrMoviePosters[i]);
        end;
      3:
        begin
          Image3.Proportional := True;
          Image3.Picture.LoadFromFile(arrMoviePosters[i]);
        end;
      4:
        begin
          Image4.Proportional := True;
          Image4.Picture.LoadFromFile(arrMoviePosters[i]);
        end;
      5:
        begin
          Image5.Proportional := True;
          Image5.Picture.LoadFromFile(arrMoviePosters[i]);
        end;
      6:
        begin
          Image6.Proportional := True;
          Image6.Picture.LoadFromFile(arrMoviePosters[i]);
        end;
      7:
        begin
          Image7.Proportional := True;
          Image7.Picture.LoadFromFile(arrMoviePosters[i]);
        end;
      8:
        begin
          Image8.Proportional := True;
          Image8.Picture.LoadFromFile(arrMoviePosters[i]);
        end;
      9:
        begin
          Image9.Proportional := True;
          Image9.Picture.LoadFromFile(arrMoviePosters[i]);
        end;
      10:
        begin
          Image10.Proportional := True;
          Image10.Picture.LoadFromFile(arrMoviePosters[i]);
        end;
      11:
        begin
          Image11.Proportional := True;
          Image11.Picture.LoadFromFile(arrMoviePosters[i]);
        end;
      12:
        begin
          Image12.Proportional := True;
          Image12.Picture.LoadFromFile(arrMoviePosters[i]);
        end;
      13:
        begin
          Image13.Proportional := True;
          Image13.Picture.LoadFromFile(arrMoviePosters[i]);
        end;
      14:
        begin
          Image14.Proportional := True;
          Image14.Picture.LoadFromFile(arrMoviePosters[i]);
        end;
      15:
        begin
          Image15.Proportional := True;
          Image15.Picture.LoadFromFile(arrMoviePosters[i]);
        end;
      16:
        begin
          Image16.Proportional := True;
          Image16.Picture.LoadFromFile(arrMoviePosters[i]);
        end;
      17:
        begin
          Image17.Proportional := True;
          Image17.Picture.LoadFromFile(arrMoviePosters[i]);
        end;
      18:
        begin
          Image18.Proportional := True;
          Image18.Picture.LoadFromFile(arrMoviePosters[i]);
        end;
      19:
        begin
          Image19.Proportional := True;
          Image19.Picture.LoadFromFile(arrMoviePosters[i]);
        end;
      20:
        begin
          Image20.Proportional := True;
          Image20.Picture.LoadFromFile(arrMoviePosters[i]);
        end;

      21:
        begin
          Image21.Proportional := True;
          Image21.Picture.LoadFromFile(arrMoviePosters[i]);
        end;
      22:
        begin
          Image22.Proportional := True;
          Image22.Picture.LoadFromFile(arrMoviePosters[i]);
        end;
      23:
        begin
          Image23.Proportional := True;
          Image23.Picture.LoadFromFile(arrMoviePosters[i]);
        end;
      24:
        begin
          Image24.Proportional := True;
          Image24.Picture.LoadFromFile(arrMoviePosters[i]);
        end;
      25:
        begin
          Image25.Proportional := True;
          Image25.Picture.LoadFromFile(arrMoviePosters[i]);
        end;
      26:
        begin
          Image26.Proportional := True;
          Image26.Picture.LoadFromFile(arrMoviePosters[i]);
        end;
      27:
        begin
          Image27.Proportional := True;
          Image27.Picture.LoadFromFile(arrMoviePosters[i]);
        end;
      28:
        begin
          Image28.Proportional := True;
          Image28.Picture.LoadFromFile(arrMoviePosters[i]);
        end;
      29:
        begin
          Image29.Proportional := True;
          Image29.Picture.LoadFromFile(arrMoviePosters[i]);
        end;
      30:
        begin
          Image30.Proportional := True;
          Image30.Picture.LoadFromFile(arrMoviePosters[i]);
        end;

    end;

  end;
end;

procedure TfrmFilmDiscovery.Image10Click(Sender: TObject);
begin
  frmFilmDiscovery.Hide;
  frmMovieInfo.show;
  iMovieID := 10;
end;

procedure TfrmFilmDiscovery.Image11Click(Sender: TObject);
begin
  frmFilmDiscovery.Hide;
  frmMovieInfo.show;
  iMovieID := 11;
end;

procedure TfrmFilmDiscovery.Image12Click(Sender: TObject);
begin
  frmFilmDiscovery.Hide;
  frmMovieInfo.show;
  iMovieID := 12;
end;

procedure TfrmFilmDiscovery.Image13Click(Sender: TObject);
begin
  frmFilmDiscovery.Hide;
  frmMovieInfo.Refresh;
  frmMovieInfo.show;
  iMovieID := 13;
end;

procedure TfrmFilmDiscovery.Image14Click(Sender: TObject);
begin
  frmFilmDiscovery.Hide;
  frmMovieInfo.show;
  iMovieID := 14;
end;

procedure TfrmFilmDiscovery.Image15Click(Sender: TObject);
begin
  frmFilmDiscovery.Hide;
  frmMovieInfo.show;
  iMovieID := 15;
end;

procedure TfrmFilmDiscovery.Image16Click(Sender: TObject);
begin
  frmFilmDiscovery.Hide;
  frmMovieInfo.show;
  iMovieID := 16;
end;

procedure TfrmFilmDiscovery.Image17Click(Sender: TObject);
begin
  frmFilmDiscovery.Hide;
  frmMovieInfo.show;
  iMovieID := 17;
end;

procedure TfrmFilmDiscovery.Image18Click(Sender: TObject);
begin
  frmFilmDiscovery.Hide;
  frmMovieInfo.show;
  iMovieID := 18;
end;

procedure TfrmFilmDiscovery.Image19Click(Sender: TObject);
begin
  frmFilmDiscovery.Hide;
  frmMovieInfo.show;
  iMovieID := 19;
end;

procedure TfrmFilmDiscovery.Image1Click(Sender: TObject);
begin
  frmFilmDiscovery.Hide;
  frmMovieInfo.show;
  iMovieID := 1;
end;

procedure TfrmFilmDiscovery.Image20Click(Sender: TObject);
begin
  frmFilmDiscovery.Hide;
  frmMovieInfo.show;
  iMovieID := 20;
end;

procedure TfrmFilmDiscovery.Image21Click(Sender: TObject);
begin
  frmFilmDiscovery.Hide;
  frmMovieInfo.show;
  iMovieID := 21;
end;

procedure TfrmFilmDiscovery.Image22Click(Sender: TObject);
begin
  frmFilmDiscovery.Hide;
  frmMovieInfo.show;
  iMovieID := 22;
end;

procedure TfrmFilmDiscovery.Image23Click(Sender: TObject);
begin
  frmFilmDiscovery.Hide;
  frmMovieInfo.show;
  iMovieID := 23;
end;

procedure TfrmFilmDiscovery.Image24Click(Sender: TObject);
begin
  frmFilmDiscovery.Hide;
  frmMovieInfo.show;
  iMovieID := 24;
end;

procedure TfrmFilmDiscovery.Image25Click(Sender: TObject);
begin
  frmFilmDiscovery.Hide;
  frmMovieInfo.show;
  iMovieID := 25;
end;

procedure TfrmFilmDiscovery.Image26Click(Sender: TObject);
begin
  frmFilmDiscovery.Hide;
  frmMovieInfo.show;
  iMovieID := 26;
end;

procedure TfrmFilmDiscovery.Image27Click(Sender: TObject);
begin
  frmFilmDiscovery.Hide;
  frmMovieInfo.show;
  iMovieID := 27;
end;

procedure TfrmFilmDiscovery.Image28Click(Sender: TObject);
begin
  frmFilmDiscovery.Hide;
  frmMovieInfo.show;
  iMovieID := 28;
end;

procedure TfrmFilmDiscovery.Image29Click(Sender: TObject);
begin
  frmFilmDiscovery.Hide;
  frmMovieInfo.show;
  iMovieID := 29;
end;

procedure TfrmFilmDiscovery.Image2Click(Sender: TObject);
begin
  frmFilmDiscovery.Hide;
  frmMovieInfo.show;
  iMovieID := 2;
end;

procedure TfrmFilmDiscovery.Image30Click(Sender: TObject);
begin
  frmFilmDiscovery.Hide;
  frmMovieInfo.show;
  iMovieID := 30;
end;

procedure TfrmFilmDiscovery.Image3Click(Sender: TObject);
begin
  frmFilmDiscovery.Hide;
  frmMovieInfo.show;
  iMovieID := 3;
end;

procedure TfrmFilmDiscovery.Image4Click(Sender: TObject);
begin
  frmFilmDiscovery.Hide;
  frmMovieInfo.show;
  iMovieID := 4;
end;

procedure TfrmFilmDiscovery.Image5Click(Sender: TObject);
begin
  frmFilmDiscovery.Hide;
  frmMovieInfo.show;
  iMovieID := 5;
end;

procedure TfrmFilmDiscovery.Image6Click(Sender: TObject);
begin
  frmFilmDiscovery.Hide;
  frmMovieInfo.show;
  iMovieID := 6;
end;

procedure TfrmFilmDiscovery.Image7Click(Sender: TObject);
begin
  frmFilmDiscovery.Hide;
  frmMovieInfo.show;
  iMovieID := 7;
end;

procedure TfrmFilmDiscovery.Image8Click(Sender: TObject);
begin
  frmFilmDiscovery.Hide;
  frmMovieInfo.show;
  iMovieID := 8;
end;

procedure TfrmFilmDiscovery.Image9Click(Sender: TObject);
begin
  frmFilmDiscovery.Hide;
  frmMovieInfo.show;
  iMovieID := 9;
end;

end.
