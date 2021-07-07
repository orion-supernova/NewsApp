//
//  NewsResponse.swift
//  NewsApp
//
//  Created by Murat Can KOÇ on 6.07.2021.
//

import Foundation

// MARK: - NewsResponse
struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable {
    let id = UUID()
    let source: Source
    let author: String?
    let title, articleDescription: String
    let url: String
    let urlToImage: String?
    let publishedAt: Date
    let content: String
    
    var isFavorite: Bool? = false
    var likes: Int?
    
    
    var dateString: String? {
        let date = publishedAt
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        print(formatter.string(from: date))
        return formatter.string(from: date)
    }
    
    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
    
    
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}


extension Article {
    
    static var dummyData: Article {
        .init(source: Source(id: "muş",
                             name: "Hm"),
              author: "Hm",
              title: "Hm",
              articleDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla consectetur,",
              url: "https://www.bbc.com/news/world",
              urlToImage: "https://i.picsum.photos/id/1025/4951/3301.jpg?hmac=_aGh5AtoOChip_iaMo8ZvvytfEojcgqbCH7dzaz-H8Y",
              publishedAt: Date(),
              content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla consectetur, mauris ac convallis sagittis, lacus orci dignissim risus, eu bibendum mi quam quis neque. Donec tincidunt est dolor, nec vestibulum lacus sagittis interdum. Cras iaculis quis ante tincidunt elementum. Ut ligula libero, pellentesque a vulputate eget, placerat sit amet diam. Vivamus in dui a quam aliquet rhoncus. Nunc maximus nisl ex, aliquam pretium neque ullamcorper sit amet. Cras suscipit cursus sodales.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla consectetur, mauris ac convallis sagittis, lacus orci dignissim risus, eu bibendum mi quam quis neque. Donec tincidunt est dolor, nec vestibulum lacus sagittis interdum. Cras iaculis quis ante tincidunt elementum. Ut ligula libero, pellentesque a vulputate eget, placerat sit amet diam. Vivamus in dui a quam aliquet rhoncus. Nunc maximus nisl ex, aliquam pretium neque ullamcorper sit amet. Cras suscipit cursus sodales.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla consectetur, mauris ac convallis sagittis, lacus orci dignissim risus, eu bibendum mi quam quis neque. Donec tincidunt est dolor, nec vestibulum lacus sagittis interdum. Cras iaculis quis ante tincidunt elementum. Ut ligula libero, pellentesque a vulputate eget, placerat sit amet diam. Vivamus in dui a quam aliquet rhoncus. Nunc maximus nisl ex, aliquam pretium neque ullamcorper sit amet. Cras suscipit cursus sodales.")
    }
}
