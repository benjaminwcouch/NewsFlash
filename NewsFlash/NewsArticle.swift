//
//  NewsArticle.swift
//  NewsFlash
//
//  Created by Benjamin Couch on 16/8/2024.
//

import Foundation

struct NewsArticle: Identifiable, Codable {
    var id: UUID = UUID()
    var title: String
    var description: String? // Make this optional
    var url: String
    var urlToImage: String?
    var publishedAt: String
    
    enum CodingKeys: String, CodingKey {
        case title, description, url, urlToImage, publishedAt
    }
    
    var publishedDate: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" // Adjust format if needed
        return dateFormatter.date(from: publishedAt)
    }
}
