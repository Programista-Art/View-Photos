unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFormPictureView = class(TForm)
    ImageViewer: TImage;
    Panel1: TPanel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ShowImg;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPictureView: TFormPictureView;

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

end;

procedure TFormPictureView.FormShow(Sender: TObject);
begin
ShowImg;
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

end.
