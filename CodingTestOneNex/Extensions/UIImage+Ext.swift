//
//  UIImage+Ext.swift
//  CodingTestOneNex
//
//  Created by Ku Ku Zan on 11/2/23.
//

import UIKit

public extension UIImage {
    
    /// Create an image of 1 square pixel from given color.
    static func from(color: UIColor, size: CGSize = .init(width: 1, height: 1)) -> UIImage {
        let rect = CGRect(origin: .zero, size: size)
        // start ctx
        UIGraphicsBeginImageContext(rect.size)
        // end ctx after call stack dealloc
        defer { UIGraphicsEndImageContext() }
        
        guard let context = UIGraphicsGetCurrentContext()
        else { return UIImage() }
        
        context.setFillColor(color.cgColor)
        context.fill(rect)
        
        return UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        
    }
    
}
