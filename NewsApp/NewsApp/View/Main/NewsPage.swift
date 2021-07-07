//
//  NewsPage.swift
//  NewsApp
//
//  Created by Murat Can KOÇ on 6.07.2021.
//

import SwiftUI



struct NewsPage: View {
    
    @StateObject var viewModel = NewsViewModelImp(service: NewsServiceImpl())
    @StateObject var searchViewModel = SearchViewModel()

    
    @State var searchText = ""
    @State var inSearchMode = false
    @State var favorites: [String] = UserDefaults.standard.stringArray(forKey: "favorites") ?? []
    
    var searchedArticles: [Article] {
        return searchText.isEmpty ? [] : searchViewModel.filteredNews(query: searchText)
    }
    
    var body: some View {
        
        Group {
//            switch viewModel.state {
//            case .loading:
//                ProgressView()
//            case .failed(let error):
//                ErrorView(error: error, handler: viewModel.getArticles)
//            case .success( let articles):
//                    NavigationView {
//                        List(articles) { item in
//                            LazyView(NewsPageCell(article: Article.dummyData))
//                            }
//                            .navigationTitle(Text("News"))
//                    }
//                    .navigationBarHidden(true)
//
//
//            }
                SearchView()
            
            List(1..<10) { item in
                    NewsPageCell(article: Article.dummyData)
                    }
                    .navigationTitle(Text("News"))
            
            .navigationBarHidden(true)
        }
        .onAppear(perform: {
            viewModel.getArticles()
        })
    }
}

struct NewsPage_Previews: PreviewProvider {
    static var previews: some View {
        NewsPage()
    }
}
