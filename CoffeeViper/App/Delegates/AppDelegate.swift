//
//  AppDelegate.swift
//  CoffeeViper
//
//  Created by Gedikoglu, Ali on 15.12.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        window?.backgroundColor = .white
        window?.rootViewController = CoffeeListWireFrame.createModule()
        window?.makeKeyAndVisible()

        return true
    }
}

