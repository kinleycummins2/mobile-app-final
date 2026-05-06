//
//  ContentView.swift
//  FinalProject
//
//  Created by Kinley Cummins on 5/5/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            BrowseView()
                .tabItem{
                    Label("Browse", systemImage: "books.vertical.fill")
                }
            DeveloperView()
                .tabItem{
                    Label("Developer", systemImage: "person.fill")
                }
            APIInfoView()
                .tabItem{
                    Label("API Info", systemImage: "antenna.radiowaves.left.and.right")
                }
        }
    }
}

#Preview {
    ContentView()
}
