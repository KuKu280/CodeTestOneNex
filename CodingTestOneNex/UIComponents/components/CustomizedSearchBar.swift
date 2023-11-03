//
//  CustomizedSearchBar.swift
//  CodingTestOneNex
//
//  Created by Ku Ku Zan on 11/3/23.
//

import UIKit

protocol CustomizedSearchBarDelegate: UITextFieldDelegate {
    func textFieldIconClicked(btn:UIButton)
}

@IBDesignable
class CustomizedSearchBar: UITextField {
    
    private var myDelegate: CustomizedSearchBarDelegate? {
        get { return delegate as? CustomizedSearchBarDelegate }
    }
    
    @objc func buttonClicked(btn: UIButton){
        self.myDelegate?.textFieldIconClicked(btn: btn)
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += padding
        return textRect
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x -= padding
        return textRect
    }
    let button = UIButton(type: .custom)
    @IBInspectable var padding: CGFloat = 5
    @IBInspectable var leadingImage: UIImage? { didSet { updateView() }}
    @IBInspectable var color: UIColor = UIColor.lightGray { didSet { updateView() }}
    @IBInspectable var imageColor: UIColor = UIColor.darkGray { didSet { updateView() }}
    @IBInspectable var rtl: Bool = false { didSet { updateView() }}
    
    func updateView() {
        rightViewMode = .never
        rightView = nil
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 2, height: self.frame.height))
        leftViewMode = .always
        layer.cornerRadius = 7
        layer.masksToBounds = true
        
        
        if let image = leadingImage {
            
            button.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
            
            let tintedImage = image.withRenderingMode(.alwaysTemplate)
            let selectedImage = UIImage(named: "clear")?.withRenderingMode(.alwaysTemplate)
            button.setImage(tintedImage, for: .normal)
            button.setImage(selectedImage, for: .selected)
            button.tintColor = imageColor
            
            button.setTitleColor(UIColor.clear, for: .normal)
            button.addTarget(self, action: #selector(buttonClicked(btn:)), for: .touchDown)
            button.isUserInteractionEnabled = true
            
            if rtl {
                rightViewMode = .always
                rightView = button
            } else {
                leftViewMode = .always
                leftView = button
            }
        }
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)])
    }
}
