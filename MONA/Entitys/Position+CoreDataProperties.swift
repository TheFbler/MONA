//
//  Position+CoreDataProperties.swift
//  MONA
//
//  Created by Fabian Clasen on 24.09.20.
//  Copyright © 2020 Fabian Clasen. All rights reserved.
//
//

import Foundation
import CoreData


extension Position {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Position> {
        return NSFetchRequest<Position>(entityName: "Position")
    }

    @NSManaged public var name: String?
    @NSManaged public var amount: Double
    @NSManaged public var income: Bool
    @NSManaged public var posToCategory: Category?

}

extension Position : Identifiable {

}
