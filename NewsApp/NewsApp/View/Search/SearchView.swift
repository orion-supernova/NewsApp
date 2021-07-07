//
//  SearchView.swift
//  NewsApp
//
//  Created by Murat Can KOÇ on 6.07.2021.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText = ""
    @State var inSearchMode = false
    
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        ScrollView {
            
            // searchbar

            SearchBar(text: $searchText, isEditing: $inSearchMode)
                .padding()
            
            //grid view/user list view
            
            ZStack(alignment: .leading) {
                
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
