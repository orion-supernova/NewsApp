//
//  PlaceholderImageView.swift
//  NewsApp
//
//  Created by Murat Can KOÇ on 6.07.2021.
//

import SwiftUI

struct PlaceholderImageView: View {
    var body: some View {
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(Color.gray)
            .frame(width: 100, height: 100)
    }
}

struct PlaceholderImageView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderImageView()
    }
}
