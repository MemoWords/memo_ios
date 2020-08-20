//
//  AnswerRepository.swift
//  memo
//
//  Created by Elias Ferreira on 20/08/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation

class AnswerRepository {
    static func getRanking(completion: @escaping ([RankingItem]) -> Void) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "megazordback.herokuapp.com"
        components.path = "/users/ranking"
        
        guard let url = components.url else {
            completion([])
            return
        }
        
        let session = URLSession(configuration: .default)
        
        let getRankingTask = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                print(data)
                if let ranking = try? JSONDecoder().decode([RankingItem].self, from: data) {
                    completion(ranking)
                } else {
                    print("Error no decode")
                    completion([])
                }
            }
        }
        
        getRankingTask.resume()
        
    }
}
