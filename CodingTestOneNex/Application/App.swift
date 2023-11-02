//
//  App.swift
//  CodingTestOneNex
//
//  Created by Ku Ku Zan on 11/2/23.
//

import Foundation
import UIKit

final class App: NSObject {
    
    /// Shared singleton app instance.
    static let shared = App()
    
    /// Window associated with the app.
    var window: UIWindow!
    
    /// The Window scene of this app.
    var windowScene: UIWindowScene! {
        UIApplication.shared.connectedScenes.first {
            $0 is UIWindowScene
        } as? UIWindowScene
    }
    
}

extension App {
    /// Prepare UI for fresh launches.
    /// Call this method on app launch or scene init
    func prepareUI(using window: UIWindow) {
        // retain window
        self.window = window
        window.backgroundColor = .white
        
        renderDashboard()
    }
}

extension App {
    
    /// Render Dashboard
    func renderDashboard() {
        setRoot(
            viewController: DashboardNavigationController()
        )
    }
    
}

extension App {
    func setRoot(viewController: UIViewController, animated: Bool = true) {
        window.rootViewController = viewController
        UIView.transition(
            with: window, duration: 0.25,
            options: .transitionCrossDissolve,
            animations: nil
        )
    }
}
