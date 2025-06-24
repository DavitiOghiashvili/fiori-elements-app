using StoreService as service from '../../srv/store-service';

annotate service.Products with @(
  UI.FieldGroup #GeneratedGroup: {
    $Type: 'UI.FieldGroupType',
    Data: [
      {
        $Type: 'UI.DataField',
        Label: '{@i18n>name}',
        Value: Name
      },
      {
        $Type: 'UI.DataField',
        Label: '{@i18n>price}',
        Value: Price_amount
      },
      {
        $Type: 'UI.DataField',
        Label: '{@i18n>currency}',
        Value: Price_currency
      },
      {
        $Type: 'UI.DataField',
        Label: '{@i18n>specs}',
        Value: Specs
      },
      {
        $Type: 'UI.DataField',
        Label: '{@i18n>rating}',
        Value: Rating
      },
      {
        $Type: 'UI.DataField',
        Label: '{@i18n>status}',
        Value: Status
      },
      {
        $Type: 'UI.DataField',
        Label: '{@i18n>supplierInfo}',
        Value: SupplierInfo
      },
      {
        $Type: 'UI.DataField',
        Label: '{@i18n>madeIn}',
        Value: MadeIn
      },
      {
        $Type: 'UI.DataField',
        Label: '{@i18n>productionCompanyName}',
        Value: ProductionCompanyName
      }
    ]
  },

  UI.Facets: [
    {
      $Type: 'UI.ReferenceFacet',
      ID: 'GeneratedFacet1',
      Label: '{i18n>generalInfo}',
      Target: '@UI.FieldGroup#GeneratedGroup'
    }
  ],

  UI.LineItem: [
    {
      $Type: 'UI.DataField',
      Label: '{@i18n>name}',
      Value: Name
    },
    {
      $Type: 'UI.DataField',
      Label: '{@i18n>price}',
      Value: Price_amount
    },
    {
      $Type: 'UI.DataField',
      Label: '{@i18n>currency}',
      Value: Price_currency
    },
    {
      $Type: 'UI.DataField',
      Label: '{@i18n>rating}',
      Value: Rating
    },
    {
      $Type: 'UI.DataField',
      Label: '{@i18n>status}',
      Value: Status
    }
  ]
);

annotate service.Products with {
  Store @Common.ValueList: {
    $Type: 'Common.ValueListType',
    CollectionPath: 'Stores',
    Parameters: [
      {
        $Type: 'Common.ValueListParameterInOut',
        LocalDataProperty: Store_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type: 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Name'
      },
      {
        $Type: 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Email'
      },
      {
        $Type: 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'PhoneNumber'
      },
      {
        $Type: 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'Address'
      }
    ]
  }
};
