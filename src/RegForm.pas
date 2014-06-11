unit RegForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

const
  ROOT_KEY_LONGNAMES: array[0..4] of string = (
    'HKEY_CLASSES_ROOT', 'HKEY_CURRENT_USER', 'HKEY_LOCAL_MACHINE',
    'HKEY_USERS', 'HKEY_CURRENT_CONFIG');

  ROOT_KEY_SHORTNAMES: array[0..4] of string = (
    'HKCR', 'HKCU', 'HKLM',
    'HKU', 'HKCC');

type
  TFormReg = class(TForm)
    LabeledEditName: TLabeledEdit;
    LabeledEditRegistry: TLabeledEdit;
    ButtonSave: TButton;
    ButtonCancel: TButton;
    Shape1: TShape;
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
  private
    { Private declarations }
    function GetRootName( const AStr: string ): string;
    function RootInNames( const ARoot: string ): Integer;
    function NormalizeRegistry( const AStr: string; AKeyIndex: Integer ): string;
    function ValidateRegistryValue: Boolean;
  public
    { Public declarations }
  end;

var
  FormReg: TFormReg;

implementation

uses
  Registry;

{$R *.dfm}

procedure TFormReg.ButtonCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFormReg.ButtonSaveClick(Sender: TObject);
begin
  if LabeledEditName.Text = '' then
  begin
    ShowMessage( '이름을 입력하세요.' );
    LabeledEditName.SetFocus;
    Exit;
  end;

  if LabeledEditRegistry.Text = '' then
  begin
    ShowMessage( '레지스트리 경로를 입력하세요.' );
    LabeledEditRegistry.SetFocus;
    Exit;
  end;

  if not ValidateRegistryValue then
  begin
    ShowMessage( '레지스트리 경로가 올바르지 않습니다.' );
    LabeledEditRegistry.SetFocus;
    Exit;
  end;

  ModalResult := mrOk;
end;

function TFormReg.GetRootName( const AStr: string ): string;
var
  BackSlashPos: Integer;
begin
  Result := AStr;
  BackSlashPos := Pos( '\', AStr );

  if BackSlashPos > 0 then
    Result := Copy( AStr, 1, BackSlashPos - 1 );
end;

function TFormReg.NormalizeRegistry(const AStr: string; AKeyIndex: Integer): string;
var
  BackSlashPos: Integer;
begin
  Result := ROOT_KEY_LONGNAMES[AKeyIndex];

  BackSlashPos := Pos( '\', AStr );
  if BackSlashPos > 0 then
    Result := Result + Copy( AStr, BackSlashPos, Length(AStr) - BackSlashPos + 1 );
end;

function TFormReg.RootInNames(const ARoot: string): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := Low(ROOT_KEY_LONGNAMES) to High(ROOT_KEY_LONGNAMES) do
  begin
    if UpperCase(ARoot) = ROOT_KEY_LONGNAMES[I] then
    begin
      Result := I;
      Exit;
    end;
  end;

  for I := Low(ROOT_KEY_SHORTNAMES) to High(ROOT_KEY_SHORTNAMES) do
  begin
    if UpperCase(ARoot) = ROOT_KEY_SHORTNAMES[I] then
    begin
      Result := I;
      Exit;
    end;
  end;
end;

function TFormReg.ValidateRegistryValue: Boolean;
var
  Value: string;
  Root: string;
  KeyIndex: Integer;
  Registry: TRegistry;
begin
  Result := False;
  Value := StringReplace( LabeledEditRegistry.Text, '\\', '\', [rfReplaceAll] );

  Root := GetRootName( Value );
  if Root = '' then Exit;

  KeyIndex := RootInNames( Root );
  if KeyIndex = -1 then Exit;

  Value := NormalizeRegistry( Value, KeyIndex );

  LabeledEditRegistry.Text := Value;

  Result := True;
end;

end.
