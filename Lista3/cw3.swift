//
//  cw3.swift
//  Lista3
//
//  Created by Natanael Jop on 24/02/2025.
//

import SwiftUI

struct Cw3View: View {
    let iphones = [
        "iPhone 12",
        "iPhone 12 Pro",
        "iPhone 12 Pro Max",
        "iPhone 12 Mini",
        "iPhone 13",
        "iPhone 13 Pro",
        "iPhone 13 Pro Max",
        "iPhone 13 Mini",
    ]
    var body: some View {
        List(iphones, id: \.self) { iphone in
            Text(iphone)
        }
    }
}

#Preview {
    Cw3View()
}
