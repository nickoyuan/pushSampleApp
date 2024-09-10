//
//  NotificationManager.swift
//  pushNotificationTest
//
//  Created by Zi Fan on 10/9/2024.
//
import UserNotifications
import Combine
import UIKit // Ensure UIKit is imported

class NotificationManager: ObservableObject {
    static let instance = NotificationManager() // Singleton pattern
    @Published var pushToken: String = "" // Add this to store the push token
    // Published property to notify the view when the message changes
    @Published var notificationMessage: String = ""
    
    func requestAuthorization(completion: @escaping (String) -> Void) {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        
        UNUserNotificationCenter.current().requestAuthorization(options: options) { granted, error in
            if let error = error {
                completion("Error: \(error.localizedDescription)")
            } else if granted {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                    completion("Push notification permission granted")
                }
            } else {
                completion("Push notification permission denied")
            }
        }
    }
    
    // Method to handle background tasks or updates when notification is received
    func handleSilentNotification() {
        // Update the published property to notify views
        DispatchQueue.main.async {
            self.notificationMessage = "Notification received"
        }
    }
    
    // Method to update push token
    func updatePushToken(_ token: String) {
        DispatchQueue.main.async {
            self.pushToken = token
        }
    }
}
