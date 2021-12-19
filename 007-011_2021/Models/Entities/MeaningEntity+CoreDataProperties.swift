//
//  MeaningEntity+CoreDataProperties.swift
//  007-011_2021
//
//  Created by Alina Bikkinina on 19.12.2021.
//
//

import Foundation
import CoreData


extension MeaningEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MeaningEntity> {
        return NSFetchRequest<MeaningEntity>(entityName: "MeaningEntity")
    }

    @NSManaged public var partOfSpeech: String?
    @NSManaged public var defenitions: NSSet?
    @NSManaged public var word: WordEntity?

}

// MARK: Generated accessors for defenitions
extension MeaningEntity {

    @objc(addDefenitionsObject:)
    @NSManaged public func addToDefenitions(_ value: DefenitionEntity)

    @objc(removeDefenitionsObject:)
    @NSManaged public func removeFromDefenitions(_ value: DefenitionEntity)

    @objc(addDefenitions:)
    @NSManaged public func addToDefenitions(_ values: NSSet)

    @objc(removeDefenitions:)
    @NSManaged public func removeFromDefenitions(_ values: NSSet)

}

extension MeaningEntity : Identifiable {

}
