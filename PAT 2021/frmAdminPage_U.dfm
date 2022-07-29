object frmAdmin: TfrmAdmin
  Left = 0
  Top = 0
  Caption = 'Admin View'
  ClientHeight = 749
  ClientWidth = 1370
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -19
  Font.Name = 'Roboto'
  Font.Style = [fsBold]
  Font.Quality = fqAntialiased
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 23
  object Panel1: TPanel
    Left = -10
    Top = -4
    Width = 1387
    Height = 757
    Color = clGradientActiveCaption
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 64
      Width = 115
      Height = 23
      Caption = 'Table Movies'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -19
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      Font.Quality = fqAntialiased
      ParentFont = False
    end
    object Label2: TLabel
      Left = 32
      Top = 404
      Width = 174
      Height = 23
      Caption = 'Table Critic Reviews'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -19
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      Font.Quality = fqAntialiased
      ParentFont = False
    end
    object Label3: TLabel
      Left = 720
      Top = 64
      Width = 102
      Height = 23
      Caption = 'Table Users'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -19
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      Font.Quality = fqAntialiased
      ParentFont = False
    end
    object Label4: TLabel
      Left = 720
      Top = 404
      Width = 168
      Height = 23
      Caption = 'Table User Reviews'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -19
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      Font.Quality = fqAntialiased
      ParentFont = False
    end
    object btnBackAdmin: TButton
      Left = 32
      Top = 16
      Width = 89
      Height = 42
      Caption = 'Back'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      Font.Quality = fqAntialiased
      ParentFont = False
      TabOrder = 0
      OnClick = btnBackAdminClick
    end
    object dbgCriticReviews: TDBGrid
      Left = 32
      Top = 433
      Width = 625
      Height = 200
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      Font.Quality = fqAntialiased
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -19
      TitleFont.Name = 'Roboto'
      TitleFont.Style = [fsBold]
      TitleFont.Quality = fqAntialiased
    end
    object dbgUsers: TDBGrid
      Left = 720
      Top = 93
      Width = 617
      Height = 201
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      Font.Quality = fqAntialiased
      ParentFont = False
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -19
      TitleFont.Name = 'Roboto'
      TitleFont.Style = [fsBold]
      TitleFont.Quality = fqAntialiased
    end
    object dbgUserReviews: TDBGrid
      Left = 720
      Top = 433
      Width = 617
      Height = 200
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      Font.Quality = fqAntialiased
      ParentFont = False
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -19
      TitleFont.Name = 'Roboto'
      TitleFont.Style = [fsBold]
      TitleFont.Quality = fqAntialiased
    end
    object dbgMovies: TDBGrid
      Left = 32
      Top = 93
      Width = 625
      Height = 201
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      Font.Quality = fqAntialiased
      ParentFont = False
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -19
      TitleFont.Name = 'Roboto'
      TitleFont.Style = [fsBold]
      TitleFont.Quality = fqAntialiased
    end
    object dbnMovies: TDBNavigator
      Left = 32
      Top = 295
      Width = 624
      Height = 42
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbRefresh]
      TabOrder = 5
    end
    object dbnCriticReviews: TDBNavigator
      Left = 33
      Top = 631
      Width = 624
      Height = 42
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbRefresh]
      TabOrder = 6
    end
    object dbnUsers: TDBNavigator
      Left = 720
      Top = 295
      Width = 616
      Height = 42
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbRefresh]
      TabOrder = 7
    end
    object dbnUserReviews: TDBNavigator
      Left = 720
      Top = 631
      Width = 616
      Height = 42
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbRefresh]
      TabOrder = 8
    end
    object Button1: TButton
      Left = 1247
      Top = 17
      Width = 89
      Height = 41
      Caption = 'Close'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      Font.Quality = fqAntialiased
      ParentFont = False
      TabOrder = 9
      OnClick = Button1Click
    end
  end
end
