//
//  AppDelegate.swift
//  XoomAssignment
//
//  Created by Chris Kong on 5/27/17.
//  Copyright © 2017 Chris Kong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        applyStyles()
        return true
    }
    
    private func applyStyles() {
        let navigationBar = UINavigationBar.appearance()
        navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName: ColorScheme.navigationBarForegroundColor,
            NSFontAttributeName: Font.navigationBar]
        navigationBar.tintColor = ColorScheme.navigationBarForegroundColor
        navigationBar.barTintColor = ColorScheme.navigationBarBackgroundColor
    }
}
