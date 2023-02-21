//
//  EndPoint.swift
//  PerOnBoarding
//
//  Created by Seo Jae Hoon on 2023/02/21.
//

import Foundation

enum Endpoint {
    case random
}

extension Endpoint {
    
    var getURL: String {
        switch self {
        case .random:
            return "\(URL.baseURL)/photos/random?query="
        }
    }
    
    var header: [String: String] {
        switch self {
        case .random:
            return ["Authorization": APIKey.authorization]
        }
    }
    
    var parameter: [URLQueryItem] {
        switch self {
        case .random:
            return [URLQueryItem(name: "", value: "")]
        }
    }
}
