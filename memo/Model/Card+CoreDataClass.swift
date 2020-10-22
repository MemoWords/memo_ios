//
//  Card+CoreDataClass.swift
//  memo
//
//  Created by Elias Ferreira on 21/10/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//
//

import Foundation
import CoreData

public class Card: NSManagedObject {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Card> {
        return NSFetchRequest<Card>(entityName: "Card")
    }

    // MARK: CoreData Properties.
    @NSManaged public var content: String?
    @NSManaged public var lastDaysIncremented: Int64
    @NSManaged public var nextStudyDay: String?
    @NSManaged public var collection: Collection?
}
