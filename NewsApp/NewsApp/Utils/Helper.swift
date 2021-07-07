//
//  Helper.swift
//  NewsApp
//
//  Created by Murat Can KOÇ on 6.07.2021.
//

import UIKit


class Helper {
    
    static var app: Helper = {
        return Helper()
        
    }()
    
    func alertMessage(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action: UIAlertAction) in
        }
        alertVC.addAction(okAction)
        
        let viewController = UIApplication.shared.windows.first!.rootViewController!
        viewController.present(alertVC, animated: true, completion: nil)
    }
    
    
    
    
    
}
