//
//  ContentView.swift
//  Calculator
//
//  Created by Gaurav Semwal on 05/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.pink.opacity(0.3), .purple.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            KeyView()
        }
    }
}

#Preview {
    ContentView()
}
