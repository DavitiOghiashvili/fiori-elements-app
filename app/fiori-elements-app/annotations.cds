using StoreService as Service from '../../srv/store-service';

annotate Service.Products with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Name',
                Value : Name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Price_amount',
                Value : Price_amount,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Price_currency',
                Value : Price_currency,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Specs',
                Value : Specs,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Rating',
                Value : Rating,
            },
            {
                $Type : 'UI.DataField',
                Label : 'SupplierInfo',
                Value : SupplierInfo,
            },
            {
                $Type : 'UI.DataField',
                Label : 'MadeIn',
                Value : MadeIn,
            },
            {
                $Type : 'UI.DataField',
                Label : 'ProductionCompanyName',
                Value : ProductionCompanyName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Status',
                Value : Status,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Name',
            Value : Name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Price_amount',
            Value : Price_amount,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Price_currency',
            Value : Price_currency,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Specs',
            Value : Specs,
        },
    ],
);

annotate Service.Products with {
    Store @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Stores',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : Store_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Email',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'PhoneNumber',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Address',
            },
        ],
    }
};

