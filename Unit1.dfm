object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 541
  ClientWidth = 975
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu
  Position = poMainFormCenter
  OnCreate = de
  OnDestroy = FormDestroy
  TextHeight = 15
  object Splitter1: TSplitter
    Left = 0
    Top = 537
    Width = 975
    Height = 4
    Cursor = crVSplit
    Align = alBottom
    Color = clCrimson
    ParentColor = False
    ExplicitTop = 260
    ExplicitWidth = 575
  end
  object PanelTopMenu: TPanel
    Left = 0
    Top = 0
    Width = 975
    Height = 25
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 1080
    object Label1: TLabel
      AlignWithMargins = True
      Left = 6
      Top = 6
      Width = 41
      Height = 13
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      Caption = #346'cie'#380'ka'
      ExplicitLeft = 704
    end
    object ButtonStart: TButton
      Left = 170
      Top = 1
      Width = 47
      Height = 23
      Align = alLeft
      Caption = 'Otw'#243'rz'
      TabOrder = 0
      OnClick = ButtonStartClick
    end
    object EditPath: TEdit
      Left = 52
      Top = 1
      Width = 118
      Height = 23
      Align = alLeft
      TabOrder = 1
    end
  end
  object PanelMain: TPanel
    Left = 0
    Top = 25
    Width = 975
    Height = 512
    Align = alClient
    Caption = 'PanelMain'
    TabOrder = 1
    ExplicitLeft = 19
    ExplicitTop = 113
    ExplicitWidth = 985
    ExplicitHeight = 496
    object PanelLeft: TPanel
      Left = 1
      Top = 1
      Width = 169
      Height = 401
      Align = alLeft
      TabOrder = 0
      ExplicitLeft = 16
      ExplicitTop = -53
      ExplicitHeight = 606
      object DirectoryListBox1: TDirectoryListBox
        Left = 1
        Top = 18
        Width = 167
        Height = 382
        Align = alBottom
        FileList = FileListBox1
        TabOrder = 0
        ExplicitTop = 88
      end
    end
    object PanelRight: TPanel
      Left = 744
      Top = 1
      Width = 230
      Height = 401
      Align = alRight
      TabOrder = 1
      ExplicitLeft = 688
      object Image1: TImage
        Left = 1
        Top = 1
        Width = 228
        Height = 228
        Align = alTop
        OnDblClick = Image1DblClick
      end
    end
    object PanelTop: TPanel
      Left = 170
      Top = 1
      Width = 574
      Height = 401
      Align = alClient
      TabOrder = 2
      ExplicitLeft = 253
      ExplicitTop = 304
      ExplicitWidth = 326
      ExplicitHeight = 223
      object ListView1: TListView
        Left = 1
        Top = 1
        Width = 572
        Height = 399
        Align = alClient
        Columns = <>
        TabOrder = 0
        OnClick = ListView1Click
        ExplicitWidth = 581
        ExplicitHeight = 400
      end
    end
    object FileListBox1: TFileListBox
      Left = 1
      Top = 402
      Width = 973
      Height = 109
      Align = alBottom
      ItemHeight = 15
      Mask = #39'*.jpg;*.jpeg;*.png;*.bmp'#39
      TabOrder = 3
      OnChange = FileListBox1Change
      ExplicitTop = 496
      ExplicitWidth = 1078
    end
  end
  object ImageList1: TImageList
    Height = 100
    Width = 100
    Left = 512
    Top = 48
  end
  object MainMenu: TMainMenu
    Left = 432
    Top = 169
    object Plik1: TMenuItem
      Caption = 'Plik'
      object OpenFolder: TMenuItem
        Caption = 'Otw'#243'rz folder'
        OnClick = OpenFolderClick
      end
    end
  end
  object OPD: TOpenDialog
    Left = 632
    Top = 344
  end
end
