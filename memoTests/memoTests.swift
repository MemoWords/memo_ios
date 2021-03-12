//
//  memoTests.swift
//  memoTests
//
//  Created by Elias Ferreira on 23/08/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import XCTest

@testable import memo

class HelperTests: XCTestCase {

    func test_helper_today_todaysDateWithNoTime() {
        //When
        let output = DateHelper.today()
        
        //Then
        XCTAssertEqual(output, "23-08-2020")
    }
    
    func test_helper_isToday_toBeEqualToTrue() {
        let input = "23-08-2020"
        
        let output = DateHelper.isToday(dateString: input)
        
        XCTAssertEqual(output, true)
    }
    
    func test_helper_incrementDate_toBeEqualToTomorroyDate() {
        let input1 = "23-08-2020"
        let input2 = 1
        
        let output = DateHelper.incrementDate(data: input1, val: input2)
        
        XCTAssertEqual(output, "24-08-2020")
    }

}
