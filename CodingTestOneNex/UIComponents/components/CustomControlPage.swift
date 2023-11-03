//
//  CustomControlPage.swift
//  CodingTestOneNex
//
//  Created by Ku Ku Zan on 11/3/23.
//

import Foundation
import UIKit

class CustomControlPage: UIPageControl {
    
    override var currentPage: Int {
        didSet {
            updateDots()
        }
    }
    
    func updateDots() {
        let currentDot = subviews[currentPage]
        
        let spacing = 5.0
        
        subviews.forEach {
            $0.frame = ($0 == currentDot) ? CGRect(x: 0, y: 0, width: 16, height: 4) : CGRect(x: spacing, y: 0, width: 8, height: 4)
            //$0.frame.size = ($0 == currentDot) ? CGSize(width: 16, height: 4) : CGSize(width: 8, height: 4)
            $0.layer.cornerRadius = 2
        }
    }
}
