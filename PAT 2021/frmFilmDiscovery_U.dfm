object frmFilmDiscovery: TfrmFilmDiscovery
  Left = 0
  Top = 0
  Caption = 'Film Discovery'
  ClientHeight = 788
  ClientWidth = 1229
  Color = clGray
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlack
  Font.Height = -12
  Font.Name = 'Roboto'
  Font.Style = []
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object pnlFilmDiscovery: TPanel
    Left = 0
    Top = 0
    Width = 1241
    Height = 1041
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 155
      Top = 26
      Width = 212
      Height = 33
      Caption = 'Currently Popular'
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -27
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 155
      Top = 360
      Width = 135
      Height = 33
      Caption = 'Top Sellers'
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -27
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 155
      Top = 694
      Width = 221
      Height = 33
      Caption = 'Recently Released'
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -27
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object imgCurrentlyPopular: TImage
      Left = 116
      Top = 27
      Width = 33
      Height = 32
    end
    object imgTopSellers: TImage
      Left = 116
      Top = 361
      Width = 33
      Height = 32
    end
    object imgRecentlyReleased: TImage
      Left = 116
      Top = 694
      Width = 33
      Height = 32
    end
    object btnSignOut: TButton
      Left = 15
      Top = 17
      Width = 95
      Height = 41
      Caption = 'Sign Out'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnSignOutClick
    end
    object ScrollBox1: TScrollBox
      Left = 155
      Top = 65
      Width = 1054
      Height = 280
      HorzScrollBar.Smooth = True
      VertScrollBar.Smooth = True
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clSkyBlue
      ParentColor = False
      TabOrder = 1
      object Image1: TImage
        Left = 36
        Top = 16
        Width = 149
        Height = 233
        OnClick = Image1Click
      end
      object Image2: TImage
        Left = 244
        Top = 16
        Width = 149
        Height = 233
        OnClick = Image2Click
      end
      object Image3: TImage
        Left = 452
        Top = 16
        Width = 149
        Height = 233
        OnClick = Image3Click
      end
      object Image4: TImage
        Left = 660
        Top = 16
        Width = 149
        Height = 233
        OnClick = Image4Click
      end
      object Image5: TImage
        Left = 866
        Top = 16
        Width = 149
        Height = 233
        OnClick = Image5Click
      end
      object Image6: TImage
        Left = 1066
        Top = 16
        Width = 149
        Height = 233
        OnClick = Image6Click
      end
      object Image7: TImage
        Left = 1284
        Top = 16
        Width = 149
        Height = 233
        OnClick = Image7Click
      end
      object Image8: TImage
        Left = 1492
        Top = 16
        Width = 149
        Height = 233
        OnClick = Image8Click
      end
      object Image9: TImage
        Left = 1698
        Top = 23
        Width = 149
        Height = 233
        OnClick = Image9Click
      end
      object Image10: TImage
        Left = 1904
        Top = 16
        Width = 149
        Height = 233
        OnClick = Image10Click
      end
    end
    object ScrollBox2: TScrollBox
      Left = 155
      Top = 399
      Width = 1054
      Height = 289
      HorzScrollBar.Smooth = True
      VertScrollBar.Smooth = True
      TabOrder = 2
      object Image11: TImage
        Left = 36
        Top = 24
        Width = 149
        Height = 233
        OnClick = Image11Click
      end
      object Image12: TImage
        Left = 244
        Top = 24
        Width = 149
        Height = 233
        OnClick = Image12Click
      end
      object Image13: TImage
        Left = 452
        Top = 24
        Width = 149
        Height = 233
        OnClick = Image13Click
      end
      object Image14: TImage
        Left = 660
        Top = 24
        Width = 149
        Height = 233
        OnClick = Image14Click
      end
      object Image15: TImage
        Left = 866
        Top = 24
        Width = 149
        Height = 233
        OnClick = Image15Click
      end
      object Image16: TImage
        Left = 1074
        Top = 24
        Width = 149
        Height = 233
        OnClick = Image16Click
      end
      object Image17: TImage
        Left = 1282
        Top = 24
        Width = 149
        Height = 233
        OnClick = Image17Click
      end
      object Image18: TImage
        Left = 1490
        Top = 24
        Width = 149
        Height = 233
        OnClick = Image18Click
      end
      object Image19: TImage
        Left = 1698
        Top = 24
        Width = 149
        Height = 233
        OnClick = Image19Click
      end
      object Image20: TImage
        Left = 1911
        Top = 24
        Width = 149
        Height = 233
        OnClick = Image20Click
      end
    end
    object ScrollBox3: TScrollBox
      Left = 155
      Top = 733
      Width = 1054
      Height = 289
      HorzScrollBar.Position = 1008
      HorzScrollBar.Smooth = True
      VertScrollBar.Smooth = True
      TabOrder = 3
      object Image21: TImage
        Left = -972
        Top = 24
        Width = 149
        Height = 233
        OnClick = Image21Click
      end
      object Image22: TImage
        Left = -764
        Top = 24
        Width = 149
        Height = 233
        OnClick = Image22Click
      end
      object Image23: TImage
        Left = -556
        Top = 24
        Width = 149
        Height = 233
        OnClick = Image23Click
      end
      object Image24: TImage
        Left = -348
        Top = 24
        Width = 149
        Height = 233
        OnClick = Image24Click
      end
      object Image25: TImage
        Left = -142
        Top = 24
        Width = 149
        Height = 233
        OnClick = Image25Click
      end
      object Image26: TImage
        Left = 66
        Top = 24
        Width = 149
        Height = 233
        OnClick = Image26Click
      end
      object Image27: TImage
        Left = 274
        Top = 24
        Width = 149
        Height = 233
        OnClick = Image27Click
      end
      object Image28: TImage
        Left = 482
        Top = 24
        Width = 149
        Height = 233
        OnClick = Image28Click
      end
      object Image29: TImage
        Left = 690
        Top = 24
        Width = 149
        Height = 233
        OnClick = Image29Click
      end
      object Image30: TImage
        Left = 903
        Top = 24
        Width = 149
        Height = 233
        OnClick = Image30Click
      end
    end
    object Button1: TButton
      Left = 1120
      Top = 17
      Width = 89
      Height = 42
      Caption = 'Close'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = Button1Click
    end
  end
end
