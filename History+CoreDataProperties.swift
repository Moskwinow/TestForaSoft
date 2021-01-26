//
//  History+CoreDataProperties.swift
//  TestForaSoft
//
//  Created by Максим Вечирко on 24.01.2021.
//
//

import Foundation
import CoreData


extension History {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<History> {
        return NSFetchRequest<History>(entityName: "History")
    }

    @NSManaged public var searchedText: String?

}

extension History : Identifiable {

}
