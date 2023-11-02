//
//  HomeController.swift
//  CodingTestOneNex
//
//  Created by Ku Ku Zan on 11/2/23.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet private(set) var ib: IB!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ib.setupUI()
        rewardSectionConfiguration()
    }
    
    private func rewardSectionConfiguration() {
        ib.rewardSectionView.onTap = { [weak self] toggle in
            self?.render(flag: toggle)
        }
    }
    
    private func render(flag: Bool) {
        flag == true ?
        (ib.rewardSectionHeight.constant = 315) :
        (ib.rewardSectionHeight.constant = 180)
    }

}
