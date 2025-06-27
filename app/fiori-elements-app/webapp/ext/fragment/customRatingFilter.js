sap.ui.define(["sap/ui/model/Filter", "sap/ui/model/FilterOperator"], function (Filter, FilterOperator) {
    "use strict";
    return {
        customRatingFilter: function (sValue) {
            switch (sValue) {
                case "0":
                    return new Filter({ path: "Rating", operator: FilterOperator.EQ, value1: 1 });
                case "1":
                    return new Filter({ path: "Rating", operator: FilterOperator.EQ, value1: 2 });
                case "2":
                    return new Filter({ path: "Rating", operator: FilterOperator.EQ, value1: 3 });
                case "3":
                    return new Filter({ path: "Rating", operator: FilterOperator.EQ, value1: 4 });
                case "4":
                    return new Filter({ path: "Rating", operator: FilterOperator.EQ, value1: 5 });
            }
        }
    };
});
