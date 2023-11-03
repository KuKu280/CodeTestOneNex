//
//  NewsletterItemCell.swift
//  CodingTestOneNex
//
//  Created by Ku Ku Zan on 11/3/23.
//

import UIKit

class NewsletterItemCell: NibBasedCollectionViewCell {

    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func render(title: String) {
        titleLabel.text = title
    }
    
    func render(date: String) {
        dateLabel.text = date
    }
}
