//
//  AppDelegate.swift
//  SimpleMenuKit
//
//  Created by seyhagithub on 03/14/2018.
//  Copyright (c) 2018 seyhagithub. All rights reserved.
//

import UIKit
import SimpleMenuKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
   
   var window: UIWindow?
   
   
   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
      
      window = UIWindow(frame: UIScreen.main.bounds)
      window?.makeKeyAndVisible()
      
      let menuSide = LeftTableViewController()
      let home = ViewController()
      
      let mainViewController = MKWrapperViewController({
         return menuSide
      }, mkHomeViewController: home)
      

      window?.rootViewController = mainViewController
     
      
      return true
   }
   
   
   
}

