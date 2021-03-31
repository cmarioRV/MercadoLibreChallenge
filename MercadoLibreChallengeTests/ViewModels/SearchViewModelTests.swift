//
//  SearchViewModelTests.swift
//  MercadoLibreChallengeTests
//
//  Created by Mario Rúa on 31/03/21.
//

import XCTest
@testable import MercadoLibreChallenge

class SearchViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWhenUserIntroducesText_GivenLessThanThreeCharacters_ThenDoesNotSearchAnything() throws {
        guard let sut = SceneDelegate.diContainer.resolve(SearchViewModelType.self) else { return }
        let expectation = self.expectation(description: "Don't search expectation")
        let query = "mo"
        var cellViewModels: [SearchViewCellViewModel] = [SearchViewCellViewModel]()

        sut.inputs.search(text: query)
        
        let timeInSeconds = 2.0
        DispatchQueue.main.asyncAfter(deadline: .now() + timeInSeconds) {
            cellViewModels = sut.outputs.cellViewModels.value
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: timeInSeconds + 1) { (error) in
            XCTAssertEqual(cellViewModels.count, 0)
        }
    }
    
    func testWhenUserIntroducesText_GivenMoreThanTwoCharacters_ThenDoesSearch() throws {
        guard let sut = SceneDelegate.diContainer.resolve(SearchViewModelType.self) else { return }
        let expectation = self.expectation(description: "Perform a search expectation")
        let query = "mot"
        var cellViewModels: [SearchViewCellViewModel] = [SearchViewCellViewModel]()

        sut.outputs.cellViewModels.bind { result in
            cellViewModels = result
            expectation.fulfill()
        }
        
        sut.inputs.search(text: query)

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
