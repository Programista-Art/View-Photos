object FormPictureView: TFormPictureView
  Left = 0
  Top = 0
  Caption = 'Podgl'#261'd zdj'#281'cia'
  ClientHeight = 441
  ClientWidth = 545
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object ImageViewer: TImage
    Left = 0
    Top = 0
    Width = 545
    Height = 416
    Align = alClient
    Proportional = True
    ExplicitLeft = 176
    ExplicitTop = 112
    ExplicitWidth = 105
    ExplicitHeight = 105
  end
  object Panel1: TPanel
    Left = 0
    Top = 416
    Width = 545
    Height = 25
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 424
    object Button1: TButton
      Left = 469
      Top = 1
      Width = 75
      Height = 23
      Align = alRight
      Caption = 'Ok'
      TabOrder = 0
      OnClick = Button1Click
      ExplicitLeft = 440
      ExplicitTop = 0
      ExplicitHeight = 25
    end
  end
end
