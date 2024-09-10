//
//  pushNotificationTestApp.swift
//  pushNotificationTest
//
//  Created by Zi Fan on 10/9/2024.
//

import SwiftUI

@main
struct pushNotificationTestApp: App {
    // Use @UIApplicationDelegateAdaptor to link the AppDelegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
