//
//  ServiceError.swift
//  memo
//
//  Created by Elias Ferreira on 11/04/21.
//  Copyright © 2021 Academy IFCE. All rights reserved.
//

import Foundation

enum ServiceError: Error {
    case badURL
    case serverError
    case notFound(word: String)
    case unauthorized
    case badRequest
    case dataError

    var description: String {
        switch self {
        case .badURL:
            return Strings.BAD_URL
        case .serverError:
            return Strings.SERVER_ERROR
        case .notFound(let word):
            return "\"\(word)\" \(Strings.NOT_FOUND)!"
        case .unauthorized:
            return Strings.UNAUTHORIZED
        case .badRequest:
            return Strings.BAD_REQUEST
        case .dataError:
            return Strings.DATA_ERROR
        }
    }
}
