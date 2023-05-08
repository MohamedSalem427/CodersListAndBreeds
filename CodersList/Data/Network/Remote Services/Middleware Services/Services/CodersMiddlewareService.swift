//
//  CodersMiddlewareService.swift
//  CodersList
//
//  Created by Mohamed Salem on 21/03/2022.
//

import Foundation
import Combine

protocol CodersMiddlewareProtocol {
    func getCodersList() -> AnyPublisher<[CoderItem],MiddlewareError>
}
class CodersMiddlewareService: MiddlewareService<CodersEndPoints>, CodersMiddlewareProtocol {
    func getCodersList() -> AnyPublisher<[CoderItem],MiddlewareError> {
        return request(target: .getCodersList)
    }
}
