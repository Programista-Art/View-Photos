unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.FileCtrl, Vcl.StdCtrls,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Vcl.ComCtrls,Shellapi,Jpeg,PngImage,
  Vcl.Menus;

type
  TForm1 = class(TForm)
    ImageList1: TImageList;
    PanelDolny: TPanel;
    ListView1: TListView;
    Image1: TImage;
    PanelTop: TPanel;
    DirectoryListBox1: TDirectoryListBox;
    FileListBox1: TFileListBox;
    PanelTopBottom: TPanel;
    ButtonStart: TButton;
    Splitter1: TSplitter;
    MainMenu: TMainMenu;
    Plik1: TMenuItem;
    OpenFolder: TMenuItem;
    OPD: TOpenDialog;
    procedure de(Sender: TObject);
    procedure ButtonStartClick(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure OpenFolderClick(Sender: TObject);
    procedure FileListBox1Change(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
  private
    { Private declarations }

    procedure Start;
  public
    { Public declarations }
    function LoadImageToTPicture(const FileName: string; Picture: TPicture): Boolean;
    var
    FullPath: string;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit2;

procedure TForm1.ButtonStartClick(Sender: TObject);
begin
Start;
end;

procedure TForm1.de(Sender: TObject);
begin

  //FileListBox1.Mask := '.bmp';
   DirectoryListBox1.Directory := 'c:\';
  //DirectoryListBox1.Directory := 'C:\Users\Programista Art\Desktop\';
  ListView1.ViewStyle := vsIcon;
  ListView1.IconOptions.AutoArrange := True;
  ListView1.LargeImages := ImageList1;

  FileListBox1.Mask := '*.jpg;*.jpeg;*.png;*.bmp';

  Image1.Stretch := True;
  Image1.Proportional := True;
  Image1.Center := True;
end;



procedure TForm1.FileListBox1Change(Sender: TObject);
begin
Start;
end;

procedure TForm1.FormDestroy(Sender: TObject);
var
  i: Integer;
begin
  // Zwalniamy pamiêæ zaalokowan¹ dla œcie¿ek
  for i := 0 to ListView1.Items.Count - 1 do
  begin
    if ListView1.Items[i].Data <> nil then
      StrDispose(PChar(ListView1.Items[i].Data));
  end;
end;

procedure TForm1.Image1DblClick(Sender: TObject);
begin
   FormPictureView.ShowModal;
end;

procedure TForm1.ListView1Click(Sender: TObject);
var
  SelectedItem: TListItem;
//  FullPath: string;
  Picture: TPicture;
begin
 // Image1.Picture.LoadFromFile(DirectoryListBox1.Directory + '\' + FileListBox1.Items[ListView1.ItemIndex]);
if ListView1.Selected <> nil then
  begin
    SelectedItem := ListView1.Selected;
    FullPath := string(PChar(SelectedItem.Data));

    if FileExists(FullPath) then
    begin
      Picture := TPicture.Create;
      try
        if LoadImageToTPicture(FullPath, Picture) then
          Image1.Picture.Assign(Picture);
      finally
        Picture.Free;
      end;
    end
    else
      ShowMessage('Plik nie istnieje: ' + FullPath);
  end;
end;

function TForm1.LoadImageToTPicture(const FileName: string;
  Picture: TPicture): Boolean;
var
Ext: string;
JPEGImage: TJPEGImage;
PNGImage: TPngImage;
begin
Result := False;
  Ext := LowerCase(ExtractFileExt(FileName));

  try
    if (Ext = '.jpg') or (Ext = '.jpeg') then
    begin
      JPEGImage := TJPEGImage.Create;
      try
        JPEGImage.LoadFromFile(FileName);
        Picture.Assign(JPEGImage);
        Result := True;
      finally
        JPEGImage.Free;
      end;
    end
    else if (Ext = '.png') then
    begin
      PNGImage := TPngImage.Create;
      try
        PNGImage.LoadFromFile(FileName);
        Picture.Assign(PNGImage);
        Result := True;
      finally
        PNGImage.Free;
      end;
    end
    else if (Ext = '.bmp') then
    begin
      Picture.LoadFromFile(FileName);
      Result := True;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('B³¹d wczytywania pliku ' + FileName + #13#10 +
                 'Typ b³êdu: ' + E.ClassName + #13#10 +
                 'Opis b³êdu: ' + E.Message);
      Result := False;
    end;
  end;
end;

procedure TForm1.OpenFolderClick(Sender: TObject);
var
aPath: string;
begin
 if SelectDirectory('Wybierz katalog','',aPath) then
  begin
    DirectoryListBox1.Directory := aPath;
    Caption := 'Przegl¹darka obrazów - ' + aPath;
  end;


end;

procedure TForm1.Start;
var
  Picture: TPicture;
  pic: TBitmap;
  i: Integer;
  FullPath: string;
  ValidExtensions: TStringList;
  FileExt: string;
  ListItem: TListItem;
begin
  Screen.Cursor := crHourGlass;
  try
    // Konfiguracja pocz¹tkowa
    Image1.Stretch := True;
    DirectoryListBox1.Directory := IncludeTrailingBackslash(DirectoryListBox1.Directory);

    ImageList1.Clear;
    ListView1.Clear;

    // Utworzenie listy dozwolonych rozszerzeñ
    ValidExtensions := TStringList.Create;
    try
      ValidExtensions.CommaText := '.jpg,.jpeg,.png,.bmp';

      Picture := TPicture.Create;
      pic := TBitmap.Create;
      try
        ListView1.Items.BeginUpdate;
        try
          for i := 0 to FileListBox1.Items.Count-1 do
          begin
            FullPath := IncludeTrailingBackslash(DirectoryListBox1.Directory) +
                       FileListBox1.Items[i];

            FileExt := LowerCase(ExtractFileExt(FullPath));

            if ValidExtensions.IndexOf(FileExt) >= 0 then
            begin
              if LoadImageToTPicture(FullPath, Picture) then
              begin
                try
                  // Tworzenie miniatury
                  pic.Width := ImageList1.Width;
                  pic.Height := ImageList1.Height;
                  pic.Canvas.Brush.Color := clBtnFace;
                  pic.Canvas.FillRect(Rect(0, 0, pic.Width, pic.Height));

                  // Obliczanie proporcji
                  var R: TRect;
                  var AspectRatio: Double;
                  if (Picture.Width > 0) and (Picture.Height > 0) then
                    AspectRatio := Picture.Width / Picture.Height
                  else
                    AspectRatio := 1;

                  // Zachowanie proporcji
                  if AspectRatio > 1 then
                  begin
                    R.Width := pic.Width;
                    R.Height := Round(pic.Width / AspectRatio);
                    R.Left := 0;
                    R.Top := (pic.Height - R.Height) div 2;
                  end
                  else
                  begin
                    R.Height := pic.Height;
                    R.Width := Round(pic.Height * AspectRatio);
                    R.Top := 0;
                    R.Left := (pic.Width - R.Width) div 2;
                  end;

                  // Rysowanie miniatury
                  pic.Canvas.StretchDraw(R, Picture.Graphic);

                  // Dodawanie do ImageList
                  ImageList1.Add(pic, nil);

                  // Dodawanie do ListView
                  ListItem := ListView1.Items.Add;
                  ListItem.Caption := ExtractFileName(FullPath);
                  ListItem.ImageIndex := ImageList1.Count - 1;
                  ListItem.Data := Pointer(StrNew(PChar(FullPath)));
                except
                  on E: Exception do
                    OutputDebugString(PChar('B³¹d przy tworzeniu miniatury: ' + E.Message));
                end;
              end;
            end;
          end;
        finally
          ListView1.Items.EndUpdate;
        end;
      finally
        Picture.Free;
        pic.Free;
      end;
    finally
      ValidExtensions.Free;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

end.
