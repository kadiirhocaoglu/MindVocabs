//
//  CoreDataCaller.swift
//  MindVocabs
//
//  Created by Kadir Hocaoğlu on 17.10.2023.
//

import UIKit
import CoreData

class CoreDataCaller {
    static let shared = CoreDataCaller()
    private init(){}
    
    func addWords(word: String, mean: String) {
          let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Word", in: context )
        guard let entity = entity else { return }
        let words = NSManagedObject(entity: entity, insertInto: context  )
        words.setValue(word, forKey: "word")
        words.setValue(mean, forKey: "wordMean")
        let  sharedAppDelegate = UIApplication.shared.delegate as! AppDelegate
        sharedAppDelegate.saveContext()
        
    }
    func getWords() {
        let fetchRequest: NSFetchRequest<Word> = Word.fetchRequest()
        //fetchRequest.predicate = NSPredicate(format: "word = %@ and wordMean = %@", "Hi", "Selam")
        //fetchRequest.predicate = NSPredicate(format: "word = %@", "Hello")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "word", ascending: true )]
        do {
            let words = try getContext().fetch(fetchRequest)
            for word in words {
                print("Word: \(word.word ?? "") -- Mean: \(word.wordMean ?? "")")
            }
        } catch {
            print(error)
        }
    }
    func searchGetWords(word: String) -> [Word]?{
        let fetchRequest: NSFetchRequest<Word> = Word.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "word = %@", word)
        do {
            return try getContext().fetch(fetchRequest)
        } catch {
            print(error)
        }
        return nil
    }
    func updateWord(word: String, toMean: String) {
        if let word =  searchGetWords(word: word) {
            for word in word {
                word.wordMean = toMean
            }
        }
        let  sharedAppDelegate = UIApplication.shared.delegate as! AppDelegate
        sharedAppDelegate.saveContext()
    }

    func deleteWord(word: String) {
        if let word = searchGetWords(word: word) {
            for word in word {
                getContext() .delete(word.self)
            }
        }
    }
    
    func getContext() -> NSManagedObjectContext {
        let  sharedAppDelegate = UIApplication.shared.delegate as! AppDelegate
        return sharedAppDelegate.persistentContainer.viewContext
    }
}
