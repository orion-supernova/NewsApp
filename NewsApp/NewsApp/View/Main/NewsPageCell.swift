//
//  NewsPageCell.swift
//  NewsApp
//
//  Created by Murat Can KOÇ on 6.07.2021.
//

import SwiftUI
import Kingfisher

struct NewsPageCell: View {
    
    let article: Article
    
    var body: some View {
        
        
            HStack {
                
                VStack(alignment: .leading, spacing: 4) {
                    
                    
                    Text(article.title)
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .semibold))
                    Text(article.articleDescription)
                        .foregroundColor(.gray)
                        .font(.footnote)
                }
                .padding()
                
                Spacer()
                
                NavigationLink(
                    destination: NewsDetailPage(article: Article.dummyData),
                    label: {
                        if let imageURL = article.urlToImage, let url = URL(string: imageURL) {
                            KFImage(url)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                                .padding()
                        } else {
                            PlaceholderImageView()
                                .padding()
                        }
                    })
                
                
                
            }
        
        
    }
    
}

struct NewsPageCell_Previews: PreviewProvider {
    static var previews: some View {
        NewsPageCell(article: Article.dummyData)
    }
}
