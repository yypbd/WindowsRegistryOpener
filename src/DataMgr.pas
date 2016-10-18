unit DataMgr;

interface

uses
  SysUtils, Classes, ComCtrls;

type
  TDataMgr = class
  private
    class function Path: string;
  public
    class procedure SaveToFile( AListView: TListView );
    class procedure LoadFromFile( AListView: TListView );
  end;

implementation

uses
  AppData;

{ TDataMgr }

class procedure TDataMgr.LoadFromFile(AListView: TListView);
var
  StringList: TStringList;
  ListItem: TListItem;
  I: Integer;
  Name, Registry: string;
begin
  if not FileExists( Path ) then Exit;

  AListView.Items.Clear;

  StringList := TStringList.Create;
  try
    StringList.NameValueSeparator := #9;
    StringList.LoadFromFile( Path );

    for I := 0 to StringList.Count - 1 do
    begin
      Name := StringList.Names[I];
      Registry := StringList.ValueFromIndex[I];

      ListItem := AListView.Items.Add;
      ListItem.Caption := Name;
      ListItem.SubItems.Add( Registry );
    end;
  finally
    StringList.Free;
  end;
end;

class function TDataMgr.Path: string;
begin
  Result := TAppData.Path + 'data.dat';
end;

class procedure TDataMgr.SaveToFile(AListView: TListView);
var
  StringList: TStringList;
  ListItem: TListItem;
  I: Integer;
  Name, Registry: string;
begin
  if AListView.Items.Count > 0 then
  begin
    StringList := TStringList.Create;
    try
      for I := 0 to AListView.Items.Count - 1 do
      begin
        StringList.Add( AListView.Items[I].Caption + #9 + AListView.Items[I].SubItems[0] );
      end;

      StringList.SaveToFile( Path );
    finally
      StringList.Free;
    end;
  end
  else
  begin
    DeleteFile( Path );
  end;
end;

end.
