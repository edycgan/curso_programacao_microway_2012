inherited frmConsultas: TfrmConsultas
  Caption = 'Consultas'
  OnActivate = FormActivate
  ExplicitTop = -152
  PixelsPerInch = 96
  TextHeight = 13
  inherited tbCadastro: TToolBar
    inherited dbnCadstro: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited gbxConsulta: TGroupBox
    inherited dbgConsulta: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'DATA_CONSULTA'
          Title.Caption = 'Data da Consulta'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_MEDICO'
          Title.Caption = 'M'#233'dico'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_PACIENTE'
          Title.Caption = 'Paciente'
          Width = 60
          Visible = True
        end>
    end
  end
  inherited gbxCadastro: TGroupBox
    object lblCodigo: TLabel
      Left = 33
      Top = 35
      Width = 38
      Height = 13
      Caption = 'Codigo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNome: TLabel
      Left = 33
      Top = 75
      Width = 49
      Height = 13
      Caption = 'Paciente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblEstado: TLabel
      Left = 33
      Top = 115
      Width = 40
      Height = 13
      Caption = 'M'#233'dico'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 33
      Top = 155
      Width = 52
      Height = 13
      Caption = 'Conv'#234'nio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 33
      Top = 194
      Width = 27
      Height = 13
      Caption = 'Data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbeCodigo: TDBEdit
      Left = 77
      Top = 32
      Width = 121
      Height = 21
      DataField = 'CODIGO_CONSULTA'
      DataSource = dsGenerico
      ReadOnly = True
      TabOrder = 0
    end
    object dblPaciente: TDBLookupComboBox
      Left = 88
      Top = 75
      Width = 145
      Height = 21
      DataField = 'CODIGO_PACIENTE'
      DataSource = dsGenerico
      KeyField = 'CODIGO_PACIENTE'
      ListField = 'NOME_PACIENTE'
      ListSource = dsPaciente
      TabOrder = 1
      OnCloseUp = dblPacienteCloseUp
    end
    object dblMedico: TDBLookupComboBox
      Left = 79
      Top = 115
      Width = 145
      Height = 21
      DataField = 'CODIGO_MEDICO'
      DataSource = dsGenerico
      KeyField = 'CODIGO_MEDICO'
      ListField = 'NOME_MEDICO'
      ListSource = dsMedico
      TabOrder = 2
    end
    object dblConvenio: TDBLookupComboBox
      Left = 91
      Top = 155
      Width = 145
      Height = 21
      DataField = 'CODIGO_CONVENIO'
      DataSource = dsGenerico
      ListField = 'NOME_PACIENTE'
      ListSource = dsConvenio
      TabOrder = 3
    end
  end
  object dbeData: TDBEdit [3]
    Left = 74
    Top = 238
    Width = 121
    Height = 21
    CharCase = ecUpperCase
    DataField = 'DATA_CONSULTA'
    DataSource = dsGenerico
    TabOrder = 3
  end
  inherited dsGenerico: TDataSource
    DataSet = dmPrincipal.cdsConsultas
    OnDataChange = dsGenericoDataChange
  end
  object dsPaciente: TDataSource
    DataSet = dmPrincipal.cdsPacientes
    Left = 296
    Top = 232
  end
  object dsMedico: TDataSource
    DataSet = dmPrincipal.cdsMedicos
    Left = 360
    Top = 232
  end
  object dsConvenio: TDataSource
    DataSet = dmPrincipal.cdsConeviosPacientes
    Left = 424
    Top = 232
  end
  object sqlPacienteConvenio: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT convenios_pacientes.*, nome_convenio'
      'FROM convenios_pacientes'
      'LEFTJOIN convenios ON'
      '(convenios_pacientes.codigo_convenio ='
      'convenios.codigo_convenio)'
      'WHERE codigo_paciente =: codigo_paciente')
    SQLConnection = dmPrincipal.sqlConexaoDB
    Left = 304
    Top = 96
  end
  object dspPacienteConvenio: TDataSetProvider
    DataSet = dmPrincipal.cdsConeviosPacientes
    Left = 424
    Top = 96
  end
  object cdsPacienteConvenio: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPacienteConvenio'
    Left = 296
    Top = 168
    object cdsPacienteConvenioCODIGO_CONVENIO: TFMTBCDField
      FieldName = 'CODIGO_CONVENIO'
      Required = True
      Precision = 32
      Size = 0
    end
    object cdsPacienteConvenioCODIGO_PACIENTE: TFMTBCDField
      FieldName = 'CODIGO_PACIENTE'
      Required = True
      Precision = 32
      Size = 0
    end
  end
end
