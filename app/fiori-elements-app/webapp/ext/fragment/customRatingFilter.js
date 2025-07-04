sap.ui.define(["sap/ui/model/Filter", "sap/ui/model/FilterOperator"], function (Filter, FilterOperator) {
    "use strict";
    return {
        customRatingFilter(sValue) {
            return new Filter({ path: "Rating", operator: FilterOperator.EQ, value1: ++sValue });
        }
    };
});
