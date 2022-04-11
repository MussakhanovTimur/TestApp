//
//  ExtensionDecodable.swift
//  TestApp
//
//  Created by Тимур on 07.04.2022.
//

import Foundation

extension Decodable {
    static func decode(with decoder: JSONDecoder = JSONDecoder(), from data: Data) throws -> Self? {
        do {
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let newdata = try decoder.decode(Self.self, from: data)
            return newdata
        } catch {
            print("decodable model error", error.localizedDescription)
            return nil
        }
    }
    static func decodeArray(with decoder: JSONDecoder = JSONDecoder(), from data: Data) throws -> [Self]{
        do {
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let newdata = try decoder.decode([Self].self, from: data)
            return newdata
        } catch {
            print("decodable model error", error.localizedDescription)
            return []
        }
    }
}
