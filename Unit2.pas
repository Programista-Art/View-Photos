unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TFormPictureView = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    ScrollBox1: TScrollBox;
    ImageViewer: TImage;
    Panel2: TPanel;
    TrackBar1: TTrackBar;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ShowImg;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TrackBar1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TrackBar1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TrackBar1Change(Sender: TObject);
    procedure ImageViewerMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageViewerMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ImageViewerMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
  ScaleFactor: Single;
    procedure SizeImagePlus;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPictureView: TFormPictureView;
  OriginalBitmap: TBitmap;
  OriginalImageWidth: Integer;
  OriginalImageHeight: Integer;
  FDragging: Boolean;
  FStartX, FStartY: Integer;
implementation

{$R *.dfm}

uses Unit1;


procedure TFormPictureView.Button1Click(Sender: TObject);
begin
  Close;
end;



procedure TFormPictureView.FormCreate(Sender: TObject);
begin
  ShowImg;
  OriginalImageWidth := ImageViewer.Width;
  OriginalImageHeight := ImageViewer.Height;
  ScaleFactor := 1.0;
  OriginalBitmap := TBitmap.Create;
  //if not ImageViewer.Picture.Graphic.Empty then
  //OriginalBitmap.Assign(ImageViewer.Picture.Bitmap); // Upewnij siê, ¿e oryginalny obraz jest przypisany
end;

procedure TFormPictureView.FormDestroy(Sender: TObject);
begin
  OriginalBitmap.Free;
end;

procedure TFormPictureView.FormShow(Sender: TObject);
begin
ShowImg;
end;

procedure TFormPictureView.ImageViewerMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
// Rozpocznij przeci¹ganie, jeœli wciœniêto lewy przycisk myszy
  if Button = mbLeft then
  begin
    FDragging := True;
    FStartX := X;
    FStartY := Y;
    Screen.Cursor := crSizeAll; // Zmienia kursor na wskaŸnik przeci¹gania
    ImageViewer.Invalidate; // Wymuœ przerysowanie komponentu
  end;
end;

procedure TFormPictureView.ImageViewerMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if FDragging then
    begin
      // Przesuñ scroll box o ró¿nicê pozycji myszy
      ScrollBox1.HorzScrollBar.Position := ScrollBox1.HorzScrollBar.Position - (X - FStartX);
      ScrollBox1.VertScrollBar.Position := ScrollBox1.VertScrollBar.Position - (Y - FStartY);
      ImageViewer.Invalidate; // Wymuœ przerysowanie komponentu
    end;
end;

procedure TFormPictureView.ImageViewerMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  // Zakoñcz przeci¹ganie po zwolnieniu przycisku myszy
  if Button = mbLeft then
  begin
    FDragging := False;
    Screen.Cursor := crDefault; // Przywraca domyœlny kursor
  end;
end;

procedure TFormPictureView.ShowImg;
var
  Picture: TPicture;
begin
    if FileExists(Form1.FullPath) then
    begin
      Picture := TPicture.Create;
      try
        if Form1.LoadImageToTPicture(Form1.FullPath, Picture) then
          ImageViewer.Picture.Assign(Picture);
          ImageViewer.Picture.LoadFromFile(Form1.FullPath);
      finally
        Picture.Free;
      end;
  //ImageViewer.Picture.LoadFromFile(Form1.Image1.Picture);
end;
end;

procedure TFormPictureView.SizeImagePlus;
var
  OriginalBitmap: TBitmap;
  ScaleFactor: Single;
begin

end;




procedure TFormPictureView.TrackBar1Change(Sender: TObject);
var
  scaleFactor2: Integer;
begin
// Pobierz aktualn¹ wartoœæ z TrackBar
  scaleFactor2 := TrackBar1.Position;

  // Skaluj obrazek w oparciu o wartoœæ TrackBar
  ImageViewer.Width := OriginalImageWidth + scaleFactor2;
  ImageViewer.Height := OriginalImageHeight + scaleFactor2;
  //ImageViewer.Repaint;
  ImageViewer.Invalidate; // Wymuœ przerysowanie komponentu

   // ImageViewer.Width:=ImageViewer.Width - TrackBar1.Position;
   // ImageViewer.Height:=ImageViewer.Height -TrackBar1.Position;
end;

procedure TFormPictureView.TrackBar1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  keypreview:=true;
  if key=40 then begin
    ImageViewer.Width:=ImageViewer.Width-100;
    ImageViewer.Height:=ImageViewer.Height-100;
  end;
end;

procedure TFormPictureView.TrackBar1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=38 then begin
      ImageViewer.Width:=ImageViewer.Width+100;
      ImageViewer.Height:=ImageViewer.Height+100;
  end;
end;


end.
