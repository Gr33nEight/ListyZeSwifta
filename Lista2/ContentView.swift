//
//  ContentView.swift
//  Lista2
//
//  Created by Natanael Jop on 24/02/2025.
//

import SwiftUI

struct ContentView: View {
    let phoneNumber = "+48 600 600 600"
    let email = "xyz@google.pl"
    var body: some View {
        VStack(spacing: 20) {
            Text("Contact")
                .font(.title)
            ZStack {
                Image(.guy)
                    .resizable()
                Circle()
                    .stroke(lineWidth: 1)
                    .fill(Color(hex: "#39B44E"))
            }.clipShape(Circle())
                .scaledToFit( )
            .frame(width: UIScreen.main.bounds.width/1.5)
            VStack {
                Text("Jan Kowalski")
                if let url = URL(string: "tel:\(phoneNumber)") {
                    Link("tel: \(phoneNumber)", destination: url)
                }
                Text("www.apple.com")
                if let url = URL(string: "mailto:\(email)") {
                    Link("e-mail: \(email)", destination: url)
                }
                Text("ul. Fabryczna, Wrocław")
            }
        }
        .padding()
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

#Preview {
    ContentView()
}
