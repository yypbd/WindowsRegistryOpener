object FormReg: TFormReg
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FormReg'
  ClientHeight = 230
  ClientWidth = 354
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object Shape1: TShape
    Left = 28
    Top = 156
    Width = 300
    Height = 2
  end
  object LabeledEditName: TLabeledEdit
    Left = 48
    Top = 44
    Width = 265
    Height = 20
    EditLabel.Width = 24
    EditLabel.Height = 12
    EditLabel.Caption = #51060#47492
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 0
  end
  object LabeledEditRegistry: TLabeledEdit
    Left = 48
    Top = 100
    Width = 265
    Height = 20
    EditLabel.Width = 60
    EditLabel.Height = 12
    EditLabel.Caption = #47112#51648#49828#53944#47532
    ImeName = 'Microsoft Office IME 2007'
    TabOrder = 1
  end
  object ButtonSave: TButton
    Left = 92
    Top = 184
    Width = 75
    Height = 25
    Caption = #51200#51109
    TabOrder = 2
    OnClick = ButtonSaveClick
  end
  object ButtonCancel: TButton
    Left = 188
    Top = 184
    Width = 75
    Height = 25
    Caption = #52712#49548
    TabOrder = 3
    OnClick = ButtonCancelClick
  end
end
