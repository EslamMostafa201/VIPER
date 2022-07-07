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
        let viewController = MoviesRouter.createModule()
        window?.rootViewController = UINavigationController(rootViewController: viewController)
        window?.makeKeyAndVisible()
        return true
    }
    
    private func setupNavigation() {
        let navigationBarAppearace = UINavigationBar.appearance()
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = PublicMethods.hexaStringToUIColor("AF52E8")
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navigationBarAppearace.tintColor = .white
            navigationBarAppearace.standardAppearance = appearance
            navigationBarAppearace.scrollEdgeAppearance = navigationBarAppearace.standardAppearance
        } else {
            navigationBarAppearace.tintColor = .white
            navigationBarAppearace.barTintColor = PublicMethods.hexaStringToUIColor("AF52E8")
            navigationBarAppearace.titleTextAttributes = [.foregroundColor: UIColor.white]
            navigationBarAppearace.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        }
    }
}

