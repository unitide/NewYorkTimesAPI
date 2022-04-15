//
//  NetworkError.swift
//  NewYorkTimesAPI
//
//  Created by Mingyong Zhu on 4/13/22.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case badURL
    case other(Error)

    var errorDescription: String? {
        switch self {
        case .badURL:
            return "This is a bad URL"
        case .other(let error):
            return error.localizedDescription
        }
    }
}
