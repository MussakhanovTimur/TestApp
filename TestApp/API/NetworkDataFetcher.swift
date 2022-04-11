//
//  NetworkDataFetcher.swift
//  TestApp
//
//  Created by Тимур on 07.04.2022.
//

import Foundation
import Alamofire

class NetworkDataFetcher {
    
    func request<T: Decodable>(_ request: Router, type: T.Type, complition: @escaping ([T]?, String?) -> Void) {
        AF.request(request).validate().responseJSON { [weak self] dataResponse in
            switch dataResponse.result {
            case .success:
                guard let data = dataResponse.data else { return }
                guard let comments = self?.decodeJSON(type: type, data: data) else { return }
                complition(comments, nil)
            case .failure(let error):
                guard let errorMessage = Error.receiveError(error) else { return }
                complition(nil, errorMessage)
            }
        }
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, data: Data) -> [T]? {
        let object = try? type.decodeArray(from: data)
        return object
    }
}
