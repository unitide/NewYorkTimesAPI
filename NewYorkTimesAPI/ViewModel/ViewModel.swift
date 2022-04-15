//
//  ViewModel.swift
//  NewYorkTimesAPI
//
//  Created by Mingyong Zhu on 4/13/22.
//

import Combine
import Foundation

class ViewModel {
    let NYTAPIs = ["Archieve", "Article Search", "Books", "Community", "Most Polular", "Movie Reviews", "RSS Feeds", "Semantic", "Times Tags", "Times Wire", "Top Stories"]
    @Published private(set) var archievedDocument = [Article]()
    private let networkManager = NetworkManager()
    
    func getArchievedDocument(year: Int, month: Int) {
        guard year >= 1851, month >= 1, month <= 12 else {
            return
        }
        let urlString = NetworkURLs.archieveAPIBaseURL + "/" + String(year) + "/" + String(month) + ".json?api-key=" + NetworkURLs.apiKey
        // https://api.nytimes.com/svc/archive/v1/2019/1.json?api-key=yourkey
        
        networkManager.getModel(type: ArchieveAPI.self, urlSting: urlString) { [weak self] result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                
            case .success(let archieveResponse):
                self?.archievedDocument.removeAll()
                for article in archieveResponse.response.docs {
                    self?.archievedDocument.append(article)
                }
            }
        }
    }
}
