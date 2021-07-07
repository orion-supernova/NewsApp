//
//  NewsCaller.swift
//  NewsApp
//
//  Created by Murat Can KOÇ on 6.07.2021.
//

import Foundation


final class NewsCaller {
    
    static let shared = NewsCaller()
    
    
//        static let newsURL = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=81cf661cf8f946209469ea9009855b46")
        static let newsURL = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2021-06-06&sortBy=publishedAt&apiKey=81cf661cf8f946209469ea9009855b46")
    
    
    private init() {}
    
    public func getNews(completion: @escaping (Result<[String], Error>) -> Void) {
        guard let url = NewsCaller.newsURL else { return }
        
        
        let task = URLSession.shared.dataTask(with: url) { data, urlResponse, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(NewsResponse.self, from: data)
                    print("Articles: \(result.articles.count)")
                } catch  {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
        
        
        
    }
    
    
}
