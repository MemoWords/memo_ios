//
//  ClassificateTests.swift
//  memoTests
//
//  Created by Elias Ferreira on 23/08/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import XCTest

@testable import memo

class ClassificateTests: XCTestCase {
    func test_Algorithm_classificate_theDaysToIncrementAndTheLastDayIncrementedUpdated() {
        let input1 = 1
        let input2 = 11
        
        let output = Classification.classificate(val: input1, lastDayIncremented: input2)
        
        XCTAssertEqual(output, [1, 6])
    }
}
