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
                        .foregroundColor(.pink)
                        .padding(.top, 24)
 
                    infoCard(title: "API Name",value: "Open Library Search API")
                    infoCard(title: "Website",value: "openlibrary.org")
                    infoCard(title: "Endpoint",value: "openlibrary.org/search.json")
                    infoCard(title: "Requires Key",value: "No")
                    infoCard(title: "Developer",value: "Kinley Cummins")
                }
                .padding()
            }
            .navigationTitle("API Info")
        }
    }
// didn't use an enum here, just put the values in above because I wanted to try it like this
//    this is the function for the info card styling and layout
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
        .background(Color.pink.opacity(0.30)) //wanted a lighter pink
        .cornerRadius(12)
    }
}

#Preview {
    APIInfoView()
}
