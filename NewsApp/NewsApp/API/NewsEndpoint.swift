//
//  NewsEndpoint.swift
//  NewsApp
//
//  Created by Murat Can KOÇ on 6.07.2021.
//

import Foundation


protocol APIBuilder {
    var baseURL: URL { get }
    var path: String { get }
    var queryKeyword: String { get }
    var apiKey: String { get }
    var urlRequest: URLRequest { get }
}


enum NewsAPI {
    case getNews
}


extension NewsAPI: APIBuilder {
    
    
    var baseURL: URL {
        switch self {
        case .getNews:
            return URL(string: "https://newsapi.org")!
        }
    }
    var path: String {
        return "/v2/everything?"
    }
    var queryKeyword: String {
        return "q=keyword"
    }
    var apiKey: String {
        return "&apiKey=81cf661cf8f946209469ea9009855b46"
    }
    
    var urlRequest: URLRequest {
//        return URLRequest(url: self.baseURL.appendingPathComponent(self.path).appendingPathComponent(self.queryKeyword).appendingPathComponent(apiKey))
        return URLRequest(url: URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2021-06-07&sortBy=publishedAt&apiKey=bc2393162ab14a8a9f7184943431b533")!)
    }
    
}
