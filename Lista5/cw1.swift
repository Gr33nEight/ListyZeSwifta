//
//  ContentView.swift
//  Lista5
//
//  Created by Natanael Jop on 24/02/2025.
//

import SwiftUI
import UserNotifications

struct Cw1View: View {
    var body: some View {
        VStack {
            Button {
                sendNotification()
            } label: {
                Text("Click me")
            }.buttonStyle(.borderedProminent)

        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.purple)
            .onAppear {
                requestPermission()
            }
    }
    
    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("All set!")
            }else if let error {
                print(error.localizedDescription)
            }
        }
    }
    func sendNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Przypominajka"
        content.subtitle = "Spotkanie za 20 minut"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}

#Preview {
    Cw1View()
}
