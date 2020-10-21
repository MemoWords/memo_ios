//
//  Helper.swift
//  memo
//
//  Created by Elias Ferreira on 19/08/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation

class DateHelper {
    // Return the actual date formated.
    static func today() -> String {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let nowString = dateFormatter.string(from: now)
        
        return nowString
    }
    
    // Returns true if the fiven date is the actual date.
    static func isToday(dateString: String) -> Bool {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let nowString = dateFormatter.string(from: now)
        let nextStudyDay = dateFormatter.date(from: dateString)
        let nowSemHora = dateFormatter.date(from: nowString)

        if nextStudyDay!.compare(nowSemHora!) == .orderedSame {
            return true
        }
        
        return false
    }
    
    // Script para incrementar uma data.
    static func incrementDate(data: String, val: Int ) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"

        var dataToChange = dateFormatter.date(from: data)
        
        dataToChange!.addTimeInterval(TimeInterval(val * 86400))

        let dataToReturn = dateFormatter.string(from: dataToChange!)

        return dataToReturn

    }
}
