//
//  InfoPListKeys.swift
//  Shift
//
//  Created by ziad on 3/28/20.
//  Copyright © 2020 generation-c. All rights reserved.

import Foundation

enum InfoPListKeys: String {
    case environmentConfig = "Environment configuration"
    enum EnvironmentKeys: String {
        case apiBaseURL = "API_BASE_URL"
        case configuration = "Configuration"
    }
}
