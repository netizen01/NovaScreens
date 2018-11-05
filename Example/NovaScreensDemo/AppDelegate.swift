//
//  AppDelegate.swift
//  NovaScreensDemo
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var second: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        application.startScreenNotifications()
    }
}

extension AppDelegate: UIApplicationScreenDelegate {
    
    func application(_ application: UIApplication, didConnectScreen screen: UIScreen) {
        if second == nil {
            print("Second Screen Connected")
            second = UIWindow(frame: screen.bounds)
            second!.screen = screen
            second!.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Second")
            second!.isHidden = false
        }
    }
    
    func application(_ application: UIApplication, didDisconnectScreen screen: UIScreen) {
        if second?.screen === screen {
            print("Second Screen Disconnected")
            second?.isHidden = true
            second?.rootViewController = nil
            second = nil
        }
    }
    
}
