//
//  UIViewController+Extentions.swift
//  GitHubUsers
//
//  Created by Arsenkin Bogdan on 02.02.2020.
//  Copyright © 2020 Arsenkin Bogdan. All rights reserved.
//

import UIKit

extension UIViewController {
    func showErrorAlert(message: String, completion: ((UIAlertAction) -> ())? = nil) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: completion)
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
}
