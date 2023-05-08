//
//  CatTypesVM.swift
//  CodersList
//
//  Created by Mohamed Salem on 23/03/2022.
//

import Combine
import Foundation
import CoreData

class CatTypesVM: ObservableObject {
    
    let useCases:BreedsUseCasesProtocol = BreedsUseCases()
    let cancellableBag = CancellableBag()
    
    @Published var isloading:Bool = false
    @Published var breeds:[BreedItem] = []
    @Published var savedBreeds:[BreedDataEntity] = []
    let store:BreedsDBHandler
    
    
    init(_ context: NSManagedObjectContext ,
         store: BreedsDBHandler){
        self.store = store
        getBreeds(context)
    }
    private func getBreeds(_ context : NSManagedObjectContext) {
        isloading = true
        useCases.getBreedsList()
            .receive(on: RunLoop.main)
            .sinkToResult { [weak self] in
                guard let self = self else { return }
                self.isloading = false
                switch $0 {
                case let .success(value):
                    self.breeds = value
                    DispatchQueue.main.async {
                        self.store.saveData(context,
                                            self.breeds) { entities in
                            self.savedBreeds = entities ?? []
                        }
                    }
                case let .failure(error):
                    self.handleError(error)
                }
            }.store(in: cancellableBag)
    }
    
    private func handleError(_ error: MiddlewareError){
        switch error {
        case .internet, .connection , .server:
            self.savedBreeds = store.fetchBreeds()
        default:
            print("Some thing wrong \(error.errorDescription ?? "")")
        }
    }

}
