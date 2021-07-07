//
//  ContentView.swift
//  NewsApp
//
//  Created by Murat Can KOÇ on 6.07.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedIndex = 0
    
    var body: some View {
        MainTabView()
//        NewsPage()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
