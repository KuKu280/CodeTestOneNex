//
//  HomeController+IB.swift
//  CodingTestOneNex
//
//  Created by Ku Ku Zan on 11/2/23.
//

import UIKit

extension HomeController {
    typealias IB = HomeController_IB
}

final class HomeController_IB: NSObject {
    
    @IBOutlet private(set) var welcomeContainerView: UIView!
    @IBOutlet private(set) var bannerView: BannerView!
    @IBOutlet private(set) var toggleButton: UIButton!
    
    func setupUI() {
        welcomeContainerView.dropShadow()
    }
    
    func render(flag: Bool) {
        bannerView.leaderboardStackView.isHidden = !flag
        flag == true ?
        (toggleButton.setImage(.CDT.upToggle, for: .normal)) :
        (toggleButton.setImage(.CDT.downToggle, for: .normal))
    }
}
