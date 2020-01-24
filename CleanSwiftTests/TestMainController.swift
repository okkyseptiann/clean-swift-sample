//
//  TestMainController.swift
//  Clean Swift
//
//  Created by Okky Septian Pradana on 21/01/20.
//  Copyright © 2020 Okky Septian Pradana. All rights reserved.
//

import XCTest
@testable import Clean_Swift

class TestMainController: XCTestCase {
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testMainController() {
        let presenter = SampleCleanPresenter()
        var vc = SampleCleanInteractor(presenter)
        vc.doLoginService{}
    }

}
