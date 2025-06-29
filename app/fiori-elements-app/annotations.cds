using StoreService as service from '../../srv/store-service';

// List Report
annotate service.Products with @(
  UI.SelectionFields: [
    Rating,
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
  UI.HeaderInfo: {
    TypeName      : '{@i18n>productTitle}',
    TypeNamePlural: '{@i18n>productsTitle}',
    Title         : { 
      Value: Name 
    }
  },

  UI.Identification : [
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

// Object Page Comments
annotate service.ProductComments with @(
  UI.Facets: [{
    $Type : 'UI.ReferenceFacet',
    ID    : 'CommentDetails',
    Label : '{@i18n>commentDetails}',
    Target: '@UI.FieldGroup#CommentDetails'
  }],

  UI.FieldGroup #CommentDetails: {
    Data: [
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

  UI.LineItem: [
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
);
