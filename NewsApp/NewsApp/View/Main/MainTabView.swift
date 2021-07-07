//
//  MainTabView.swift
//  NewsApp
//
//  Created by Murat Can KOÇ on 7.07.2021.
//

import SwiftUI

struct MainTabView: View {
    
    @StateObject var viewModel = NewsViewModelImp(service: NewsServiceImpl())
    
    var body: some View {
        NavigationView {
            TabView {
                LazyView(NewsPage())
                    .tabItem {
                        Image(systemName: "newspaper")
                    }
                
                LazyView(FavoritesPage())
                    .tabItem {
                        Image(systemName: "heart")
                    }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        .accentColor(.green)
    }
}

//struct MainTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainTabView(selectedIndex: .constant(0))
//    }
//}
