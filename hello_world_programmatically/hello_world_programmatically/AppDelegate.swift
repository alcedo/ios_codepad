//
//  AppDelegate.swift
//  hello_world_programmatically
//
//  Created by Victor Liew on 3/29/15.
//  Copyright (c) 2015 Victor Liew. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.backgroundColor = UIColor.whiteColor()
        
        let mvc = MainViewController()
        mvc.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Bookmarks, tag: 1)
        let mvcNavController = UINavigationController(rootViewController: mvc)
        
        let tableView = SampleTableViewController()
        tableView.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.MostRecent, tag: 2)
        let tableViewNavController = UINavigationController(rootViewController: tableView)
        
        let tvc = TestViewController()
        tvc.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Contacts, tag: 3)
        
        // https://developer.apple.com/library/ios/documentation/UIKit/Reference/UITabBarController_Class/
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [mvcNavController, tableViewNavController, tvc]
        tabBarController.selectedViewController = mvcNavController
        

        self.window?.rootViewController = tabBarController
        
        self.window?.makeKeyAndVisible()
        
        self.addRandomTestsHere()
        
        return true
    }
    
    // Mostly used to test out swift language
    func addRandomTestsHere() {
        let tester = AccessControlTester()
        tester.internalMethod()
        
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

