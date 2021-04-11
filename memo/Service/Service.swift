//
//  AnswerRepository.swift
//  memo
//
//  Created by Elias Ferreira on 20/08/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation

class Service {

    static let baseURL = "https://owlbot.info/api/v4/dictionary/"
    static let contentType = "application/json"
    static let userToken = UserDefaults.standard.value(forKey: "Token")
    
    static func request(word: String, method: HTTPMethod, completion: @escaping (Result<Data?, ServiceError>) -> Void) {
        // Create URL.
        guard let url = URL(string: "\(baseURL)\(word)") else {
            completion(.failure(.badURL))
            return
        }

        // Create token
        guard let token = userToken else {
            completion(.failure(.unauthorized))
            return
        }

        // Create URLRequest.
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = [
            "Content-Type": contentType,
            "Authorization": "Token \(token)"
        ]

        // Create Session.
        let session = URLSession.shared

        // Task.
        let getAnswerTask = session.dataTask(with: request) { (data, response, error) in

            if error != nil {
                completion(.failure(.serverError))
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            switch response.statusCode {
            case 200, 201:
                completion(.success(data))
            case 400:
                completion(.failure(.badRequest))
            case 404:
                completion(.failure(.notFound(word: word)))
            case 401:
                completion(.failure(.unauthorized))
            default:
                completion(.failure(.serverError))
            }
        }

        // Execute the task.
        getAnswerTask.resume()
    }
}
