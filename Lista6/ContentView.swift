//
//  ContentView.swift
//  Lista6
//
//  Created by Natanael Jop on 24/02/2025.
//

import SwiftUI

struct ContentView: View {
    @State var showHomeView = false
    @State var counter = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack {
            if showHomeView {
                HomeView()
            }else{
                SplashScreen()
            }
        }.onReceive(timer) { timer in
            counter += 1
            if counter >= 3 {
                showHomeView = true
            }
        }
        .animation(.easeInOut, value: showHomeView)
    }
}

struct SplashScreen: View {
    var body: some View {
        Image(.guy1)
            .resizable()
            .scaledToFit()
    }
}

#Preview {
    SplashScreen()
}

struct HomeView: View {
    @State var currentIdx = 0
    @State var counter = 0
    let allImages: [ImageResource] = [.guy1, .guy2, .guy3, .guy4, .guy5]
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack {
            TabView(selection: $currentIdx) {
                ForEach(0..<allImages.count, id:\.self) { idx in
                    Image(allImages[idx])
                        .resizable()
                        .scaledToFill()
                }
            }.tabViewStyle(.page(indexDisplayMode: .always))
                .frame(height: 300)
        }
        .onReceive(timer) { time in
            counter += 1
            
            if counter % 5 == 0 {
                currentIdx += currentIdx > allImages.count ? -(allImages.count+1) : 1
            }
        }
        .animation(.default, value: currentIdx)
    }
}


#Preview {
    ContentView()
}
