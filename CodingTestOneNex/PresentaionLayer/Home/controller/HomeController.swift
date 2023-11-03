//
//  HomeController.swift
//  CodingTestOneNex
//
//  Created by Ku Ku Zan on 11/2/23.
//

import UIKit
import Combine

class HomeController: UIViewController {
    
    @IBOutlet private(set) var ib: IB!
    
    var didTap = false
    
    let viewModel = HomeViewModel()
    private var cancellable = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ib.setupUI()
        bindViewModel()
        viewModel.fetchAPI()
    }
    
    private func bindViewModel() {
        viewModel.$articles
            .receive(on: DispatchQueue.main)
            .sink { [weak self] items in
                guard let self = self  else { return }
                ib.promotionView.promotions = items.map { $0.title }
            }.store(in: &cancellable)
        
        viewModel.$articlesCategories
            .receive(on: DispatchQueue.main)
            .sink { [weak self] items in
                guard let self = self  else { return }
                ib.announcementView.annoncements = items.map { $0.name }
                ib.newsletterView.newsletters = items.map { $0.name }
            }.store(in: &cancellable)
    }
    
    @IBAction
    private func didTapToggle(_ sender: UIButton) {
        didTap.toggle()
        ib.render(flag: didTap)
    }

}
