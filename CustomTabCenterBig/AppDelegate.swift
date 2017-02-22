//
//  AppDelegate.swift
//  CustomTabCenterBig
//
//  Created by Nitin Gohel on 22/02/17.
//  Copyright © 2017 Nitin Gohel. All rights reserved.
//

import UIKit
import ESTabBarController_swift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UITabBarControllerDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
      
            let tabBarController = ESTabBarController()
            tabBarController.delegate = self
            tabBarController.title = "Irregularity"
            tabBarController.tabBar.shadowImage = UIImage(named: "transparent")
            tabBarController.tabBar.backgroundImage = UIImage(named: "background_dark")
            tabBarController.shouldHijackHandler = {
                tabbarController, viewController, index in
                if index == 2 {
                    return true
                }
                return false
            }
            tabBarController.didHijackHandler = {
                [weak tabBarController] tabbarController, viewController, index in
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    let alertController = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
                    let takePhotoAction = UIAlertAction(title: "Take a photo", style: .default, handler: nil)
                    alertController.addAction(takePhotoAction)
                    let selectFromAlbumAction = UIAlertAction(title: "Select from album", style: .default, handler: nil)
                    alertController.addAction(selectFromAlbumAction)
                    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                    alertController.addAction(cancelAction)
                    tabBarController?.present(alertController, animated: true, completion: nil)
                }
            }
            
            let v1 = ExampleViewController()
            let v2 = ExampleViewController()
            let v3 = ExampleViewController()
            let v4 = ExampleViewController()
            let v5 = ExampleViewController()
            
            v1.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
            v2.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Find", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
            v3.tabBarItem = ESTabBarItem.init(ExampleIrregularityContentView(), title: nil, image: UIImage(named: "photo_verybig"), selectedImage: UIImage(named: "photo_verybig"))
            v4.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Favor", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
            v5.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Me", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
            
            tabBarController.viewControllers = [v1, v2, v3, v4, v5]
            
            let navigationController = ExampleNavigationController.init(rootViewController: tabBarController)
            tabBarController.title = "Example"


        self.window?.rootViewController = navigationController
       
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

