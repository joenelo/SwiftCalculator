//
//  AppDelegate.swift
//  SwiftCalculator
//
//  Created by joseph nelson on 2018-04-16.
//  Copyright © 2018 joseph nelson. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
}
@IBDesignable
class RoundButtons: UIButton {
    @IBInspectable var roundButton:Bool = false {
        didSet {
            if roundButton {
                layer.cornerRadius = frame.height/2
                
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = frame.height/2
        }
    }
}

