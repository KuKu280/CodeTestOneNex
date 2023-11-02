//
//  DashboardTabBar.swift
//  CodingTestOneNex
//
//  Created by Ku Ku Zan on 11/2/23.
//

import UIKit
import UIComponents

class DashboardTabBar: UITabBar {
    
    override var tintColor: UIColor! {
        set {
            super.tintColor = newValue
            selectionDot.backgroundColor = newValue
        }
        get { super.tintColor }
    }
    
    override var selectedItem: UITabBarItem? {
        set {
            let previousSelectedIndex = selectedIndex
            super.selectedItem = newValue
            if selectedIndex != previousSelectedIndex {
                drawGrooveGraphics(animated: true)
                
                UIView.animate(withDuration: 0.25) {
                    self.layoutSelectionDot()
                }
            }
        }
        get { super.selectedItem }
    }
    
    var selectedIndex: Int {
        set { selectedItem = items?[newValue] }
        get {
            selectedItem.flatMap {
                items?.firstIndex(of: $0)
            } ?? -1
        }
    }
    
    private let grooveLayer = CAShapeLayer()
    private let selectionDot = UIView()
    
    /// Try to filter tab bar buttons.
    ///
    /// This property kind of use private API.
    private var tabBarButtons: [UIView] {
        subviews.filter {
            NSClassFromString("UITabBarButton").map($0.isKind(of:)) ?? false
        }
    }
    
    private var badges = [UIView]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initView() {
        setupSelectionDot()
        setupGrooveLayer()
        
        backgroundImage = UIImage()
        shadowImage = UIImage()
        clipsToBounds = false
    }
    
    private func setupSelectionDot() {
        selectionDot.backgroundColor = .CDT.DS.legacyColor
        insertSubview(selectionDot, at: 0)
    }
    
    private func setupGrooveLayer() {
        layer.insertSublayer(grooveLayer, at: 0)
        grooveLayer.backgroundColor = nil
        grooveLayer.borderWidth = 1
        grooveLayer.borderColor = UIColor.systemGray3.cgColor
        grooveLayer.fillColor = UIColor.white.cgColor

    }
    
    private var widthPerItem: CGFloat {
        bounds.width / 4
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutTabBarButtons()
        layoutSelectionDot()
        layoutGrooveLayer()
    }
    
    private func layoutTabBarButtons() {
        
        let widthPerItem = bounds.width / 4
        
        let y: CGFloat = 10//CDTSafeBottomHeight() > 0 ? 5 : 15
        
        tabBarButtons.enumerated().forEach { (i, child) in
            child.frame = CGRect(
                // this tab bar is designed to only show 4 items
                // with button in center
                // so buttons starting from index 2
                // need to be shifted to the right
                // for one button space.
                x: widthPerItem * CGFloat(
                    i //+ (i > 1 ? 1 : 0)
                ),
                y: y,
                width: widthPerItem,
                height: 50
            )
        }
    }

    
    private func layoutSelectionDot() {
        guard selectedIndex != -1
        else {
            selectionDot.frame = .zero
            return
        }
        
        let anchorPoint = centerTopOfSelectedItem()
        let radius = CGFloat(23)
        selectionDot.frame = CGRect(
            x: anchorPoint.x - 30,
            y: anchorPoint.y,
            width: 60,
            height: 4
        )
        selectionDot.roundCorners(corners: [.bottomLeft, .bottomRight], radius: radius)
    }
    
    private func layoutGrooveLayer() {
        grooveLayer.frame = CGRect(
            x: 0,
            y: 0,
            width: bounds.width,
            height: bounds.height
        )
        
        drawGrooveGraphics()
    }
    
    private func drawGrooveGraphics(animated: Bool = false) {
        let path: CGPath
        let previousPath = grooveLayer.path
        
        // if no selection
        if selectedIndex == -1 {
            path = unselectedRectanglePath()
        } else {
            path = rectangleGrooveOverSelectedItem()
        }
        
        grooveLayer.path = path
        grooveLayer.shadowPath = path.copy()
        
        if let previousPath = previousPath, animated {
            grooveLayer.removeAnimation(forKey: "anim:path")
            animate(
                from: previousPath.copy(), to: path.copy(),
                keyPath: "path",
                animationKey: "anim:path"
            )
            
            grooveLayer.removeAnimation(forKey: "anim:shadowPath")
            animate(
                from: previousPath.copy(), to: path.copy(),
                keyPath: "shadowPath",
                animationKey: "anim:shadowPath"
            )
        }
    }
    
    private func animate(
        from: CGPath?, to: CGPath?,
        keyPath: String, animationKey: String
    ) {
        let anim = CABasicAnimation(keyPath: keyPath)
        anim.fromValue = from
        anim.toValue = to
        anim.duration = 0.25
        anim.timingFunction = CAMediaTimingFunction(
            name: .easeOut
        )
        
        grooveLayer.add(anim, forKey: animationKey)
    }
    
    private func unselectedRectanglePath() -> CGPath {
        CGPath(rect: bounds, transform: nil)
    }
    
    private func rectangleGrooveOverSelectedItem() -> CGPath {
        let path = CGMutablePath()
        
        path.move(to: CGPoint(x: bounds.width, y: 0))
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        path.addLine(to: CGPoint(x: 0, y: bounds.height))
        path.addLine(to: .zero)
        
        let anchorPoint = centerTopOfSelectedItem()
        // add line to start of the groove first
        path.addLine(
            to: CGPoint(
                x: anchorPoint.x - 25,
                y: anchorPoint.y
            )
        )

        path.closeSubpath()
        
        return path
    }
    
    private func centerTopOfSelectedItem() -> CGPoint {
        let halfItemWidth = widthPerItem / 2
        let index = CGFloat(selectedIndex)
        return CGPoint(
            x: halfItemWidth + index * widthPerItem,
            y: 0
        )
    }
    
}
