//
//  DefenitionEntity+CoreDataProperties.swift
//  007-011_2021
//
//  Created by Alina Bikkinina on 19.12.2021.
//
//

import Foundation
import CoreData


extension DefenitionEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DefenitionEntity> {
        return NSFetchRequest<DefenitionEntity>(entityName: "DefenitionEntity")
    }

    @NSManaged public var definition: String?
    @NSManaged public var meaning: MeaningEntity?

}

extension DefenitionEntity : Identifiable {

}
