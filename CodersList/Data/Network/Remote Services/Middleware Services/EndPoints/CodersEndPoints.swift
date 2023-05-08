//
//  CodersEndPoints.swift
//  CodersList
//
//  Created by Mohamed Salem on 21/03/2022.
//

import Foundation
import Moya

enum CodersEndPoints {
    case getCodersList
}
//MARK: - TargetType & AccessTokenAuthorizable
extension CodersEndPoints: TargetType, AccessTokenAuthorizable {
    var baseURL: URL { AppEnvironment.baseURL }
    var path: String {
        switch self {
        case .getCodersList: return "repositories"
        }
    }
    var method: Moya.Method {
        switch self {
        case .getCodersList: return .get
        }
    }
    
    var parameters: [String:Any] {
        switch self {
        case .getCodersList:
            return [:]
        }
    }
    var task: Task {
        return .requestPlain
    }
    var headers: [String : String]? {[:]}
    var authorizationType: AuthorizationType? { .basic }
}

