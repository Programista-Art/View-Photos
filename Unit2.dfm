object FormPictureView: TFormPictureView
  Left = 0
  Top = 0
  Caption = 'Podgl'#261'd zdj'#281'cia'
  ClientHeight = 441
  ClientWidth = 545
  Color = clBtnFace
  DoubleBuffered = True
  DoubleBufferedMode = dbmRequested
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 416
    Width = 545
    Height = 25
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 469
      Top = 1
      Width = 75
      Height = 23
      Align = alRight
      Caption = 'Ok'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 545
    Height = 383
    HorzScrollBar.ButtonSize = 5
    HorzScrollBar.Tracking = True
    Align = alClient
    TabOrder = 1
    UseWheelForScrolling = True
    ExplicitWidth = 401
    ExplicitHeight = 289
    object ImageViewer: TImage
      Left = 20
      Top = 20
      Width = 468
      Height = 371
      Margins.Left = 20
      Margins.Top = 20
      Margins.Right = 20
      Margins.Bottom = 20
      Center = True
      Proportional = True
      Stretch = True
      OnMouseDown = ImageViewerMouseDown
      OnMouseMove = ImageViewerMouseMove
      OnMouseUp = ImageViewerMouseUp
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 383
    Width = 545
    Height = 33
    Align = alBottom
    TabOrder = 2
    object TrackBar1: TTrackBar
      Left = 1
      Top = 1
      Width = 543
      Height = 31
      Align = alClient
      Max = 10000
      Frequency = 100
      PositionToolTip = ptRight
      TabOrder = 0
      OnChange = TrackBar1Change
      OnKeyDown = TrackBar1KeyDown
      OnKeyUp = TrackBar1KeyUp
      ExplicitLeft = 41
      ExplicitTop = 9
    end
  end
end
