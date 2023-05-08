//
//  PersistenceController.swift
//  CodersList
//
//  Created by Mohamed Salem on 02/08/2022.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentContainer
    init(){
        container = NSPersistentContainer(name: "BreedsStash")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    func save(completion : @escaping (Error?) -> Void = { _ in  })  {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
                completion(nil)
            } catch {
                completion(error)
            }
        }
    }
    func delete( _ object: NSManagedObject,
                 completion: @escaping (Error?) -> Void = { _ in } ){
        let context = container.viewContext
        context.delete(object)
        save(completion: completion)
    }
}
