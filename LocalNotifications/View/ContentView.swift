//
//  ContentView.swift
//  LocalNotifications
//
//  Created by Angelos Staboulis on 17/2/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Local Notification Demo")
                .font(.title)

            Button("Schedule Notification") {
                NotificationManager.shared.scheduleLocalNotification()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

