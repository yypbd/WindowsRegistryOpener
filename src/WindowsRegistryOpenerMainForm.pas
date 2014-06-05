unit WindowsRegistryOpenerMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TFormWindowsRegistryOpenerMain = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormWindowsRegistryOpenerMain: TFormWindowsRegistryOpenerMain;

implementation

{$R *.dfm}

procedure TFormWindowsRegistryOpenerMain.FormCreate(Sender: TObject);
begin
  Caption := Application.Title;
end;

end.
