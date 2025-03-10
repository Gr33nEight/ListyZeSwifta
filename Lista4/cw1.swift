//
//  ContentView.swift
//  Lista4
//
//  Created by Natanael Jop on 24/02/2025.
//

import SwiftUI

struct Cw1View: View {
    @State var showed = false
    var body: some View {
        VStack {
            Button {
                showed.toggle()
            } label: {
                Text("Go to Maroon View")
            }.padding()
            .background(Color.pink)
            .foregroundStyle(.white)
            .cornerRadius(10)

        }
        .padding()
        .sheet(isPresented: $showed) {
            VStack {
                Button {
                    showed.toggle()
                } label: {
                    Text("Click to Iron View")
                }
                .padding()
                .background(Color.gray)
                .foregroundStyle(.white)
                .cornerRadius(10)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.pink)
        }
    }
}

#Preview {
    Cw1View()
}
