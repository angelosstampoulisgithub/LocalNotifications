//
//  NotificationManager.swift
//  LocalNotifications
//
//  Created by Angelos Staboulis on 17/2/26.
//

import Foundation
import UserNotifications

@MainActor
final class NotificationManager {
    static let shared = NotificationManager()

    func requestAuthorization() async {
        do {
            let granted = try await UNUserNotificationCenter.current()
                .requestAuthorization(options: [.alert, .sound, .badge])

            print("Permission granted:", granted)
        } catch {
            print("Error requesting permission:", error)
        }
    }
}
extension NotificationManager {
    func scheduleLocalNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Hello Angelos"
        content.body = "This is your local notification."
        content.sound = .default

        // Trigger after 5 seconds
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)

        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )

        UNUserNotificationCenter.current().add(request)
    }
}
