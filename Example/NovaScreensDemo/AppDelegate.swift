//
//  AppDelegate.swift
//  NovaScreensDemo
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var second: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        return true
    }

    func applicationDidBecomeActive(application: UIApplication) {
        application.startScreenNotifications()
    }
}

extension AppDelegate: UIApplicationScreenDelegate {
    
    func application(application: UIApplication, didConnectScreen screen: UIScreen) {
        if second == nil {
            print("Second Screen Connected")
            second = UIWindow(frame: screen.bounds)
            second!.screen = screen
            second!.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Second")
            second!.hidden = false
        }
    }
    
    func application(application: UIApplication, didDisconnectScreen screen: UIScreen) {
        if second?.screen === screen {
            print("Second Screen Disconnected")
            second?.hidden = true
            second?.rootViewController = nil
            second = nil
        }
    }
    
}