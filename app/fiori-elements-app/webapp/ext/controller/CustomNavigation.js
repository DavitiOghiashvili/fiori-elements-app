sap.ui.define([], function () {
    'use strict';
    return {
        NavigateToFreestyleApp: function () {
            sap.ushell.Container.getServiceAsync("CrossApplicationNavigation").then(function (navService) {
                navService.toExternal({
                    target: {
                        shellHash: "#freestylesapui5app-display"
                    }
                });
            });
        },
    };
});
