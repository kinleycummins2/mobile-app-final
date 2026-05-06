//
//  BookDetailView.swift
//  FinalProject
//
//  Created by Kinley Cummins on 5/5/26.
//

import SwiftUI

struct BookDetailView: View {
    let book: BookModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
 
                // Cover image
                if let url = book.coverURL {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(height: 300)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 300)
                                .cornerRadius(12)
                                .shadow(radius: 8)
                        case .failure:
                            placeholderCover
                        }
                    }
                } else {
                    placeholderCover
                }
 
                // Title
                Text(book.title)
                    .font(.title2)
                    .bold()
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
 
                // Author
                Text("by \(book.primaryAuthor)")
                    .font(.title3)
                    .foregroundColor(.secondary)
 
                // Xcode 26 version
//                Text("First published: \(year)")
//                    .font(.subheadline)
//                    .foregroundColor(.secondary)
                Text("Subject: \(book.subjectSummary)")
                    .foregroundColor(.secondary)
                // Release year
                if let year = book.first_publish_year {
                    Text("First published: \(String(year))")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                } else {
                    Text("Publication year unknown")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
 
                Spacer()
            }
            .padding()
        }
        .navigationTitle(book.title)
//        .navigationBarTitleDisplayMode(.inline)
    }
 
    private var placeholderCover: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color(.systemGray))
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .overlay(
                Image(systemName: "book.closed.fill")
                    .foregroundColor(.secondary)
            )
    }
}

#Preview {
    BookDetailView(book: BookModel(
        key: "/works/OL123W",
        title: "The Name of the Wind",
        author_name: ["Patrick Rothfuss"],
        first_publish_year: 2007,
        cover_i: 8734555,
        subject: ["Fantasy"]
    ))
}
