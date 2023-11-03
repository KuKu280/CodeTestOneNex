//
//  PromotionItemCell.swift
//  CodingTestOneNex
//
//  Created by Ku Ku Zan on 11/3/23.
//

import UIKit

class PromotionItemCell: NibBasedCollectionViewCell {
    
    @IBOutlet private var titleLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func render(title: String) {
        titleLabel.text = title
    }
}
