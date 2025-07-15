sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'fiorielementsapp/test/integration/FirstJourney',
		'fiorielementsapp/test/integration/pages/ProductsList',
		'fiorielementsapp/test/integration/pages/ProductsObjectPage',
		'fiorielementsapp/test/integration/pages/ProductCommentsObjectPage'
    ],
    function(JourneyRunner, opaJourney, ProductsList, ProductsObjectPage, ProductCommentsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('fiorielementsapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheProductsList: ProductsList,
					onTheProductsObjectPage: ProductsObjectPage,
					onTheProductCommentsObjectPage: ProductCommentsObjectPage
                }
            },
            opaJourney.run
        );
    }
);