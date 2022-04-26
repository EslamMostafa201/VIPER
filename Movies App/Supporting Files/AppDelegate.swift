//
//  AppDelegate.swift
//  Movies App
//
//  Created by Eslam Mostafa on 26/04/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupNavigation()
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = Destinations.moviesVC.viewcontroller
        _ = AppNavigator(window: window ?? UIWindow(), viewController: viewController)
        
        return true
    }
    
    private func setupNavigation() {
        let navigationBarAppearace = UINavigationBar.appearance()
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .red
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navigationBarAppearace.tintColor = .white
            navigationBarAppearace.standardAppearance = appearance
            navigationBarAppearace.scrollEdgeAppearance = navigationBarAppearace.standardAppearance
        } else {
            navigationBarAppearace.tintColor = .white
            navigationBarAppearace.barTintColor = .red
            navigationBarAppearace.titleTextAttributes = [.foregroundColor: UIColor.white]
            navigationBarAppearace.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        }
    }
}

