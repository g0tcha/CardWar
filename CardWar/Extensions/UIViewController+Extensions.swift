//
//  UIViewController+Extensions.swift
//  CardWar
//
//  Created by Vincent Grossier on 02/07/2022.
//

import UIKit

extension UIViewController {
    
    func presentAlertController(with title: String, andMessage message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: "Understood!", style: .default)
        alertController.addAction(okAlertAction)
        present(alertController, animated: true)
    }
}
