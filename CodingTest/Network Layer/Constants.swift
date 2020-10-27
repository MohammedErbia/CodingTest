//
//  Constants.swift
//  Created by mohammed on 9/6/20.
//  Copyright © 2020 mohammedErbia. All rights reserved.
//

import Foundation
import Alamofire

struct Constant {
    struct ProductionServer {
        static let baseURL = "http://private-91146-mobiletask.apiary-mock.com/" 
    }
    //MARK: - API Parametr Key
    struct APIParameterKey {
 
    }
    
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
struct WebserviceConfig {
    /// Generates common headers specific to APIs. Can also accept additional headers if demanded by specific APIs.
    ///
    /// - Returns: A configured header in the form of JSON dictionary.
    func generateHeader() -> [String: String] {
        var headerDict = [String: String]()
        headerDict["Content-Type"] = "application/json"
        
        return headerDict
    }
}
