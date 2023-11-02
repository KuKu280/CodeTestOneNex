//
//  RewardSectionView.swift
//  CodingTestOneNex
//
//  Created by Ku Ku Zan on 11/2/23.
//

import UIKit
import UIComponents

class RewardSectionView: NibBasedControl {
    
    @IBOutlet private(set) var toggleButton: UIButton!
    @IBOutlet private(set) var rewardStackView: UIStackView!
    @IBOutlet private(set) var leaderboardStackView: UIStackView!

    var onTap = {(_: Bool) in}
    var onSwitch = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func render(flag: Bool) {
        leaderboardStackView.isHidden = !flag
        flag == true ?
        (toggleButton.setImage(.CDT.upToggle, for: .normal)) :
        (toggleButton.setImage(.CDT.downToggle, for: .normal))
    }

    @IBAction func didTapToggle(_ sender: UIButton) {
        onSwitch.toggle()
        render(flag: onSwitch)
        onTap(onSwitch)
    }
}
