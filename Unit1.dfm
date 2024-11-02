object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Image Flex Converter'
  ClientHeight = 550
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
    Top = 546
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
  end
  object PageControlMain: TPageControl
    Left = 0
    Top = 25
    Width = 975
    Height = 521
    ActivePage = TabSheetWejscie
    Align = alClient
    TabOrder = 1
    object TabSheetWejscie: TTabSheet
      Caption = 'Wej'#347'cie'
      object PanelMain: TPanel
        Left = 0
        Top = 0
        Width = 967
        Height = 491
        Align = alClient
        Caption = 'PanelMain'
        TabOrder = 0
        object PanelLeft: TPanel
          Left = 1
          Top = 1
          Width = 169
          Height = 433
          Align = alLeft
          TabOrder = 0
          object DirectoryListBox1: TDirectoryListBox
            Left = 1
            Top = 29
            Width = 167
            Height = 403
            Align = alClient
            FileList = FileListBox1
            TabOrder = 0
          end
          object PanelTopPath: TPanel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 163
            Height = 24
            Margins.Left = 2
            Margins.Top = 2
            Margins.Right = 2
            Margins.Bottom = 2
            Align = alTop
            TabOrder = 1
            object EditPath: TEdit
              AlignWithMargins = True
              Left = 1
              Top = 1
              Width = 112
              Height = 22
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 2
              Margins.Bottom = 0
              Align = alClient
              ParentShowHint = False
              PopupMenu = PopupMenuEdit
              ShowHint = True
              TabOrder = 0
              TextHint = #346'cie'#380'ka'
              ExplicitHeight = 23
            end
            object ButtonStart: TButton
              AlignWithMargins = True
              Left = 115
              Top = 1
              Width = 47
              Height = 22
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alRight
              Caption = 'Otw'#243'rz'
              TabOrder = 1
              OnClick = ButtonStartClick
            end
          end
        end
        object PanelRight: TPanel
          Left = 736
          Top = 1
          Width = 230
          Height = 433
          Align = alRight
          TabOrder = 1
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
          Width = 566
          Height = 433
          Align = alClient
          TabOrder = 2
          object ListView1: TListView
            Left = 1
            Top = 1
            Width = 564
            Height = 431
            Align = alClient
            Columns = <>
            TabOrder = 0
            OnClick = ListView1Click
          end
        end
        object FileListBox1: TFileListBox
          Left = 1
          Top = 434
          Width = 965
          Height = 56
          Align = alBottom
          ItemHeight = 15
          Mask = #39'*.jpg;*.jpeg;*.png;*.bmp'#39
          TabOrder = 3
          OnChange = FileListBox1Change
        end
      end
    end
    object TabSheetOperacje: TTabSheet
      Caption = 'Operacje'
      ImageIndex = 1
    end
    object TabSheetExit: TTabSheet
      Caption = 'Wyj'#347'cie'
      ImageIndex = 2
    end
    object TabSheetStan: TTabSheet
      Caption = 'Stan'
      ImageIndex = 3
    end
    object TabSheetSettings: TTabSheet
      Caption = 'Ustawienia'
      ImageIndex = 4
    end
    object TabSheetOprogramie: TTabSheet
      Caption = 'O programie'
      ImageIndex = 5
      object PanelPrawy: TPanel
        Left = 209
        Top = 0
        Width = 758
        Height = 491
        Align = alClient
        TabOrder = 0
        object RichEdit1: TRichEdit
          Left = 1
          Top = 1
          Width = 756
          Height = 489
          Align = alClient
          Font.Charset = EASTEUROPE_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Lines.Strings = (
            'Image Flex Converter Version 1.0.0 - Windows x64  (02.11.2024) '
            
              'Image Flex Converter jest programem typu freeware do prywatnego,' +
              ' niekomercyjnego lub edukacyjnego u'#380'ytku, r'#243'wnie'#380' dla organizacj' +
              'i non-'
            'profit. '
            'Firmy s'#261' zobowi'#261'zane wykupi'#263' licencj'#281'.'
            'Licencj'#281' mo'#380'na kupi'#263' na www.programista.art'
            'E-mail: programista.art@gmail.com')
          ParentFont = False
          ReadOnly = True
          ShowURLHint = True
          TabOrder = 0
        end
      end
      object PanelLewy: TPanel
        Left = 0
        Top = 0
        Width = 209
        Height = 491
        Align = alLeft
        TabOrder = 1
      end
    end
  end
  object ImageList1: TImageList
    Height = 100
    Width = 100
    Left = 920
    Top = 128
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
  object PopupMenuEdit: TPopupMenu
    Left = 890
    Top = 66
    object Kopiuj1: TMenuItem
      Caption = 'Kopiuj'
      OnClick = Kopiuj1Click
    end
    object Wklej1: TMenuItem
      Caption = 'Wklej'
      OnClick = Wklej1Click
    end
    object Usu1: TMenuItem
      Caption = 'Usu'#324
      OnClick = Usu1Click
    end
  end
  object PageSetupDialog1: TPageSetupDialog
    MinMarginLeft = 0
    MinMarginTop = 0
    MinMarginRight = 0
    MinMarginBottom = 0
    MarginLeft = 2500
    MarginTop = 2500
    MarginRight = 2500
    MarginBottom = 2500
    PageWidth = 21000
    PageHeight = 29700
    Left = 696
    Top = 72
  end
end
