//
//  LazyView.swift
//  NewsApp
//
//  Created by Murat Can KOÇ on 7.07.2021.
//

import SwiftUI

struct LazyView<Content: View>: View {
    
    
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping() -> Content ) {
        self.build = build
    }
    
    
    var body: Content {
        build()
    }
    
}
