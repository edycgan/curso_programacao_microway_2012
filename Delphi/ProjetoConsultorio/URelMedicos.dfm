inherited frmRelMedicos: TfrmRelMedicos
  Caption = 'Relat'#243'rio de M'#233'dicos'
  ClientHeight = 281
  OnActivate = FormActivate
  ExplicitWidth = 347
  ExplicitHeight = 313
  PixelsPerInch = 96
  TextHeight = 13
  object rgSelecao: TRadioGroup [0]
    Left = 8
    Top = 8
    Width = 325
    Height = 41
    Caption = 'Tipo de Relat'#243'rio'
    Columns = 3
    Items.Strings = (
      'Geral'
      'Individual'
      'Per'#237'odo')
    TabOrder = 0
    OnClick = rgSelecaoClick
  end
  object gbPeriodo: TGroupBox [1]
    Left = 8
    Top = 127
    Width = 325
    Height = 98
    Caption = 'Per'#237'odo'
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 32
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object Label2: TLabel
      Left = 16
      Top = 64
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    object DateTimePicker1: TDateTimePicker
      Left = 80
      Top = 24
      Width = 186
      Height = 21
      Date = 41195.428868263890000000
      Time = 41195.428868263890000000
      TabOrder = 0
    end
    object DateTimePicker2: TDateTimePicker
      Left = 80
      Top = 59
      Width = 186
      Height = 21
      Date = 41195.428872604160000000
      Time = 41195.428872604160000000
      TabOrder = 1
    end
  end
  object gbIndividual: TGroupBox [2]
    Left = 8
    Top = 55
    Width = 325
    Height = 66
    Caption = 'Individual'
    TabOrder = 2
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 16
      Top = 24
      Width = 289
      Height = 21
      TabOrder = 0
    end
  end
  object BitBtn1: TBitBtn [3]
    Left = 88
    Top = 237
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    DoubleBuffered = True
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn [4]
    Left = 169
    Top = 237
    Width = 75
    Height = 25
    Caption = 'Sair'
    DoubleBuffered = True
    Kind = bkCancel
    ParentDoubleBuffered = False
    TabOrder = 4
  end
  inherited dsGenerico: TDataSource
    DataSet = dmPrincipal.cdsMedicos
    Left = 8
    Top = 376
  end
end
