//
//  DashboardTabBarController.swift
//  CodingTestOneNex
//
//  Created by Ku Ku Zan on 11/2/23.
//

import UIKit

class DashboardTabBarController: UITabBarController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var upperLineView: UIView!
       
    let spacing: CGFloat = 12
    
    var dashboardTabBar: DashboardTabBar! {
        tabBar as? DashboardTabBar
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            self.addTabbarIndicatorView(index: 0, isFirstTime: true)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    ///Add tabbar item indicator uper line
    func addTabbarIndicatorView(index: Int, isFirstTime: Bool = false){
        guard let tabView = tabBar.items?[index].value(forKey: "view") as? UIView else {
            return
        }
        if !isFirstTime{
            upperLineView.removeFromSuperview()
        }
        upperLineView = UIView(
            frame: CGRect(
                x: tabView.frame.minX + spacing,
                y: tabView.frame.minY + 0.1,
                width: tabView.frame.size.width - spacing * 2,
                height: 4
            )
        )
        upperLineView.backgroundColor = .CDT.DS.legacyColor
        upperLineView.roundCorners(corners: [.bottomLeft,.bottomRight], radius: 4.0)
        tabBar.addSubview(upperLineView)
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
        addDiscoverController()
        addCollectController()
        addPocketController()
        addSettingController()
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
    
    private func addDiscoverController() {
        add(
            UIViewController(),
            tabBarItem: UITabBarItem(
                title: "Discover",
                image: UIImage(systemName: "safari"),
                selectedImage: UIImage(systemName: "safari.fill")
            )
        )
    }
    
    private func addCollectController() {
        add(
            UIViewController(),
            tabBarItem: UITabBarItem(
                title: "Collect/Pay",
                image: UIImage(systemName: "qrcode.viewfinder"),
                selectedImage: UIImage(systemName: "qrcode.viewfinder")
            )
        )
    }
    
    private func addPocketController() {
        add(
            UIViewController(),
            tabBarItem: UITabBarItem(
                title: "My Pocket",
                image: UIImage(systemName: "wallet.pass"),
                selectedImage: UIImage(systemName: "wallet.pass.fill")
            )
        )
    }
    
    private func addSettingController() {
        add(
            UIViewController(),
            tabBarItem: UITabBarItem(
                title: "Setting",
                image: UIImage(systemName: "gearshape"),
                selectedImage: UIImage(systemName: "gearshape.fill")
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
        didSelect viewController: UIViewController
    ) {
        addTabbarIndicatorView(index: self.selectedIndex)
    }
}
