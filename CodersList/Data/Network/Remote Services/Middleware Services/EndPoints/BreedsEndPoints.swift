//
//  BreedsEndPoints.swift
//  CodersList
//
//  Created by Mohamed Salem on 23/03/2022.
//

import Foundation
import Moya

enum BreedsEndPoints {
    case getCatBreeds
}
extension BreedsEndPoints:TargetType, AccessTokenAuthorizable {
    var baseURL: URL {
        URL(string: "https://api.thecatapi.com/v1/")!
    }
    var path: String {
        switch self {
        case .getCatBreeds :
            return "breeds"
        }
    }
    var method: Moya.Method {
        switch self {
        case .getCatBreeds:
            return .get
        }
    }
    var task: Task {
        return .requestPlain
    }
    var headers: [String : String]? {
        [:]
    }
    var authorizationType: AuthorizationType? { .basic }
}
