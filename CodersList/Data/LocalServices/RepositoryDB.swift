//
//  RepositoryDB.swift
//  CodersList
//
//  Created by Mohamed Salem on 07/08/2022.
//

import CoreData

protocol RepositoryDB {
    associatedtype T
    func fetchEntities<T: NSManagedObject>(entity: T.Type) -> [T]?
}

extension RepositoryDB {
    func fetchEntities<T: NSManagedObject>(entity: T.Type) -> [T]? {
        let request = NSFetchRequest<T>(entityName: "\(T.self)")
        let context = PersistenceController.shared.container.viewContext
        do {
            return try context.fetch(request)
        } catch  {
            print(error.localizedDescription)
            return []
        }
    }
}



struct BreedsDBHandler {
    func fetchBreeds () -> [BreedDataEntity] {
        let request = NSFetchRequest<BreedDataEntity>(entityName: "BreedDataEntity")
        let context = PersistenceController.shared.container.viewContext
        
        do {
            return try context.fetch(request)
        } catch  {
            print(error.localizedDescription)
            return []
        }
    }
    
    
     func saveData(_ context : NSManagedObjectContext,
                          _ breedList: [BreedItem],
                          comletionHandler: @escaping ([BreedDataEntity]?) -> Void ) {
        breedList.forEach { item in
            let entity = BreedDataEntity(context: context)
            entity.id = item.id
            entity.name = item.name
            entity.temperament = item.temperament
            entity.url = item.image?.url
        }
        do {
            try context.save()
            print("Save Successed")
            comletionHandler(fetchBreeds())
        } catch  {
            print(error.localizedDescription)
            comletionHandler(nil)
        }
    }
}
