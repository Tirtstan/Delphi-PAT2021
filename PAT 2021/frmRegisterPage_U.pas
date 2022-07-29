unit frmRegisterPage_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, buttons, StdCtrls, ExtCtrls, clsValidation_U, dbPAT;

type
  TfrmRegister = class(TForm)
    pnlRegister: TPanel;
    Label1: TLabel;
    edtNameR: TEdit;
    btnBackRegister: TButton;
    edtSurnameR: TEdit;
    edtIDR: TEdit;
    edtPhoneNumberR: TEdit;
    edtEmailR: TEdit;
    edtPasswordR: TEdit;
    edtEmailConfirm: TEdit;
    btnRegister: TButton;
    Label2: TLabel;
    lblErrorNameR: TLabel;
    lblErrorSurnameR: TLabel;
    lblErrorEmailR: TLabel;
    lblErrorPhoneNumberR: TLabel;
    lblErrorEmailConfirmR: TLabel;
    lblErrorIDR: TLabel;
    lblErrorPasswordR: TLabel;
    Button1: TButton;
    ckbPasswordR: TCheckBox;
    procedure btnBackRegisterClick(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtIDRChange(Sender: TObject);
    procedure edtPhoneNumberRChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ckbPasswordRClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmRegister: TfrmRegister;
  obj: TValidation;

implementation

uses
  frmHomePage_U, frmLoginPage_U;

{$R *.dfm}

procedure TfrmRegister.BitBtn1Click(Sender: TObject);
begin
  Application.MainForm.Close;
  Application.Terminate;
  exit;
end;

procedure TfrmRegister.btnBackRegisterClick(Sender: TObject);
begin
  frmRegister.Hide;
  frmWelcome.Show;
end;

procedure TfrmRegister.btnRegisterClick(Sender: TObject);
Var
  sSymbol, sNamePart, sServerPart, s, sTarget: string;
  bFlag, bNamePart, bServerPart, bName, bPassword, bID, bPhoneNumber, bSurname,
    bEmail, bConfirmEmail, bEmailDatabase, bPhoneNumberDatabase,
    bIDDatabase: boolean;
  i, iUserID, iLength: Integer;
begin

  // Name Validation

  bName := false;

  if Length(edtNameR.Text) <> 0 then
  begin
    if edtNameR.Text = 'Enter name here' then
    begin
      lblErrorNameR.Caption := 'Use different name.';
      bFlag := false;
    end
    else
    begin
      i := 1;
      bFlag := true;
      while (i <= Length(edtNameR.Text)) AND (bFlag = true) do
      begin
        if not(upcase(edtNameR.Text[i]) in ['A' .. 'Z', ' ']) then
        begin
          bFlag := false;
          lblErrorNameR.Caption := 'Invalid name.';
        end;
        inc(i);
      end;
    end;
  end
  else
  begin
    bFlag := false;
    lblErrorNameR.Caption := ('Name required.');
  end;

  bName := bFlag;
  if bName = true then
  begin
    lblErrorNameR.Font.Color := clLime;
    lblErrorNameR.Caption := 'Valid name.';
  end;

  // Surname Validation

  bSurname := false;

  if Length(edtSurnameR.Text) <> 0 then
  begin
    if edtSurnameR.Text = 'Enter surname here' then
    begin
      lblErrorSurnameR.Caption := 'Use different surname.';
      bFlag := false;
    end
    else
    begin
      i := 1;
      bFlag := true;
      while (i <= Length(edtSurnameR.Text)) AND (bFlag = true) do
      begin
        if not(upcase(edtSurnameR.Text[i]) in ['A' .. 'Z', ' ']) then
        begin
          bFlag := false;
          lblErrorSurnameR.Caption := 'Invalid surname.';
        end;
        inc(i);
      end;
    end;
  end
  else
  begin
    bFlag := false;
    lblErrorSurnameR.Caption := ('Surname required.');
  end;

  bSurname := bFlag;
  if bSurname = true then
  begin
    lblErrorSurnameR.Font.Color := clLime;
    lblErrorSurnameR.Caption := 'Valid surname.';
  end;

  // Phone Number

  bPhoneNumber := false;

  i := 0;

  for i := 1 to Length(edtPhoneNumberR.Text) do
  begin
    if NOT(Length(edtPhoneNumberR.Text) = 10) OR
      NOT(edtPhoneNumberR.Text[1] = '0') OR
      ((edtPhoneNumberR.Text[i] < '0') OR (edtPhoneNumberR.Text[i] > '9')) then
    begin
      bPhoneNumber := false;
      lblErrorPhoneNumberR.Font.Color := clYellow;
      lblErrorPhoneNumberR.Caption := 'Invalid phone number.';
    end
    else
    begin
      lblErrorPhoneNumberR.Font.Color := clLime;
      lblErrorPhoneNumberR.Caption := 'Valid phone number.';
      bPhoneNumber := true;
    end;
  end;

  bPhoneNumberDatabase := false;

  if bPhoneNumber = true then
  begin
    dbmPAT.tblUsers.First;
    while NOT(dbmPAT.tblUsers.EOF) do
    begin
      if edtPhoneNumberR.Text = dbmPAT.tblUsers['PhoneNumber'] then
      begin
        bPhoneNumberDatabase := false;
        lblErrorPhoneNumberR.Font.Color := clYellow;
        lblErrorPhoneNumberR.Caption := 'Phone number already in use.';
      end
      else
      begin
        lblErrorPhoneNumberR.Font.Color := clLime;
        lblErrorPhoneNumberR.Caption := 'Valid phone number.';
        bPhoneNumberDatabase := true;
      end;
      dbmPAT.tblUsers.Next;
    end;
  end;


  // Email Validation

  bEmail := false;

  if (obj.IsValidEmail(edtEmailR.Text) = true) then
  begin
    lblErrorEmailR.Font.Color := clLime;
    lblErrorEmailR.Caption := 'Valid email.';
    bEmail := true;
  end
  else
  begin
    lblErrorEmailR.Font.Color := clYellow;
    lblErrorEmailR.Caption := 'Invalid email.';
    bEmail := false;
  end;

  bEmailDatabase := false;

  if bEmail = true then
  begin
    dbmPAT.tblUsers.First;
    while NOT(dbmPAT.tblUsers.EOF) do
    begin
      if edtEmailR.Text = dbmPAT.tblUsers['Email'] then
      begin
        bEmailDatabase := false;
        lblErrorEmailR.Font.Color := clYellow;
        lblErrorEmailR.Caption := 'Email taken.';
      end
      else
      begin
        lblErrorEmailR.Font.Color := clLime;
        lblErrorEmailR.Caption := 'Valid email.';
        bEmailDatabase := true;
      end;
      dbmPAT.tblUsers.Next;
    end;
  end;
  // Confirm Email

  bConfirmEmail := false;

  if edtEmailR.Text = edtEmailConfirm.Text then
  begin
    lblErrorEmailConfirmR.Font.Color := clLime;
    lblErrorEmailConfirmR.Caption := 'Email matched.';
    bConfirmEmail := true;
  end
  else
  begin
    lblErrorEmailConfirmR.Font.Color := clYellow;
    lblErrorEmailConfirmR.Caption := 'Email not matching.';
    bConfirmEmail := false;
  end;
  if edtEmailConfirm.Text = '' then
  begin
    lblErrorEmailConfirmR.Font.Color := clYellow;
    lblErrorEmailConfirmR.Caption := 'Email not matching.';
    bConfirmEmail := false;
  end;

  // ID Validation

  bID := false;

  if (obj.ValidateIDNEW(edtIDR.Text) = true) then
  begin
    lblErrorIDR.Font.Color := clLime;
    lblErrorIDR.Caption := 'Valid ID.';
    bID := true;
  end
  else
  begin
    lblErrorIDR.Font.Color := clYellow;
    lblErrorIDR.Caption := 'Invalid ID.';
    bID := false;
  end;

  bIDDatabase := false;

  if bID = true then
  begin
    dbmPAT.tblUsers.First;
    while NOT(dbmPAT.tblUsers.EOF) do
    begin
      if edtIDR.Text = dbmPAT.tblUsers['IDNumber'] then
      begin
        bIDDatabase := false;
        lblErrorIDR.Font.Color := clYellow;
        lblErrorIDR.Caption := 'ID number taken.';
      end
      else
      begin
        lblErrorIDR.Font.Color := clLime;
        lblErrorIDR.Caption := 'Valid ID.';
        bIDDatabase := true;
      end;
      dbmPAT.tblUsers.Next;
    end;
  end;

  // Password Validation

  bPassword := false;

  if (obj.IsPasswordCrazy(edtPasswordR.Text) = true) then
  begin
    lblErrorPasswordR.Font.Color := clLime;
    lblErrorPasswordR.Caption := 'Valid Password.';
    bPassword := true;
  end
  else
  begin
    lblErrorPasswordR.Font.Color := clYellow;
    lblErrorPasswordR.Caption := 'Password too basic.';
    bPassword := false;
  end;

  // Full Validation

  iUserID := 0;

  if (bPassword = true) AND (bEmail = true) AND (bConfirmEmail = true) AND
    (bID = true) AND (bName = true) AND (bSurname = true) AND
    (bPhoneNumber = true) AND (bEmailDatabase = true) AND
    (bPhoneNumberDatabase = true) AND (bIDDatabase = true) then
  begin
    ShowMessage('Successfully Registered!');

    // Database adding

    with dbmPAT do
    begin
      tblUsers.Last;
      iUserID := tblUsers['UserID'];
      inc(iUserID);
      tblUsers.Insert;
      tblUsers.Append;
      tblUsers['UserID'] := iUserID;
      tblUsers['Name'] := edtNameR.Text;
      tblUsers['Surname'] := edtSurnameR.Text;
      tblUsers['Email'] := edtEmailR.Text;
      tblUsers['Password'] := edtPasswordR.Text;
      tblUsers['IDNumber'] := edtIDR.Text;
      tblUsers['PhoneNumber'] := edtPhoneNumberR.Text;
      tblUsers.Post;
      tblUsers.Refresh;
    end;

    frmRegister.Hide;
    frmLogin.Show;
  end;

end;

procedure TfrmRegister.Button1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmRegister.ckbPasswordRClick(Sender: TObject);
begin
  if ckbPasswordR.Checked = false then
  begin
    edtPasswordR.PasswordChar := '*';
  end
  else
  begin
    edtPasswordR.PasswordChar := #0;
  end;
end;

procedure TfrmRegister.edtIDRChange(Sender: TObject);
begin
  if NOT(edtIDR.Text = 'Enter ID here') AND
    NOT(edtPhoneNumberR.Text = 'Enter phone number here') then
  begin
    btnRegister.Enabled := true;
  end;
end;

procedure TfrmRegister.edtPhoneNumberRChange(Sender: TObject);
begin
  if NOT(edtIDR.Text = 'Enter ID here') AND
    NOT(edtPhoneNumberR.Text = 'Enter phone number here') then
  begin
    btnRegister.Enabled := true;
  end;
end;

procedure TfrmRegister.FormCreate(Sender: TObject);
begin
  frmRegister.Position := poScreenCenter;
  btnRegister.Enabled := false;
  ckbPasswordR.Checked := false;
  edtPasswordR.PasswordChar := '*';
end;

procedure TfrmRegister.FormShow(Sender: TObject);
begin
  btnBackRegister.SetFocus;
end;

end.
