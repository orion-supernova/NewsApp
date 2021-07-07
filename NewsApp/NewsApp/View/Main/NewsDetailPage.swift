//
//  NewsDetailPage.swift
//  NewsApp
//
//  Created by Murat Can KOÇ on 7.07.2021.
//

import SwiftUI
import Kingfisher

struct NewsDetailPage: View {
    
    @Environment(\.openURL) var openURL
    @StateObject var viewModel = NewsViewModelImp(service: NewsServiceImpl())
    
    
    
    @State var favorites: [String] = UserDefaults.standard.stringArray(forKey: "favorites") ?? []
    @State var isFavorite = false
    
    let article: Article
    
    var body: some View {
        ScrollView {
            KFImage(URL(string: article.urlToImage!))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 400)
                .cornerRadius(10)
                .padding()
            Text(article.articleDescription)
                .font(.system(size: 24, weight: .bold))
                .padding(.bottom, 5)
            HStack {
                HStack {
                    Image(systemName: "doc.text")
                        .font(.system(size: 20))
                    Text(article.author ?? "N/A")
                }
                Spacer()
                    .frame(width: 100)
                HStack {
                    Image(systemName: "calendar")
                    Text(article.dateString ?? "")
                    
                }
            }
            Text(article.content)
                .font(.system(size: 18, weight: .regular))
                .padding()
        }
        .onAppear(perform: {
            checkIfFavorite(id: article.id.uuidString)
        })
        .navigationBarItems(trailing:
                                HStack(spacing: 30){
                                    Button(action: {
                                        actionSheet()
                                    }, label: {
                                        Image(systemName: "square.and.arrow.up")
                                            .font(.system(size: 20))
                                    })
                                    Button(action: {
                                        if isFavorite == false {
                                            favorites.append(article.id.uuidString)
                                            UserDefaults.standard.set(favorites, forKey: "favorites")
                                        } else {
                                            favorites.removeAll()
                                            UserDefaults.standard.set(favorites, forKey: "favorites")
                                        }
                                        
                                        
                                    }, label: {
                                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                                            .font(.system(size: 20))
                                    })
                                }
                                .padding(.trailing)
        )
        
        Button(action: {
            load(url: article.url)
        }, label: {
            Text("News Source")
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 250, height: 40)
                .background(Color.green)
                .clipShape(Capsule())
                .padding()
        })
    }
    
    func actionSheet() {
        guard let urlShare = URL(string: article.url) else { return }
        let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
    
    func load(url: String?) {
        guard let link = url, let url = URL(string: link) else { return }
        openURL(url)
    }
    func checkIfFavorite(id: String) -> Bool {
        var returning = false
        for item in favorites {
            if item.contains(id) {
                self.isFavorite = true
                returning = true
            }
        }
        return returning
    }
}

struct NewsDetailPage_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailPage( article: Article.dummyData)
    }
}
