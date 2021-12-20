//
//  WordEntity+CoreDataProperties.swift
//  007-011_2021
//
//  Created by Alina Bikkinina on 20.12.2021.
//
//

import Foundation
import CoreData


extension WordEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WordEntity> {
        return NSFetchRequest<WordEntity>(entityName: "WordEntity")
    }

    @NSManaged public var word: String
    @NSManaged public var origin: String
    @NSManaged public var meanings: NSSet
    
    func setProperties(word: Word) {
        self.word = word.word
        self.meanings = NSSet(array: word.meanings!)
        self.origin = word.origin!
    }
}

// MARK: Generated accessors for meanings
extension WordEntity {

    @objc(addMeaningsObject:)
    @NSManaged public func addToMeanings(_ value: MeaningEntity)

    @objc(removeMeaningsObject:)
    @NSManaged public func removeFromMeanings(_ value: MeaningEntity)

    @objc(addMeanings:)
    @NSManaged public func addToMeanings(_ values: NSSet)

    @objc(removeMeanings:)
    @NSManaged public func removeFromMeanings(_ values: NSSet)

}

extension WordEntity : Identifiable {

}
