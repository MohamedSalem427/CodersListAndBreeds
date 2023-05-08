//
//  BreedMiddleWareService.swift
//  CodersList
//
//  Created by Mohamed Salem on 23/03/2022.
//

import Foundation
import Combine

protocol BreedMiddleWareProtocol {
    func getCatBreeds() -> AnyPublisher<[BreedItem],MiddlewareError>
}

class BreedMiddleWareService: MiddlewareService<BreedsEndPoints>,BreedMiddleWareProtocol {
    func getCatBreeds() -> AnyPublisher<[BreedItem], MiddlewareError> {
        return request(target: .getCatBreeds)
    }
}
