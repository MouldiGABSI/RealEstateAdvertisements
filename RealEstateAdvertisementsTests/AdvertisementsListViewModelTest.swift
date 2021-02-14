//
//  AdvertisementsListViewModelTest.swift
//  RealEstateAdvertisementsTests
//
//  Created by Mouldi GABSI on 14/02/2021.
//

import XCTest

@testable import RealEstateAdvertisements

class AdvertisementsListViewModelTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testViewModelWithEmptyJSONFileShouldBeEmpty() throws {
        // This is an example of a functional test case.
        let mockAPIService = MockAdvertisementListAPIService(fileName: "Empty_Advertisement_List")
        mockAPIService.fetchAdvertisementsList { (result:Result<Advertisements, APIError>) in
            
            switch result {
            case .success(let advertisements):
                XCTAssertEqual(advertisements.items.count, 0 , "result should be a success")
                let viewModel = AdvertisementListWorker().generateSectionsViewModel(advertisements: advertisements.items)
                XCTAssertNotNil(viewModel, "View Model should not be nil")
                XCTAssertEqual(viewModel.count, 0, "viewModel should be empty")
            case.failure(let error):
                XCTFail("result should be success not an \(error.message) error")
            }
        }
    }

    func testViewModelWithNonEmptyJSONFileContainTheRightData() throws {
        // This is an example of a performance test case. Two_Advertisements
        let mockAPIService = MockAdvertisementListAPIService(fileName: "Two_Advertisements")
        mockAPIService.fetchAdvertisementsList { (result:Result<Advertisements, APIError>) in
            
            switch result {
            case .success(let advertisements):
                XCTAssertEqual(advertisements.items.count, 2 , "result should be a success")
                let sections = AdvertisementListWorker().generateSectionsViewModel(advertisements: advertisements.items)
                XCTAssertNotNil(sections, "View Model should not be nil")
                XCTAssertEqual(sections.count, 1, "viewModel should be empty")
                XCTAssertEqual(sections[0].dataModel.count, 2, "First section should contain two rows")
            case.failure(let error):
                XCTFail("result should be success not an \(error.message) error")
            }
        }
    }
    
    func testViewModelWithWrongJSONStructureShouldThrowsEncodingError() {
        let mockAPIService = MockAdvertisementListAPIService(fileName: "wrong_json_structure")
        mockAPIService.fetchAdvertisementsList { (result:Result<Advertisements, APIError>) in
            
            switch result {
            case .success( _):
                XCTFail("result should be fail!")
            case.failure(let error):
                XCTAssertNotNil(error, "Error should not be nil")
                XCTAssertEqual(error.message, "We could not decode the response.", "Error should be a decoding error")
            }
        }
    }

}
