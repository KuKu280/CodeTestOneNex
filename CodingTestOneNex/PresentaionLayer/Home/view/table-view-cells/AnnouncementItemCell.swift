//
//  AnnouncementItemCell.swift
//  CodingTestOneNex
//
//  Created by Ku Ku Zan on 11/3/23.
//

import UIKit

class AnnouncementItemCell: NibBasedTableViewCell {

    @IBOutlet private var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func render(title: String) {
        titleLabel.text = title
    }
}
