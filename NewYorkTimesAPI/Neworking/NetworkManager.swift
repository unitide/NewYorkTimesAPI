//
//  NetworkManager.swift
//  NewYorkTimesAPI
//
//  Created by Mingyong Zhu on 4/13/22.
//

import Foundation

class NetworkManager {
    func getModel<Model: Codable>(type: Model.Type, urlSting: String, completionHandler: @escaping(Result<Model, NetworkError>) -> Void) {
        guard let url = URL(string: urlSting) else {
            completionHandler(.failure(.badURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completionHandler(.failure(.other(error)))
            }
//            if let response = response {
//                print(response)
//            }
            if let data = data {
                do {
                    let articles = try JSONDecoder().decode(type, from: data)
                    completionHandler(.success(articles))
                    return
                } catch let DecodingError.dataCorrupted(context) {
                    print(context)
                } catch let DecodingError.keyNotFound(key, context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.valueNotFound(value, context) {
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.typeMismatch(type, context) {
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let error {
                    completionHandler(.failure(.other(error)))
                }
            }
        }
        .resume()
    }
}
