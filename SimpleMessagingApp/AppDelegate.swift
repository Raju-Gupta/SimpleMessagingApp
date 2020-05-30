//
//  AppDelegate.swift
//  SimpleMessagingApp
//
//  Created by Raju Gupta on 30/05/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if #available(iOS 13.0, *){
            //do nothing we will have a code in SceneceDelegate for this
        }
        else {
            
            if UserDefaults.standard.bool(forKey: "isLogin")
            {
                let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let VC = mainStoryboard.instantiateViewController(withIdentifier: "RootTabBarController") as! RootTabBarController
                let navigationController = UINavigationController(rootViewController: VC)
                navigationController.isNavigationBarHidden = true
                self.window = UIWindow(frame: UIScreen.main.bounds)
                self.window!.rootViewController = navigationController
                
            }
            else
            {
                let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let VC = mainStoryboard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
                let navigationController = UINavigationController(rootViewController: VC)
                navigationController.isNavigationBarHidden = true
                self.window = UIWindow(frame: UIScreen.main.bounds)
                self.window!.rootViewController = navigationController
                
            }
            
        }
        FirebaseApp.configure()
        IQKeyboardManager.shared.enable = true
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

