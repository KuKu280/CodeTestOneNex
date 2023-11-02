//
//  DashboardTabBarController.swift
//  CodingTestOneNex
//
//  Created by Ku Ku Zan on 11/2/23.
//

import UIKit
import UIComponents

class DashboardTabBarController: UITabBarController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var dashboardTabBar: DashboardTabBar! {
        tabBar as? DashboardTabBar
    }
    
    override var delegate: UITabBarControllerDelegate? {
        set { }
        get { self }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    private func setup() {
        configureTabBar()
        configureSubControllers()
    }
    
    private func configureTabBar() {
        let tabbar = DashboardTabBar()
        setValue(tabbar, forKey:"tabBar")
        tabBar.tintColor = .CDT.DS.legacyColor
        
        tabBar.backgroundColor = .clear
        tabBar.backgroundImage = .from(color: .clear)
        tabBar.shadowImage = .from(color: .clear)
        tabBar.selectionIndicatorImage = .from(color: .clear)
    }
    
    private func configureSubControllers() {
        addHomeController()
        addHomeController()
    }
    
    private func addHomeController() {
        add(
            HomeController(),
            tabBarItem: UITabBarItem(
                title: "Home",
                image: UIImage(systemName: "house.fill"),
                selectedImage: UIImage(systemName: "house.fill")
            )
        )
    }
    
    private func add(
        _ controller: UIViewController, tabBarItem: UITabBarItem?
    ) {
        tabBarItem?.setTitleTextAttributes(
            [
                .font: UIFont.systemFont(ofSize: 12),
                .foregroundColor: UIColor.black
            ],
            for: .normal
        )
        
        controller.tabBarItem = tabBarItem
        addChild(controller)
    }
    

}

extension DashboardTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(
        _ tabBarController: UITabBarController,
        shouldSelect viewController: UIViewController
    ) -> Bool {
        
        guard let fromView = selectedViewController?.view
        else { return false }
        
        guard let toView = viewController.view
        else { return false }
        
        if fromView != toView {
            UIView.transition(
                from: fromView, to: toView, duration: 0.25,
                options: [.transitionCrossDissolve],
                completion: nil
            )
        }
        
        return true
    }
}
