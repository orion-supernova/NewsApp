//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Murat Can KOÇ on 6.07.2021.
//

import Foundation
import Combine

protocol NewsViewModel {
    
    func getArticles()
    
}

class NewsViewModelImp: ObservableObject, NewsViewModel {
    
    
    
    private let service: NewsService
    
    private(set) var articles = [Article]()
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var state: ResultState = .loading
    
    @Published private(set) var favoriteNewsCount = 3
    
    init(service: NewsService) {
        self.service = service
    }
    
    
    
    
    func getArticles() {
        
        self.state = .loading
        
        let cancellable = service
            .request(from: .getNews)
            .sink { res in
                switch res {
                
                case .finished:
                    self.state = .success(content: self.articles)
                case .failure(let error):
                    self.state = .failed(error: error)
                
                }
            } receiveValue: { response in
                self.articles = response.articles
            }

        self.cancellables.insert(cancellable)
        
    }
    
    
}





