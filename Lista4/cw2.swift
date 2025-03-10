//
//  cw2.swift
//  Lista4
//
//  Created by Natanael Jop on 24/02/2025.
//

import SwiftUI

struct Cw2View: View {
    @State var number = 0
    var body: some View {
        NavigationStack {
            NavigationLink {
                Cw2PinkView(number: $number)
            } label: {
                Text("\(number)")
            }.padding()
                .background(Color.pink)
                .foregroundStyle(.white)
                .cornerRadius(10)
        }
    }
}

struct Cw2PinkView: View {
    @Binding var number: Int
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            HStack {
                Text("Pink View")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Spacer()
            }.padding(.top)
            Spacer()
            Text("The counter was tapped \(number) times")
            Spacer()
            Button {
                dismiss()
            } label: {
                Text("Click to Iron View")
            }.padding()
                .background(Color.gray)
                .foregroundStyle(.white)
                .cornerRadius(10)
            Spacer()

        }.padding()
            .navigationBarBackButtonHidden(true)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(alignment: .topLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Iron View")
                    }
                }.foregroundStyle(.white)
                    .padding(.leading)
                    .fontWeight(.semibold)
            }
            .background(Color.pink)
            .onAppear {
                number += 1
            }
    }
}

#Preview {
    Cw2View()
}
