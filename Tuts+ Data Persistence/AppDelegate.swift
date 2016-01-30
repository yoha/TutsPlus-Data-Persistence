//
//  AppDelegate.swift
//  Tuts+ Data Persistence
//
//  Created by Yohannes Wijaya on 1/30/16.
//  Copyright © 2016 Yohannes Wijaya. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        print(NSHomeDirectory())
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        userDefaults.setBool(true, forKey: "key1")
        userDefaults.setInteger(123, forKey: "key2")
        userDefaults.setObject("hello world", forKey: "key3")
        userDefaults.setObject([5, 4, 3, 2, 1], forKey: "key4")
        
        userDefaults.boolForKey("key1")
        userDefaults.integerForKey("key2")
        userDefaults.objectForKey("key3")
        userDefaults.objectForKey("key4")
        
        userDefaults.synchronize()
       
        let documentDirectory = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        if let validDocumentDirectory = documentDirectory.first, let validDocumentDirectoryUrl = NSURL(string: validDocumentDirectory) {

            let fruitsUrl = validDocumentDirectoryUrl.URLByAppendingPathComponent("fruits.plist")
            let dictionaryUrl = validDocumentDirectoryUrl.URLByAppendingPathComponent("dictionary.plist")
            
            let fruits = ["Apple", "Mango", "Pineapple"] as NSArray
            let dictionary = ["anArray": fruits, "aNumber": 43210, "aBoolean": true] as NSDictionary
            
            guard let validFruitsUrl = fruitsUrl.path, let validDictionaryUrl = dictionaryUrl.path else { return true }
            fruits.writeToFile(validFruitsUrl, atomically: true)
            dictionary.writeToFile(validDictionaryUrl, atomically: true)
            
            guard let validLoadedFruits = NSArray(contentsOfURL: fruitsUrl) else { return true }
            print(validLoadedFruits)
            
            if let validLoadedDictionaries = NSArray(contentsOfURL: dictionaryUrl) {
                print(validLoadedDictionaries)
            }
        }
        
        return true
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

