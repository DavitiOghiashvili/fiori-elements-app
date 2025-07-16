using StoreService as service from '../../srv/store-service';

// List Report
annotate service.Products with @(
  Common.SideEffects #MutateSideEffect: {
    SourceProperties: ['Status'],
    TargetProperties: ['Rating'],
    TriggerAction: 'StoreService.mutate'
  },

  Common.SideEffects #AfterGetAverageRating: {
    TriggerAction   : 'StoreService.getAverageRating',
    TargetEntities  : ['/Products'],
  },

  Common.SideEffects #AfterMutate: {
    TriggerAction   : 'StoreService.mutate',
    TargetEntities  : ['/Products']
  },

  UI.SelectionFields: [
    Price_currency
  ],

  UI.PresentationVariant: {
    SortOrder: [
      { 
        Property  : createdAt, 
        Descending: true 
      }
    ],
    GroupBy       : ['SupplierInfo'],
    Visualizations: ['@UI.LineItem']
  },

  UI.DataPoint #rating: {
    Value        : Rating,
    Visualization: #Rating
  },

  UI.LineItem: [
    {
      $Type : 'UI.DataFieldForAction',
      Action: 'StoreService.getAverageRating',
      Label : '{@i18n>getAverageRating}'
    },
    {
      $Type : 'UI.DataFieldForAction',
      Action: 'StoreService.mutate',
      Label : '{@i18n>mutate}'
    },
    { 
      Value: Name, 
      Label: '{@i18n>name}' 
    },
    { 
      Value: Price_amount, 
      Label: '{@i18n>price}' 
    },
    { 
      Value: Price_currency, 
      Label: '{@i18n>currency}' 
    },
    { 
      $Type : 'UI.DataFieldForAnnotation', 
      Target: '@UI.DataPoint#rating',
      Label : '{@i18n>rating}' 
    },
    { 
      Value: Status, 
      Label: '{@i18n>status}' 
    },
    { 
      Value: SupplierInfo, 
      Label: '{@i18n>supplierInfo}' 
    }
  ],

  UI.SelectionVariant #OK: {
    SelectOptions: [{
      PropertyName: Status,
      Ranges: [{ 
        Option: #EQ, 
        Low   : 'OK', 
        Sign  : #I 
      }]
    }],
    Text: '{@i18n>ok}'
  },

  UI.SelectionVariant #STORAGE: {
    SelectOptions: [{
      PropertyName: Status,
      Ranges: [{ 
        Option: #EQ, 
        Low   : 'STORAGE', 
        Sign  : #I 
      }]
    }],
    Text: '{@i18n>storage}'
  },

  UI.SelectionVariant #OUT_OF_STOCK: {
    SelectOptions: [{
      PropertyName: Status,
      Ranges: [{ 
        Option: #EQ, 
        Low   : 'OUT_OF_STOCK', 
        Sign  : #I 
      }]
    }],
    Text: '{@i18n>outOfStock}'
  }
);

// Object Page
annotate service.Products with @(
  Common.SideEffects #GetAverageRatingSideEffect: {
    TargetProperties: ['Rating'],
    TriggerAction: 'StoreService.getAverageRating'
  },

  UI.HeaderInfo: {
    TypeName      : '{@i18n>productTitle}',
    TypeNamePlural: '{@i18n>productsTitle}',
    Title         : { 
      Value: Name 
    }
  },

  UI.HeaderFacets: [
    {
      $Type : 'UI.ReferenceFacet',
      Target : '@UI.FieldGroup#ProductionCompanyName',
      Label : '{@i18n>productionCompanyName}'
    },
  ],

  UI.FieldGroup#ProductionCompanyName: {
    Data: [
      {Value: ProductionCompanyName}
    ]
  },

  UI.Identification : [
    {
      $Type : 'UI.DataFieldForAction',
      Action: 'StoreService.getAverageRating',
      Label : '{@i18n>getAverageRating}'
    },
    {
      $Type : 'UI.DataFieldForAction',
      Action: 'StoreService.mutate',
      Label : '{@i18n>mutate}'
    },
  ],

  UI.Facets: [
    {
      $Type : 'UI.ReferenceFacet',
      ID    : 'ProductForm',
      Label : '{@i18n>generalInfo}',
      Target: '@UI.FieldGroup#ProductForm'
    },
    {
      $Type : 'UI.ReferenceFacet',
      ID    : 'Comments',
      Label : '{@i18n>comments}',
      Target: 'Comment/@UI.LineItem'
    }
  ],

  UI.FieldGroup #ProductForm: {
    Data: [
      {
        $Type : 'UI.DataFieldForAction',
        Action: 'StoreService.getAverageRating',
        Label : '{@i18n>getAverageRating}'
      },
      {
        $Type : 'UI.DataFieldForAction',
        Action: 'StoreService.mutate',
        Label : '{@i18n>mutate}'
      },
      { 
        Value: Name, 
        Label: '{@i18n>name}' 
      },
      { 
        Value: Price_amount, 
        Label: '{@i18n>price}' 
      },
      { 
        Value: Price_currency, 
        Label: '{@i18n>currency}' 
      },
      { 
        Value: Specs, 
        Label: '{@i18n>specs}' 
      },
      { 
        Value: Rating, 
        Label: '{@i18n>rating}' 
      },
      { 
        Value: Status, 
        Label: '{@i18n>status}' 
      },
      { 
        Value: SupplierInfo, 
        Label: '{@i18n>supplierInfo}' 
      },
      { 
        Value: MadeIn, 
        Label: '{@i18n>madeIn}' 
      },
      { 
        Value: ProductionCompanyName, 
        Label: '{@i18n>productionCompanyName}' 
      }
    ]
  }
);

annotate service.Stores with @(
  UI.FieldGroup #StoreInfo: {
    Data: [
      {
        Value: Name,
        Label: '{@i18n>storeName}'
      },
      {
        Value: Email,
        Label: '{@i18n>email}'
      },
      {
        Value: PhoneNumber,
        Label: '{@i18n>phoneNumber}'
      },
      {
        Value: Address,
        Label: '{@i18n>address}'
      },
      {
        Value: FloorArea,
        Label: '{@i18n>floorArea}'
      },
    ]
  }
);

// Object Page Comments
annotate service.ProductComments with @(
  UI.Facets: [{
    $Type : 'UI.ReferenceFacet',
    ID    : 'CommentDetails',
    Label : '{@i18n>commentDetails}',
    Target: '@UI.FieldGroup#CommentDetails'
  }],

  UI.LineItem: [
    {
      $Type : 'UI.DataFieldForAction',
      Action: 'StoreService.getAverageRating',
      Label : '{@i18n>getAverageRating}'
    },
    {
      $Type : 'UI.DataFieldForAction',
      Action: 'StoreService.mutate',
      Label : '{@i18n>mutate}'
    },
    { 
      Value: Author, 
      Label: '{@i18n>author}' 
    },
    { 
      Value: Message, 
      Label: '{@i18n>commentText}' 
    },
    { 
      Value: Posted, 
      Label: '{@i18n>posted}' 
    },
    { 
      Value: Rating, 
      Label: '{@i18n>rating}' 
    }
  ],

  UI.FieldGroup #CommentDetails: {
    Data: [
      {
        $Type : 'UI.DataFieldForAction',
        Action: 'StoreService.getAverageRating',
        Label : '{@i18n>getAverageRating}'
      },
      {
        $Type : 'UI.DataFieldForAction',
        Action: 'StoreService.mutate',
        Label : '{@i18n>mutate}'
      },
      { 
        Value: Author, 
        Label: '{@i18n>author}' 
      },
      { 
        Value: Message, 
        Label: '{@i18n>commentText}' 
      },
      { 
        Value: Posted, 
        Label: '{@i18n>posted}' 
      },
      { 
        Value: Rating, 
        Label: '{@i18n>rating}' 
      }
    ]
  },
);
