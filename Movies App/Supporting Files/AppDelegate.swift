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
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = Destinations.moviesVC.viewcontroller
        _ = AppNavigator(window: window ?? UIWindow(), viewController: viewController)
        
        return true
    }
}

