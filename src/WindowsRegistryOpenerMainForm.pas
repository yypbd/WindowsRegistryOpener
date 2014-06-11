unit WindowsRegistryOpenerMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, RegForm;

type
  TFormWindowsRegistryOpenerMain = class(TForm)
    ListViewRegistry: TListView;
    PanelBottom: TPanel;
    ButtonReg: TButton;
    ButtonEdit: TButton;
    ButtonDelete: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ButtonRegClick(Sender: TObject);
    procedure ButtonEditClick(Sender: TObject);
    procedure ListViewRegistryDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormWindowsRegistryOpenerMain: TFormWindowsRegistryOpenerMain;

implementation

uses
  ShellAPI, DataMgr;

{$R *.dfm}

procedure TFormWindowsRegistryOpenerMain.ButtonDeleteClick(Sender: TObject);
var
  I: Integer;
begin
  for I := ListViewRegistry.Items.Count - 1 downto 0 do
  begin
    if ListViewRegistry.Items[I].Selected then
    begin
      ListViewRegistry.Items[I].Delete;
    end;
  end;
end;

procedure TFormWindowsRegistryOpenerMain.ButtonEditClick(Sender: TObject);
begin
  if ListViewRegistry.Selected = nil then Exit;

  FormReg := TFormReg.Create( nil );

  try
    FormReg.LabeledEditName.Text := ListViewRegistry.Selected.Caption;
    FormReg.LabeledEditRegistry.Text := ListViewRegistry.Selected.SubItems[0];
    if FormReg.ShowModal = mrOk then
    begin
      ListViewRegistry.Selected.Caption := FormReg.LabeledEditName.Text;
      ListViewRegistry.Selected.SubItems[0] := FormReg.LabeledEditRegistry.Text;
    end;
  finally
    FormReg.Free;
  end;
end;

procedure TFormWindowsRegistryOpenerMain.ButtonRegClick(Sender: TObject);
var
  ListItem: TListItem;
begin
  FormReg := TFormReg.Create( nil );

  try
    FormReg.LabeledEditName.Text := '';
    FormReg.LabeledEditRegistry.Text := '';
    if FormReg.ShowModal = mrOk then
    begin
      ListItem := ListViewRegistry.Items.Add;
      ListItem.Caption := FormReg.LabeledEditName.Text;
      ListItem.SubItems.Add( FormReg.LabeledEditRegistry.Text );
    end;
  finally
    FormReg.Free;
  end;
end;

procedure TFormWindowsRegistryOpenerMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TDataMgr.SaveToFile( ListViewRegistry );
end;

procedure TFormWindowsRegistryOpenerMain.FormCreate(Sender: TObject);
begin
  Caption := Application.Title;

  TDataMgr.LoadFromFile( ListViewRegistry );
end;

procedure TFormWindowsRegistryOpenerMain.ListViewRegistryDblClick(
  Sender: TObject);
begin
  if ListViewRegistry.Selected = nil then Exit;

  // ShellExecute( 0, 'open', 'regjump.exe', 'HKLM\Software\Microsoft\Windows', nil, SW_NORMAL );
  // ShellExecute( 0, 'open', 'regjump.exe', 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows', nil, SW_NORMAL );
  ShellExecute( 0, 'open', 'regjump.exe', PChar(ListViewRegistry.Selected.SubItems[0]), nil, SW_SHOWNORMAL );
end;

end.
