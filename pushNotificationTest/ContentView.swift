//
//  ContentView.swift
//  pushNotificationTest
//
//  Created by Zi Fan on 10/9/2024.
//

import SwiftUI


struct ContentView: View {
    @StateObject private var notificationManager = NotificationManager.instance
    @State private var message: String = ""
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Push notification test for Team Echo")
            Button("Request push permission") {
                NotificationManager.instance.requestAuthorization { response in
                    message = response
                }
            }
            if !message.isEmpty {
                Text(message).foregroundColor(.green).padding()
            }
            if !notificationManager.pushToken.isEmpty {
                        Text("Push Token: " + notificationManager.pushToken)
                            .foregroundColor(.orange)
                            .padding()
                    }
            if !notificationManager.notificationMessage.isEmpty {
                Text("reiceived Notification " + notificationManager.notificationMessage).foregroundColor(.blue).padding().textSelection(.enabled)
                   }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
