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
    
    
    func setupUI() {
        welcomeContainerView.dropShadow()
    }
}
