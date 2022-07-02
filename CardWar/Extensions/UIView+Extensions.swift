//
//  UIView+Extensions.swift
//  CardWar
//
//  Created by Vincent Grossier on 02/07/2022.
//

import UIKit

@IBDesignable
extension UIView {
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            guard let color = layer.borderColor else {
                return nil
            }
            
            return UIColor(cgColor: color)
        }
        
        set {
            layer.borderColor = newValue!.cgColor
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            layer.borderWidth
        }
        
        set {
            layer.borderWidth = newValue
        }
    }
}
