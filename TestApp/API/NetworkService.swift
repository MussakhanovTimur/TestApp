//
//  NetworkService.swift
//  TestApp
//
//  Created by Тимур on 07.04.2022.
//

import Foundation
import Alamofire

protocol NetworkServiceProtocol {
    func getComments(onSuccess: (([Comment]?) -> Void)?, onError: ((String?) -> Void)?)
}

class NetworkService: NetworkServiceProtocol {
    
    private let networkDataFetcher = NetworkDataFetcher()
    
    func getComments(onSuccess: (([Comment]?) -> Void)? = nil,
                      onError: ((String?) -> Void)? = nil) {
        
        let mutableURLRequest = Router.getComments
        networkDataFetcher.request(mutableURLRequest, type: Comment.self) { comments, error in
            if let comments = comments {
                onSuccess?(comments)
            } else {
                onError?(error)
            }
        }
    }
}
