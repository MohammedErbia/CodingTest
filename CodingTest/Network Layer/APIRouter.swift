//
//  APIRouter.swift
//   
//
//  Created by mohammed on 9/6/20.
//  Copyright © 2020 mohammedErbia. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    case realestates
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
            case .realestates:
                       return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
            
        case .realestates:
            return "realestates"
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .realestates:
            return nil
        
        }
    }
    
    // MARK: - headers
    private  var headers: [String:String]? {
    switch self {

    case .realestates:
        return nil 
    }

    }

    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Constant.ProductionServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.authentication.rawValue)
        
        
       // urlRequest.allHTTPHeaderFields = Headers.generateHeader()
        //urlRequest.allHTTPHeaderFields = WebserviceConfig().generateHeader()

        // Parameters
        if let parameters = parameters {
            do {
                let d  = try JSONSerialization.data(withJSONObject: parameters, options: [])
               print(d)
                urlRequest.httpBody = d
               
                    
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
         
        if let header = headers {
            do{
                urlRequest.allHTTPHeaderFields = header
                
            } catch{
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }

        }
        return urlRequest
    }
}
struct Headers {

/// - Returns: A configured header in the form of JSON dictionary.
func generateHeader() -> [String: Any] {
    var headerDict = [String: Any]()
    headerDict["Authorization"] = "application/json"
    headerDict["token"] = "fyfrgjirgjrigjrigjri"
    return headerDict
    }
    
}
