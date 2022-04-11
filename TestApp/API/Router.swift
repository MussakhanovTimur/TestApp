//
//  Router.swift
//  TestApp
//
//  Created by Тимур on 07.04.2022.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    case getComments
    
    private var baseURL: String {
        return "https://jsonplaceholder.typicode.com/"
    }
    
    private var method: HTTPMethod {
        switch self {
        case .getComments:
            return .get
        }
    }
    
    private var path: String {
        switch self {
        case .getComments:
            return "comments"
        }
    }
    
    private var parameters: Parameters? {
        switch self {
        default:
            return nil
        }
    }
    
    private var headers: HTTPHeaders? {
        switch self {
        default:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try baseURL.asURL()
        var request = URLRequest(url: url.appendingPathComponent(path))
//        request.allHTTPHeaderFields = headers
        request.httpMethod = method.rawValue
        
        return try URLEncoding.default.encode(request, with: parameters)
    }
}
