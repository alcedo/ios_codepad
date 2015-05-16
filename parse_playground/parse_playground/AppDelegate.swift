//
//  AppDelegate.swift
//  parse_playground
//
//  Created by Victor Liew on 5/15/15.
//  Copyright (c) 2015 alcedo. All rights reserved.
//

import UIKit
import Parse
import Bolts

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // [Optional] Power your app with Local Datastore. For more info, go to
        // https://parse.com/docs/ios_guide#localdatastore/iOS
        Parse.enableLocalDatastore()
        
        // Initialize Parse.
        Parse.setApplicationId("",
            clientKey: "")
        
        // [Optional] Track statistics around application opens.
        PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
        
        
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject["Q"] = "cute"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            println("Object has been saved.")
        }
        
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "timerFired:", userInfo: nil, repeats: true)
        
        
        var user = PFUser()
        user.username = "myUsername"
        user.password = "myPassword"
        user.email = "email@example.com"
        // other fields can be set just like with PFObject
        user["phone"] = "415-392-0202"
        
        user.signUpInBackgroundWithBlock({
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo?["error"] as? NSString
                // Show the errorString somewhere and let the user try again.
            } else {
                // Hooray! Let them use the app now.
                println("yay signed up")
            }
        })
        
    
//        query.findObjectsInBackgroundWithBlock({
//             (objects: [AnyObject]?, error: NSError?) -> Void in
//            
//            
//            // The find succeeded.
//            println("Successfully retrieved \(objects!.count) scores.")
//            // Do something with the found objects
//            if let objects = objects as? [PFObject] {
//                for object in objects {
//                    println(object.objectId)
//                }
//            }
//            
//        })
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        let mvc = UIViewController()
        let navController = UINavigationController(rootViewController: mvc)
        navController.navigationBar.barTintColor = UIColor(hex: "#E3001C")
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
        
        
        return true
    }
    
    
    func timerFired(sender: NSTimer) {
        var query = PFQuery(className:"TestObject")
        query.getObjectInBackgroundWithId("frWXqYGCYv", block: { (obj: PFObject?, error: NSError?) -> Void in
            println(obj)
        })
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

