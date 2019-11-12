//
//  AppDelegate.swift
//  AdvancedSample
//
//  Created by Wayne Burkett on 11/12/19.
//  Copyright © 2019 ForeSee. All rights reserved.
//

import UIKit
import ForeSee

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    ForeSee.setDebugLogEnabled(true)
    ForeSee.start()
    ForeSee.setSkipPoolingCheck(true)
    ForeSee.resetState()
    return true
  }

}

