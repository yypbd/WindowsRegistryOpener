program WindowsRegistryOpener;

uses
  Vcl.Forms,
  WindowsRegistryOpenerMainForm in 'WindowsRegistryOpenerMainForm.pas' {FormWindowsRegistryOpenerMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Windows Registry Opener v0.1';
  Application.CreateForm(TFormWindowsRegistryOpenerMain, FormWindowsRegistryOpenerMain);
  Application.Run;
end.
