//
//  Category+CoreDataProperties.swift
//  MONA
//
//  Created by Fabian Clasen on 24.09.20.
//  Copyright © 2020 Fabian Clasen. All rights reserved.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var name: String?
    @NSManaged public var categoryToPos: NSSet?

}

// MARK: Generated accessors for categoryToPos
extension Category {

    @objc(addCategoryToPosObject:)
    @NSManaged public func addToCategoryToPos(_ value: Position)

    @objc(removeCategoryToPosObject:)
    @NSManaged public func removeFromCategoryToPos(_ value: Position)

    @objc(addCategoryToPos:)
    @NSManaged public func addToCategoryToPos(_ values: NSSet)

    @objc(removeCategoryToPos:)
    @NSManaged public func removeFromCategoryToPos(_ values: NSSet)

}

extension Category : Identifiable {

}
