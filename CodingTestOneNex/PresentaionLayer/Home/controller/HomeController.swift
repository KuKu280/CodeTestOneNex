//
//  HomeController.swift
//  CodingTestOneNex
//
//  Created by Ku Ku Zan on 11/2/23.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet private(set) var ib: IB!
    
    var didTap = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ib.setupUI()
       
    }
    
    
    @IBAction
    private func didTapToggle(_ sender: UIButton) {
        didTap.toggle()
        ib.render(flag: didTap)
    }

}
