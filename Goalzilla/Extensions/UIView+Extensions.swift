//
//  UIView+Extensions.swift
//  Goalzilla
//
//  Created by Abdelrahman Elshreif on 14/5/25.
//

import UIKit

extension UIView{
    @IBInspectable var cornerRadius:CGFloat{
        get { return cornerRadius}
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
