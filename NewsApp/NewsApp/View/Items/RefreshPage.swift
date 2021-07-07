//
//  RefreshPage.swift
//  NewsApp
//
//  Created by Murat Can KOÇ on 7.07.2021.
//

import UIKit
import SwiftUI


struct RefreshPage: UIViewRepresentable {
    
    
    
    var width: CGFloat
    var height: CGFloat
    
    func makeUIView(context: Context) -> some UIScrollView {
        let scrollView = UIScrollView()
        scrollView.refreshControl = UIRefreshControl()
        scrollView.refreshControl?.addTarget(context.coordinator, action: #selector(Coordinator.handleRefreshControl(sender:)), for: .valueChanged)
        
        let refreshVC = UIHostingController(rootView: NewsPage())
        refreshVC.view.frame = CGRect(x: 0, y: 0, width: width, height: height)
        scrollView.addSubview(refreshVC.view)
        return scrollView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
   
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    class Coordinator: NSObject {
        var refreshPage: RefreshPage
        
        init(_ refreshPage: RefreshPage) {
            self.refreshPage = refreshPage
        }
        
        @objc func handleRefreshControl (sender: UIRefreshControl) {
            sender.endRefreshing()
            NewsViewModelImp(service: NewsServiceImpl()).getArticles()
        }
        
        
    }
}
