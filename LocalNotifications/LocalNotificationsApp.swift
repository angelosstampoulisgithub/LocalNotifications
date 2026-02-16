//
//  LocalNotificationsApp.swift
//  LocalNotifications
//
//  Created by Angelos Staboulis on 17/2/26.
//

import SwiftUI
final class NotificationDelegate: NSObject, UNUserNotificationCenterDelegate {
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        completionHandler([.banner, .sound])
    }
}

@main
struct LocalNotificationsApp: App {
    private let delegate = NotificationDelegate()

    init() {
        UNUserNotificationCenter.current().delegate = delegate
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    await NotificationManager.shared.requestAuthorization()
                }
        }
    }
}
