//
//  Extensions.swift
//  NewsApp
//
//  Created by Murat Can KOÇ on 6.07.2021.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
