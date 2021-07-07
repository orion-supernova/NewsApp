//
//  FavoritesPage.swift
//  NewsApp
//
//  Created by Murat Can KOÇ on 6.07.2021.
//

import SwiftUI

struct FavoritesPage: View {
    
    @StateObject var viewModel = NewsViewModelImp(service: NewsServiceImpl())
    
    @State var favorites: [String] = UserDefaults.standard.stringArray(forKey: "favorites") ?? []
    
    var body: some View {
        
        Group {
//            switch viewModel.state {
//            case .loading:
//                ProgressView()
//            case .failed(let error):
//                ErrorView(error: error, handler: viewModel.getArticles)
//            case .success( let articles):
//                    NavigationView {
//                        List(1..<10) { item in
//                            NewsPageCell(article: Article.dummyData)
//                            }
//                            .navigationTitle(Text("News"))
//                    }
//                    .navigationBarHidden(true)
//
//
//            }
            NavigationView {
                List(0..<favorites.count) { item in
                    NewsPageCell(article: Article.dummyData)
                    }
                    .navigationTitle(Text("Favorites"))
            }
            .navigationBarHidden(true)
        }
        .onAppear(perform: {
            viewModel.getArticles()
        })
    }
}

struct FavoritesPage_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesPage()
    }
}
