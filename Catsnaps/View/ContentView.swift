//
//  ContentView.swift
//  Catsnaps
//
//  Created by keet on 10.09.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ChatView()
                .tabItem {
                    Label("Chat", systemImage: "bubble")
                }
            ProfileView()
                .tabItem {
                    Label("You", systemImage: "person")
                }
        }
    }
}

#Preview {
    ContentView()
}
