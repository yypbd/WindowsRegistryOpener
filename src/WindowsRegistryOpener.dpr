program WindowsRegistryOpener;

uses
  Vcl.Forms,
  WindowsRegistryOpenerMainForm in 'WindowsRegistryOpenerMainForm.pas' {FormWindowsRegistryOpenerMain},
  RegForm in 'RegForm.pas' {FormReg},
  AppData in 'AppData.pas',
  DataMgr in 'DataMgr.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Windows Registry Opener v0.1';
  Application.CreateForm(TFormWindowsRegistryOpenerMain, FormWindowsRegistryOpenerMain);
  Application.CreateForm(TFormReg, FormReg);
  Application.Run;
end.
