//
//  APIInfoView.swift
//  FinalProject
//
//  Created by Kinley Cummins on 5/5/26.
//

import SwiftUI

struct APIInfoView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
 
                    Image(systemName: "antenna.radiowaves.left.and.right")
                        .font(.system(size: 60))
                        .foregroundColor(.accentColor)
                        .padding(.top, 24)
 
                    infoCard(title: "API Name",    value: "Open Library Search API")
                    infoCard(title: "Website",     value: "openlibrary.org")
                    infoCard(title: "Endpoint",    value: "openlibrary.org/search.json")
                    infoCard(title: "Requires Key",value: "No")
                    // TODO: replace with your real name
                    infoCard(title: "Developer",   value: "Kinley Cummins")
                }
                .padding()
            }
            .navigationTitle("API Info")
//            .navigationBarTitleDisplayMode(.large)
        }
    }
 
    private func infoCard(title: String, value: String) -> some View {
        HStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text(value)
                    .font(.subheadline)
            }
            Spacer()
        }
        .padding()
        .background(.secondary)
        .cornerRadius(12)
    }
}

#Preview {
    APIInfoView()
}
