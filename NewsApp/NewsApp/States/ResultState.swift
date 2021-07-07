//
//  ResultState.swift
//  NewsApp
//
//  Created by Murat Can KOÇ on 6.07.2021.
//

import Foundation

enum ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
