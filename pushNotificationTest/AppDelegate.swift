//
//  AppDelegate.swift
//  pushNotificationTest
//
//  Created by Zi Fan on 10/9/2024.
//
import UIKit
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    // This method is called when the app finishes launching
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Set up notification delegate to handle notifications in the foreground
        UNUserNotificationCenter.current().delegate = self
        print("AppDelegate didFinishLaunchingWithOptions")
        return true
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        NotificationManager.instance.handleSilentNotification()
    }
    
    // This method is called when the device successfully registers with APNs and receives a device token
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // Convert device token to string format
        let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
        let token = tokenParts.joined()
        
        NotificationManager.instance.updatePushToken(token)
        // You can send this token to your server to register this device for push notifications
    }

    // This method handles notifications delivered when the app is in the foreground
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // Display the notification as a banner and play a sound
        completionHandler([.banner, .sound])
    }

    // This method handles user's interaction with the notification
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        NotificationManager.instance.handleSilentNotification()
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        NotificationManager.instance.updatePushToken(error.localizedDescription)
      }
}
