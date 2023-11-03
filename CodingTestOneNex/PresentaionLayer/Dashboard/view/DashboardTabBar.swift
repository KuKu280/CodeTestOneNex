//
//  DashboardTabBar.swift
//  CodingTestOneNex
//
//  Created by Ku Ku Zan on 11/2/23.
//

import UIKit

 class DashboardTabBar: UITabBar {
     
     var color: UIColor?
     var radii: CGFloat = 18
    
    private var shapeLayer: CALayer?
    
    override func draw(_ rect: CGRect) {
        addShape()
    }
    
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.fillColor = color?.cgColor ?? UIColor.white.cgColor
        
        if let oldShapeLayer = self.shapeLayer {
            layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            layer.insertSublayer(shapeLayer, at: 0)
        }
        
        self.shapeLayer = shapeLayer
    }
    
    private func createPath() -> CGPath {
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: 0, height: 0.0))
        
        return path.cgPath
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.isTranslucent = true
        var tabFrame = self.frame
        tabFrame.size.height = 60 + safeAreaInsets.bottom
        tabFrame.origin.y = self.frame.origin.y + self.frame.height - 60 - safeAreaInsets.bottom
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.systemGray4.cgColor
        self.frame = tabFrame
        self.items?.forEach({ $0.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: 5.0) })
    }
    
}
