//
//  BreedsUseCases.swift
//  CodersList
//
//  Created by Mohamed Salem on 23/03/2022.
//

import Foundation
import Combine
protocol BreedsUseCasesProtocol {
    func getBreedsList() -> AnyPublisher<[BreedItem],MiddlewareError>
}
struct BreedsUseCases: BreedsUseCasesProtocol {
    
    let middleware:BreedMiddleWareProtocol
    
    init(middleware:BreedMiddleWareProtocol = BreedMiddleWareService()) {
        self.middleware = middleware
    }
    // MARK: - Methods
    func getBreedsList() -> AnyPublisher<[BreedItem], MiddlewareError> {
        return middleware.getCatBreeds().flatMap { response -> AnyPublisher<[BreedItem], MiddlewareError> in
            Deferred {
                Future { promise in
                    promise(.success(response))
                }
            }.eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }
    
}
