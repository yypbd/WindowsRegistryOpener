unit AppData;

interface

uses
  Windows, SysUtils;

type
  TAppData = class
  private
    class function GetSpecialFolderPath(const ACSIDL: Word): String;
  public
    class function Path: string;
  end;

implementation

uses
  ShlObj;

{ TAppData }

class function TAppData.Path: string;
begin
  Result := GetSpecialFolderPath( CSIDL_APPDATA ) + 'yypbd\WindowsRegistryOpener\';
  ForceDirectories( Result );
end;

class function TAppData.GetSpecialFolderPath(const ACSIDL: Word): String;
var
  pidl: PItemIDList;
  hRes: HRESULT;
  Success: Boolean;
  RealPath: array[0..MAX_PATH] of Char;
begin
  Result := '';

  hRes := SHGetSpecialFolderLocation(0, ACSIDL, pidl);

  if hRes = NO_ERROR then
  begin
    Success := SHGetPathFromIDList( pidl, RealPath );
    if Success then
      Result := IncludeTrailingPathDelimiter( RealPath );
  end;
end;

end.
