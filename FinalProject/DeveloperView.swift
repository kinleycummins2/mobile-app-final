//
//  DeveloperView.swift
//  FinalProject
//
//  Created by Kinley Cummins on 5/5/26.
//

import SwiftUI

struct DeveloperView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
 
                    Group {
//                        Was going to maybe use this as a fallback and make an actual image appear instead, but had a lot of issues doing that 
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .foregroundColor(.pink)
                        }
                    }
                    .frame(width: 120, height: 120)
                    .shadow(radius: 6)
                    .padding(.top, 12)
 
                    // Info rows built from the enum
                    VStack(spacing: 14) {
                        ForEach(DeveloperInfo.allCases, id: \.self) { info in
                            HStack(spacing: 16) {
                                Image(systemName: info.icon)
                                    .foregroundColor(.pink)
                                    .frame(width: 28)
 
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(info.label)
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                    Text(info.value)
                                        .font(.subheadline)
                                }
 
                                Spacer()
                            }
                            .padding()
                            .background(Color.pink.opacity(0.30)) // wanted a lighter pink
                            .cornerRadius(12)
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Developer")
        }
    }

#Preview {
    DeveloperView()
}
