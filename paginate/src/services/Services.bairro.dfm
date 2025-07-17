object ServiceBairro: TServiceBairro
  Height = 480
  Width = 640
  object mtBairros: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 72
    Top = 128
    object mtBairrosID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
    end
    object mtBairrosNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
  end
end
