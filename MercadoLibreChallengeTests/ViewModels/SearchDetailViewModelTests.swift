//
//  SearchDetailViewModelTests.swift
//  MercadoLibreChallengeTests
//
//  Created by Mario Rúa on 31/03/21.
//

import XCTest
@testable import MercadoLibreChallenge

class SearchDetailViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWhenSearchWasPerformed_GivenANotNilResult_ThenBuildCellViewModels() throws {
        guard let sut = SceneDelegate.diContainer.resolve(SearchDetailViewModelType.self) else { return }
        let expectation = self.expectation(description: "Build cellViewModels expectation")
        
        var cellViewModels: [CellViewModel] = [CellViewModel]()
        
        let json = Data("""
        {
            "results": [
                {
                    "id": "MLA897752664",
                    "site_id": "MLA",
                    "title": "Moto  G6 Plus 64 Gb Nimbus 4 Gb Ram",
                    "seller": {
                        "id": 90205574,
                        "permalink": "http://perfil.mercadolibre.com.ar/CLIMAX+TIENDAONLINE",
                        "registration_date": "2005-12-23T11:24:07.000-04:00",
                        "car_dealer": false,
                        "real_estate_agency": false,
                        "tags": [
                            "normal",
                            "user_info_verified",
                            "eshop",
                            "mshops",
                            "messages_as_seller",
                            "messages_as_buyer"
                        ],
                        "seller_reputation": {
                            "transactions": {
                                "total": 2104,
                                "canceled": 256,
                                "period": "historic",
                                "ratings": {
                                    "negative": 0.03,
                                    "positive": 0.94,
                                    "neutral": 0.03
                                },
                                "completed": 1848
                            },
                            "level_id": "3_yellow"
                        }
                    },
                    "price": 41998.99,
                    "sale_price": null,
                    "currency_id": "ARS",
                    "available_quantity": 9,
                    "sold_quantity": 0,
                    "buying_mode": "buy_it_now",
                    "listing_type_id": "gold_special",
                    "stop_time": "2040-11-13T04:00:00.000Z",
                    "condition": "new",
                    "permalink": "https://www.mercadolibre.com.ar/moto-g6-plus-64-gb-nimbus-4-gb-ram/p/MLA9452524",
                    "thumbnail": "http://http2.mlstatic.com/D_795558-MLA31003306206_062019-I.jpg",
                    "thumbnail_id": "795558-MLA31003306206_062019",
                    "accepts_mercadopago": true,
                    "installments": {
                        "quantity": 12,
                        "amount": 5955.81,
                        "rate": 70.17,
                        "currency_id": "ARS"
                    },
                    "original_price": null,
                    "category_id": "MLA1055",
                    "official_store_id": null,
                    "domain_id": "MLA-CELLPHONES",
                    "catalog_product_id": "MLA9452524",
                    "catalog_listing": true,
                    "use_thumbnail_id": true,
                    "order_backend": 1
                }
            ]
        }
""".utf8)
        
        sut.outputs.cellViewModels.bind { result in
            cellViewModels = result
            expectation.fulfill()
        }
        
        let result: Results = try JSONDecoder().decode(Results.self, from: json)
        sut.inputs.loadResult(result: result)
        
        waitForExpectations(timeout: 3.0) { (error) in
            XCTAssertGreaterThan(cellViewModels.count, 0)
        }
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
