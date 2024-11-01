object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 552
  ClientWidth = 970
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu
  OnCreate = de
  OnDestroy = FormDestroy
  TextHeight = 15
  object Splitter1: TSplitter
    Left = 0
    Top = 204
    Width = 970
    Height = 4
    Cursor = crVSplit
    Align = alBottom
    Color = clCrimson
    ParentColor = False
    ExplicitTop = 260
    ExplicitWidth = 575
  end
  object PanelDolny: TPanel
    Left = 0
    Top = 208
    Width = 970
    Height = 344
    Align = alBottom
    TabOrder = 0
    object Image1: TImage
      Left = 1
      Top = 1
      Width = 288
      Height = 342
      Align = alLeft
      OnDblClick = Image1DblClick
      ExplicitHeight = 207
    end
    object ListView1: TListView
      Left = 289
      Top = 1
      Width = 680
      Height = 342
      Align = alClient
      Columns = <>
      TabOrder = 0
      OnClick = ListView1Click
    end
  end
  object PanelTop: TPanel
    Left = 0
    Top = 25
    Width = 970
    Height = 179
    Align = alClient
    TabOrder = 1
    object DirectoryListBox1: TDirectoryListBox
      Left = 1
      Top = 1
      Width = 288
      Height = 177
      Align = alLeft
      FileList = FileListBox1
      TabOrder = 0
    end
    object FileListBox1: TFileListBox
      Left = 289
      Top = 1
      Width = 680
      Height = 177
      Align = alClient
      ItemHeight = 15
      Mask = #39'*.jpg;*.jpeg;*.png;*.bmp'#39
      TabOrder = 1
      OnChange = FileListBox1Change
    end
  end
  object PanelTopBottom: TPanel
    Left = 0
    Top = 0
    Width = 970
    Height = 25
    Align = alTop
    TabOrder = 2
    object ButtonStart: TButton
      Left = 894
      Top = 1
      Width = 75
      Height = 23
      Align = alRight
      Caption = 'Start'
      TabOrder = 0
      OnClick = ButtonStartClick
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
    Left = 528
    Top = 400
  end
end
