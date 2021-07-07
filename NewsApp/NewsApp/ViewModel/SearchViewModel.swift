//
//  SearchViewModel.swift
//  NewsApp
//
//  Created by Murat Can KOÇ on 6.07.2021.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    
    @Published var news = [Article]()
    
    init() {
        fetchNews()
    }
    
    func fetchNews() {
       
    }


    func filteredNews(query: String) -> [Article] {
        let lowercasedQuery = query.lowercased()
        return news.filter{( $0.title.lowercased().contains(lowercasedQuery) || $0.articleDescription.lowercased().contains(lowercasedQuery) )}
    }
    
}
