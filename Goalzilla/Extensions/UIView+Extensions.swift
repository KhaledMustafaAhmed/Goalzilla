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

    extension UIButton {
         func ForBtnBig( DoThis: @escaping (() ->())){
               self.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
               UIView.animate(withDuration: 2.0, delay: 0,
                usingSpringWithDamping: CGFloat(0.20),
                initialSpringVelocity: CGFloat(6.0),
                options: UIView.AnimationOptions.allowUserInteraction,
                animations: {
                self.transform = CGAffineTransform.identity
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                    DoThis()
                })},
            completion: { Void in()  })
           }
    }

