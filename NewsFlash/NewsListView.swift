//
//  NewsListView.swift
//  NewsFlash
//
//  Created by Benjamin Couch on 16/8/2024.
//

import SwiftUI

struct NewsListView: View {
    @State private var articles: [NewsArticle] = []
    
    var body: some View {
        NavigationView {
            List(articles) { article in
                NavigationLink(destination: NewsDetailView(article: article)) {
                    HStack {
                        if let urlToImageString = article.urlToImage,
                           let urlToImage = URL(string: urlToImageString) {
                            AsyncImage(url: urlToImage)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                        }
                        
                        VStack(alignment: .leading) {
                            Text(article.title)
                                .font(.headline)
                            
                            if let description = article.description {
                                Text(description)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            } else {
                                Text("No description available")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Top Headlines")
        }
        .onAppear {
            NewsService().fetchNews { fetchedArticles in
                self.articles = fetchedArticles
            }
        }
    }
}

#Preview {
    NewsListView()
}
