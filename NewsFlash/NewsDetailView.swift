//
//  NewsDetailView.swift
//  NewsFlash
//
//  Created by Benjamin Couch on 16/8/2024.
//

import SwiftUI

struct NewsDetailView: View {
    var article: NewsArticle
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            if let urlToImageString = article.urlToImage,
               let urlToImage = URL(string: urlToImageString) {
                AsyncImage(url: urlToImage)
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
            }
            
            Text(article.title)
                .font(.largeTitle)
                .bold()
            
            if let description = article.description {
                Text(description)
                    .font(.body)
            } else {
                Text("No description available")
                    .font(.body)
            }
            
            if let publishedDate = article.publishedDate {
                Text("Published on \(publishedDate, formatter: dateFormatter)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            } else {
                Text("No publication date available")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Link("Read Full Article", destination: URL(string: article.url)!)
                .font(.headline)
                .foregroundColor(.blue)
        }
        .padding()
        .navigationTitle("News Detail")
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }
}
