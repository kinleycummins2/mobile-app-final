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
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .foregroundColor(.accentColor)
                        }
                    }
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.accentColor, lineWidth: 3))
                    .shadow(radius: 6)
                    .padding(.top, 12)
 
                    // Info rows built from the enum
                    VStack(spacing: 14) {
                        ForEach(DeveloperInfo.allCases, id: \.self) { info in
                            HStack(spacing: 16) {
                                Image(systemName: info.icon)
                                    .foregroundColor(.accentColor)
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
                            .background(Color.secondary)
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
