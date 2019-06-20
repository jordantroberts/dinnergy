//
//  AppDelegate.swift
//  Dinnergy
//
//  Created by Jordan Roberts on 11/06/2019.
//  Copyright © 2019 Edgy Eats. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let attributes = [NSAttributedString.Key.font: UIFont(name: "AvenirNext-Bold", size: 17)!]
        UINavigationBar.appearance().titleTextAttributes = attributes
        UIBarButtonItem.appearance().setTitleTextAttributes(attributes, for: .normal)
        var navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        return true
    }

}

