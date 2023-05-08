//
//  CatTypesVMTests.swift
//  CodersListTests
//
//  Created by Mohamed Salem on 23/03/2022.
//
/*
 Given-When-Then
 Arrange-Act-Assert.
 */

import XCTest
@testable import CodersList

class CatTypesVMTests: XCTestCase {
    
    var sut: CatTypesVM!
    let networkMonitor = NetworkMonitor.shared
    let cancellableBag = CancellableBag()

    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CatTypesVM()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testGetBreedsSuccess() throws {
        try XCTSkipUnless(networkMonitor.isReachable,
                          "Network connectivity needed for this test.")
        let promise = expectation(description: "getting all breeds")
        sut.useCases.getBreedsList()
            .receive(on: RunLoop.main)
            .sinkToResult {
                switch $0 {
                case let .success(value):
                    XCTAssertNotNil(value, " list of cats is nil ")
                    promise.fulfill()
                case let .failure(value):
                    XCTFail(value.errorDescription ?? "No Error Descriotion" )
                }
            }.store(in: cancellableBag)
        wait(for: [promise], timeout: 2)
    }

}
