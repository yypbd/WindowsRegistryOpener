object FormWindowsRegistryOpenerMain: TFormWindowsRegistryOpenerMain
  Left = 0
  Top = 0
  Caption = 'FormWindowsRegistryOpenerMain'
  ClientHeight = 369
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object ListViewRegistry: TListView
    Left = 0
    Top = 0
    Width = 635
    Height = 324
    Align = alClient
    Columns = <
      item
        Caption = 'Name'
        Width = 200
      end
      item
        Caption = 'Registry'
        Width = 400
      end>
    MultiSelect = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnDblClick = ListViewRegistryDblClick
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 324
    Width = 635
    Height = 45
    Align = alBottom
    TabOrder = 1
    DesignSize = (
      635
      45)
    object ButtonReg: TButton
      Left = 8
      Top = 10
      Width = 75
      Height = 25
      Caption = #46321#47197
      TabOrder = 0
      OnClick = ButtonRegClick
    end
    object ButtonEdit: TButton
      Left = 89
      Top = 10
      Width = 75
      Height = 25
      Caption = #49688#51221
      TabOrder = 1
      OnClick = ButtonEditClick
    end
    object ButtonDelete: TButton
      Left = 170
      Top = 10
      Width = 75
      Height = 25
      Caption = #49325#51228
      TabOrder = 2
      OnClick = ButtonDeleteClick
    end
    object ButtonWiki: TButton
      Left = 541
      Top = 10
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Wiki'
      TabOrder = 3
      OnClick = ButtonWikiClick
    end
  end
end
