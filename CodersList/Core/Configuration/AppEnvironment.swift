//
//  Environment.swift
//  Shift
//
//  Created by ziad on 3/28/20.
//  Copyright © 2020 generation-c. All rights reserved.
//

import Foundation

enum AppEnvironment: String {
    
    case production
    case sandbox
    case develop
    
    
    private static var environmentConfig:(_ key: InfoPListKeys.EnvironmentKeys) -> String = {
        let dic: NSDictionary? = InfoPList.shared.get(.environmentConfig) as? NSDictionary
        return dic?[$0.rawValue] as? String ?? ""
    }
    
    static var baseURL: URL {
        URL(string: environmentConfig(.apiBaseURL))!
    }
    static var apiKey: String {
        return "gmZeKYE7q1sk5UPSAzCV"
    }
    
    static var type: AppEnvironment? {
        let configuration = environmentConfig(.configuration).lowercased()
        return AppEnvironment(rawValue: configuration)
    }
    
   static var typeName: String? {
        return environmentConfig(.configuration)
    }
    
}
