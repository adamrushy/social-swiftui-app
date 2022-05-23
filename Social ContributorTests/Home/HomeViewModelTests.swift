//
//  HomeViewModelTests.swift
//  Social ContributorTests
//
//  Created by Danijela Vrzan on 2022-05-23.
//

import XCTest
@testable import Social_Contributor

class HomeViewModelTests: XCTestCase {
    var viewModel: HomeViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        viewModel = HomeViewModel()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        viewModel = nil
    }

    //MARK: Tests
    func test_quote_notNil_whenVMInitialized() {
        XCTAssertNotNil(viewModel.quote)
    }
}
