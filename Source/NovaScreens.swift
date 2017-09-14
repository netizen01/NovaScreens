//
//  NovaScreens.swift
//

import UIKit

public protocol UIApplicationScreenDelegate: UIApplicationDelegate {

    func application(_ application: UIApplication, didConnectScreen screen: UIScreen)
    func application(_ application: UIApplication, didDisconnectScreen screen: UIScreen)

}

extension UIApplication {

    public func startScreenNotifications() {
        OperationQueue.main.addOperation {
            if UIScreen.screens.count > 1 {
                for screen in UIScreen.screens {
                    if screen !== UIScreen.main {
                        self.applicationDidConnectScreen(screen)
                    }
                }
            }

            let center = NotificationCenter.default
            
            // Clear out existing notification observers to prevent multiple entries
            center.removeObserver(self, name: NSNotification.Name.UIScreenDidConnect, object: nil)
            center.removeObserver(self, name: NSNotification.Name.UIScreenDidDisconnect, object: nil)
            
            center.addObserver(self, selector: #selector(UIApplication.screenDidConnectNotification(_:)), name: NSNotification.Name.UIScreenDidConnect, object: nil)
            center.addObserver(self, selector: #selector(UIApplication.screenDidDisconnectNotification(_:)), name: NSNotification.Name.UIScreenDidDisconnect, object: nil)
        }
    }
    
    public func stopScreenNotifications() {
        let center = NotificationCenter.default
        center.removeObserver(self, name: NSNotification.Name.UIScreenDidConnect, object: nil)
        center.removeObserver(self, name: NSNotification.Name.UIScreenDidDisconnect, object: nil)
    }

}

// Private Extension Functions
extension UIApplication {
    
    @objc func screenDidConnectNotification(_ notification: Notification) {
        if let screen = notification.object as? UIScreen {
            applicationDidConnectScreen(screen)
        }
    }

    @objc func screenDidDisconnectNotification(_ notification: Notification) {
        if let screen = notification.object as? UIScreen {
            applicationDidDisconnectScreen(screen)
        }
    }

    func applicationDidConnectScreen(_ screen: UIScreen) {
        if let delegate = delegate as? UIApplicationScreenDelegate {
            delegate.application(self, didConnectScreen: screen)
        }
    }

    func applicationDidDisconnectScreen(_ screen: UIScreen) {
        if let delegate = delegate as? UIApplicationScreenDelegate {
            delegate.application(self, didDisconnectScreen: screen)
        }
    }
    
}
