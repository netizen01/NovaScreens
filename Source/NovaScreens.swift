//
//  NovaScreens.swift
//

import Foundation

public protocol UIApplicationScreenDelegate: UIApplicationDelegate {

    func application(application: UIApplication, didConnectScreen screen: UIScreen)
    func application(application: UIApplication, didDisconnectScreen screen: UIScreen)

}

extension UIApplication {

    public func startScreenNotifications() {
        NSOperationQueue.mainQueue().addOperationWithBlock { () -> Void in
            if UIScreen.screens().count > 1 {
                for screen in UIScreen.screens() {
                    if screen != UIScreen.mainScreen() {
                        self.applicationDidConnectScreen(screen)
                    }
                }
            }

            let center = NSNotificationCenter.defaultCenter()
            center.addObserver(self, selector: #selector(UIApplication.screenDidConnectNotification(_:)), name: UIScreenDidConnectNotification, object: nil)
            center.addObserver(self, selector: #selector(UIApplication.screenDidDisconnectNotification(_:)), name: UIScreenDidDisconnectNotification, object: nil)
        }
    }
    
    public func stopScreenNotifications() {
        let center = NSNotificationCenter.defaultCenter()
        center.removeObserver(self, name: UIScreenDidConnectNotification, object: nil)
        center.removeObserver(self, name: UIScreenDidDisconnectNotification, object: nil)
    }

}

// Private Extension Functions
extension UIApplication {
    
    func screenDidConnectNotification(notification: NSNotification) {
        if let screen = notification.object as? UIScreen {
            applicationDidConnectScreen(screen)
        }
    }

    func screenDidDisconnectNotification(notification: NSNotification) {
        if let screen = notification.object as? UIScreen {
            applicationDidDisconnectScreen(screen)
        }
    }

    func applicationDidConnectScreen(screen: UIScreen) {
        if let delegate = delegate as? UIApplicationScreenDelegate {
            delegate.application(self, didConnectScreen: screen)
        }
    }

    func applicationDidDisconnectScreen(screen: UIScreen) {
        if let delegate = delegate as? UIApplicationScreenDelegate {
            delegate.application(self, didDisconnectScreen: screen)
        }
    }
    
}
