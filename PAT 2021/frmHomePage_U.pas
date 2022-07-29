unit frmHomePage_U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.ComCtrls;

type
  TfrmWelcome = class(TForm)
    pnlWelcome: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btnLogin: TButton;
    btnRegister: TButton;
    redHelp: TRichEdit;
    btnClose: TButton;
    btnHelp: TBitBtn;
    Button1: TButton;
    procedure btnLoginClick(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWelcome: TfrmWelcome;

implementation

uses
  frmLoginPage_U, frmRegisterPage_U, frmFilmDiscovery_U;

{$R *.dfm}

procedure TfrmWelcome.BitBtn1Click(Sender: TObject);
begin
  Application.MainForm.Close;
  Application.Terminate;
  exit;
end;

procedure TfrmWelcome.BitBtn2Click(Sender: TObject);
begin
  redHelp.Visible := true;
  btnClose.Visible := true;
  btnHelp.Visible := false;
end;

procedure TfrmWelcome.btnCloseClick(Sender: TObject);
begin
  redHelp.Visible := false;
  btnClose.Visible := false;
  btnHelp.Visible := true;
end;

procedure TfrmWelcome.btnHelpClick(Sender: TObject);
begin
  redHelp.Visible := true;
  btnClose.Visible := true;
  btnHelp.Visible := false;
end;

procedure TfrmWelcome.btnLoginClick(Sender: TObject);
begin
  frmWelcome.hide;
  frmLogin.show;

end;

procedure TfrmWelcome.btnRegisterClick(Sender: TObject);
begin
  frmWelcome.hide;
  frmRegister.show;
end;

procedure TfrmWelcome.Button1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmWelcome.FormCreate(Sender: TObject);
begin
  frmWelcome.Position := poScreenCenter;
  redHelp.Visible := false;
  btnClose.Visible := false;
  redHelp.Text :=
    'If ''Login'' isn''t working, try registering! Click the register button and fill in the correct infomation required. Admin codes is Email: admin, Password: admin';
end;

procedure TfrmWelcome.FormShow(Sender: TObject);
begin
  btnRegister.SetFocus;
end;

end.
