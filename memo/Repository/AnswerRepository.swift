//
//  AnswerRepository.swift
//  memo
//
//  Created by Elias Ferreira on 11/04/21.
//  Copyright © 2021 Academy IFCE. All rights reserved.
//

import Foundation

class AnswerRepository {

    static func search(word: String, completion: @escaping (AnswerResponse) -> Void) {
        Service.request(word: word, method: .GET) { result in
            switch result {
            case .success(let data):
                do {
                    let answer = try JSONDecoder().decode(Answer.self, from: data!)
                    completion(AnswerResponse(answer: answer, error: nil))
                } catch {
                    completion(AnswerResponse(answer: nil, error: .dataError))
                }
                return
            case .failure(let error):
                completion(AnswerResponse(answer: nil, error: error))
                return
            }
        }
    }

}
