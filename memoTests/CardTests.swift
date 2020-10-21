//
//  CardTests.swift
//  memoTests
//
//  Created by Elias Ferreira on 23/08/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import XCTest

@testable import memo

class CardTests: XCTestCase {
    func test_card_init_returnsACardWhitDefaultValues() {
        let sut = FMCard(content: "test")
        
        let output1 = sut.content
        let output2 = sut.nextStudyDay
        let output3 = sut.lastDaysIncremented
        
        XCTAssertEqual(output1, "test")
        XCTAssertEqual(output2, "23-08-2020")
        XCTAssertEqual(output3, 1)
    }
}
