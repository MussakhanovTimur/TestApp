//
//  ErrorResponse.swift
//  TestApp
//
//  Created by Тимур on 07.04.2022.
//

import Foundation

struct Error: Decodable {
    
}

extension Error {
    static func receiveError(_ error: Any) -> String? {
        guard let error = error as? NSError else { return nil }
        var message = ""
        switch error.code {
        case -1001:
            message = "Время ожидания ответа от сервера истекло. Попробуйте еще раз."
        case -1020, -1004:
            message = "Отсутствует интернет соединение"
        default:
            message = "Ошибка сервера. Попробуйте, пожалуйста, позже."
        }
        return message
    }
}
