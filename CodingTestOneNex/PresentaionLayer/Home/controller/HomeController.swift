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
                ib.promotionView.promotions = items.map {
                    .init(
                        name: $0.title,
                        date: $0.updatedDate
                    )
                }
            }.store(in: &cancellable)
        
        viewModel.$articlesCategories
            .receive(on: DispatchQueue.main)
            .sink { [weak self] items in
                guard let self = self  else { return }
                ib.announcementView.annoncements = items.map {
                    .init(
                        name: $0.name,
                        date: $0.updatedDate
                    )
                }
                ib.newsletterView.newsletters = items.map {
                    .init(
                        name: $0.name,
                        date: $0.updatedDate
                    )
                }
            }.store(in: &cancellable)
    }
    
    @IBAction
    private func didTapToggle(_ sender: UIButton) {
        didTap.toggle()
        ib.render(flag: didTap)
    }

}
