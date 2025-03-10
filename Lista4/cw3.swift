//
//  cw3.swift
//  Lista4
//
//  Created by Natanael Jop on 24/02/2025.
//

import SwiftUI

struct Cw3View: View {
    var body: some View {
        TabView {
            Cw3TopRatedView()
            Cw3BookmarksView()
            Cw3ContactsView()
        }
    }
}

struct Cw3TopRatedView: View {
    var body: some View {
        Text("Top Rated")
            .tabItem({
                Label("Top Rated", systemImage: "star.fill")
            })
            .tag(0)
    }
}

struct Cw3BookmarksView: View {
    var body: some View {
        Text("Bookmarks")
            .tabItem({
                Label("Bookmarks", systemImage: "book.fill")
            })
            .tag(1)
    }
}

struct Cw3ContactsView: View {
    var body: some View {
        Text("Contacts")
            .tabItem({
                Label("Contacts", systemImage: "person.circle.fill")
            })
            .tag(2)
    }
}

#Preview {
    Cw3View()
}
