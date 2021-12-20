//
//  PersistableService.swift
//  007-011_2021
//
//  Created by Alina Bikkinina on 18.12.2021.
//

import Foundation
import CoreData

class PersistableService {
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "_07_011_2021")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var viewContext = persistentContainer.viewContext

    // MARK: - Core Data Saving support
    func saveContext () {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    //MARK: - Core Data functions
    //getting all containing words
    func getWordsFromCD() -> [Word] {
        let fetchRequest = WordEntity.fetchRequest()
        var words: [Word] = []
        do {
            let wordsEntity = try viewContext.fetch(fetchRequest)
            for wordEntity in wordsEntity {
                words.append(Word(word: wordEntity.word, origin: wordEntity.origin, meanings: wordEntity.meanings.allObjects as? [Meanings] ?? []))
            }
        } catch {
            print(error)
        }
        return words
    }
    
    //additions
    func addWordToCD(word: Word) {
        let wordEntity = WordEntity(context: viewContext)
        wordEntity.setProperties(word: word)
        
        for meaning in word.meanings {
            addMeaningToCD(wordEntity: wordEntity, meaning: meaning)
        }
        
        saveContext()
    }
    
    func addMeaningToCD(wordEntity: WordEntity, meaning: Meanings) {
        let meaningEntity = MeaningEntity(context: viewContext)
        meaningEntity.setProperties(wordEntity: wordEntity, meaning: meaning)
        
        for defenition in meaning.definitions {
            addDefenitionToCD(meaning: meaningEntity, defenition: defenition)
        }
    }
    
    func addDefenitionToCD(meaning: MeaningEntity, defenition: Definitions) {
        let defEntity = DefenitionEntity(context: viewContext)
        defEntity.setProperties(meaning: meaning, defenition: defenition)
    }
    
    //repeating verification
    func isAddedToCD(word: Word) -> Bool {
        let fetchRequest = WordEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "word == %@", word.word)
        do {
            let cdWord = try viewContext.fetch(fetchRequest)
            if (!cdWord.isEmpty) {
                return true
            }
        } catch {
            print(error)
        }
        return false
    }
    
    //removing
    func deleteWord(word: Word) {
        let fetchRequest = WordEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "word == %@", word.word)
        do {
            let words = try viewContext.fetch(fetchRequest)
            let wordToDelete = words.first
            viewContext.delete(wordToDelete!)
        } catch {
            print(error)
        }
    }
}
