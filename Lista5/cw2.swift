//
//  cw2.swift
//  Lista5
//
//  Created by Natanael Jop on 24/02/2025.
//

import SwiftUI


struct Cw2View: View {
    @State private var alertType: AlertType?
    @State private var showActionSheet = false
    
    enum AlertType: Identifiable {
        case uwaga, signOut
        
        var id: Int {
            switch self {
            case .uwaga: return 1
            case .signOut: return 2
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 30) {
            Button("Show Action Sheet") {
                showActionSheet = true
            }
            .actionSheet(isPresented: $showActionSheet) {
                ActionSheet(title: Text("Error"), message: Text("Co chcesz zrobić?"), buttons: [
                    .default(Text("Approve"), action: { print("User clicked Approve button") }),
                    .default(Text("Edit"), action: { print("User clicked Edit button") }),
                    .destructive(Text("Delete"), action: { print("User clicked Delete button") }),
                    .cancel(Text("Dismiss"), action: { print("User clicked Dismiss button") })
                ])
            }
            
            Button("Show Uwaga Alert") {
                alertType = .uwaga
            }
            Button("Show Sign Out Alert") {
                alertType = .signOut
            }
            .alert(item: $alertType) { type in
                switch type {
                case .signOut:
                    return Alert(
                        title: Text("Sign out?"),
                        message: Text("You can always access your content by signing back in"),
                        primaryButton: .destructive(Text("Sign out"), action: { print("User clicked Sign out") }),
                        secondaryButton: .cancel(Text("Cancel"))
                    )
                case .uwaga:
                    return Alert(title: Text("Uwaga"), message: Text("Jesteś obiektem moich paczań."), dismissButton: .default(Text("OK")))
                }
            }
        }.buttonStyle(.borderedProminent)
        .padding()
    }
}

#Preview {
    Cw2View()
}
