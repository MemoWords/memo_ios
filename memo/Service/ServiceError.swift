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
            return "Entrada inválida"
        case .serverError:
            return "Erro no servidor"
        case .notFound(let word):
            return "\"\(word)\" não foi encontrada na nossa base de dados!"
        case .unauthorized:
            return "Não autorizado"
        case .badRequest:
            return "Algo deu errado"
        case .dataError:
            return "Erro nos dados"
        }
    }
}
