//
//  NewsService.swift
//  NewsFlash
//
//  Created by Benjamin Couch on 16/8/2024.
//

import Foundation

class NewsService {
    private let apiKey = "ec82aa7cfcf44cfd8004409baaa6ac4f"
    private let baseUrl = "https://newsapi.org/v2/top-headlines?country=au&apiKey="
    
    func fetchNews(completion: @escaping ([NewsArticle]) -> Void) {
        guard let url = URL(string: "\(baseUrl)\(apiKey)") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(NewsResponse.self, from: data)
                    DispatchQueue.main.async {
                        completion(decodedData.articles)
                    }
                } catch {
                    print("Failed to decode JSON: \(error)")
                }
            } else if let error = error {
                print("Failed to fetch news: \(error)")
            }
        }.resume()
    }
}

struct NewsResponse: Codable {
    var articles: [NewsArticle]
}

