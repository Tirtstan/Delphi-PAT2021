unit frmLoginPage_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  dbPAT, Vcl.Imaging.pngimage;

type
  TfrmLogin = class(TForm)
    pnlRegister: TPanel;
    Label2: TLabel;
    edtEmailL: TEdit;
    btnLogin: TButton;
    edtPasswordL: TEdit;
    btnBackLogin: TButton;
    Label1: TLabel;
    Label3: TLabel;
    btnRegisterL: TButton;
    lblErrorEmailL: TLabel;
    lblErrorPasswordL: TLabel;
    ckbPassword: TCheckBox;
    Button1: TButton;
    procedure btnBackLoginClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure btnRegisterLClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure ckbPasswordClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;
  bEmail, bPassword: boolean;
  iUserID: integer;

implementation

uses
  frmHomePage_U, frmFilmDiscovery_U, frmRegisterPage_U, frmAdminPage_U,
  frmMovieInfo_U;

{$R *.dfm}

procedure TfrmLogin.BitBtn1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmLogin.btnBackLoginClick(Sender: TObject);
begin
  frmLogin.hide;
  frmWelcome.Show;
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
var
  bFlag: boolean;
begin

  bEmail := false;
  bPassword := false;
  bFlag := false;
  iUserID := 0;

  dbmPAT.tblUsers.First;
  while NOT(dbmPAT.tblUsers.EOF) AND (bFlag = false) do
  begin
    inc(iUserID);
    if (edtEmailL.Text = dbmPAT.tblUsers['Email']) AND
      (edtPasswordL.Text = dbmPAT.tblUsers['Password']) then
    begin
      bEmail := true;
      bPassword := true;
      lblErrorEmailL.Font.Color := clYellow;
      lblErrorEmailL.Caption := 'Email correct!';
      bFlag := true;
      ShowMessage('Successfully Logged-In!');
    end;
    dbmPAT.tblUsers.Next;
  end;

  if (bEmail = true) AND (bPassword = true) then
  begin
    lblErrorEmailL.Font.Color := clLime;
    lblErrorEmailL.Caption := 'Email correct!';
    lblErrorPasswordL.Font.Color := clLime;
    lblErrorPasswordL.Caption := 'Password Correct!';
    frmLogin.hide;
    frmFilmDiscovery.Show;
  end
  else
  begin
    lblErrorEmailL.Font.Color := clYellow;
    lblErrorEmailL.Caption := 'Email or password is wrong.';
    lblErrorPasswordL.Font.Color := clYellow;
    lblErrorPasswordL.Caption := 'Email or password is wrong.';
  end;

  // Admin Page

  if (edtEmailL.Text = 'admin') AND (edtPasswordL.Text = 'admin') then
  begin
    lblErrorEmailL.Font.Color := clLime;
    lblErrorEmailL.Caption := 'Email correct!';
    lblErrorPasswordL.Font.Color := clLime;
    lblErrorPasswordL.Caption := 'Password Correct!';
    frmLogin.hide;
    frmAdmin.Show;
  end;
end;

procedure TfrmLogin.btnRegisterLClick(Sender: TObject);
begin
  frmLogin.hide;
  frmRegister.Show;
end;

procedure TfrmLogin.Button1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmLogin.ckbPasswordClick(Sender: TObject);
begin

  if ckbPassword.Checked = false then
  begin
    edtPasswordL.PasswordChar := '*';
  end
  else
  begin
    edtPasswordL.PasswordChar := #0;
  end;

end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin

  ckbPassword.Checked := false;
  frmLogin.Position := poScreenCenter;
  edtPasswordL.PasswordChar := '*';
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  btnBackLogin.SetFocus;
end;

procedure TfrmLogin.Image1Click(Sender: TObject);
begin
  edtPasswordL.PasswordChar := #0;
end;

end.
