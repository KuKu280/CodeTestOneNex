//
//  UIView+Ext.swift
//  CodingTestOneNex
//
//  Created by Ku Ku Zan on 11/2/23.
//

import UIKit
extension UIView {
    
    func roundCorners(
        corners: UIRectCorner,
        radius: CGFloat
    ) {
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(
                width: radius,
                height: radius
            )
        )
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func dropShadow() {
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowRadius = 2
        layer.cornerRadius = 15
    }
}
