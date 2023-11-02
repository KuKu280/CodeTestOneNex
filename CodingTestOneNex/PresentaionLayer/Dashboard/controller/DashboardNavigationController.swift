//
//  DashboardNavigationController.swift
//  CodingTestOneNex
//
//  Created by Ku Ku Zan on 11/2/23.
//

import UIKit

class DashboardNavigationController: UINavigationController {

    init() {
        super.init(
            rootViewController: DashboardTabBarController()
        )
        navigationBar.isHidden = true
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
