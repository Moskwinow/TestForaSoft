//
//  CoreManager.swift
//  TestForaSoft
//
//  Created by Максим Вечирко on 24.01.2021.
//

import CoreData

class CoreManager {
    
    private init() {}
    static let instance = CoreManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "TestForaSoft")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context = persistentContainer.viewContext
    
    
//    Save history to core data
    
    func save() {
        context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchHistory() -> [History] {
        guard let history = try? persistentContainer.viewContext.fetch(History.fetchRequest()) as? [History] else {return []}
        
        return history
    }
    
}
