//
//  BrowseView.swift
//  FinalProject
//
//  Created by Kinley Cummins on 5/5/26.
//

import SwiftUI

struct BrowseView: View {
    @StateObject private var viewModel = BookViewModel()
    // tracking if the list has been loaded, i used it for only showing the button after initial load
    @State private var hasLoaded: Bool = false
    var body: some View {
        NavigationStack{
            VStack(spacing: 0){
                Group{
                    if viewModel.isLoading{
                        loadingView
                    } else if !viewModel.errorMessage.isEmpty{
                        errorView
                    } else {
                        bookList
                    }
                }
                    
                    // Button for generating new books
                    if hasLoaded && !viewModel.isLoading {
                        Button{
                            viewModel.fetchBooks()
                        } label: {
                            Label("Generate New Books", systemImage: "arrow.clockwise")
                                .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.borderedProminent)
                        .padding()
                    }
                }
                .navigationTitle("Book Browse")
            }
            .onAppear {
                if viewModel.books.isEmpty{
                    viewModel.fetchBooks()
                    hasLoaded = true
                }
            }
        }
        private var loadingView: some View {
            VStack(spacing: 16) {
                ProgressView()
                    .scaleEffect(1.4)
                Text("Finding books...")
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        private var errorView: some View {
            VStack(spacing: 16) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.system(size: 44))
                    .foregroundColor(.orange)
                Text(viewModel.errorMessage)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                Button {
                    viewModel.fetchBooks()
                } label: {
                    Label("Generate New Books", systemImage: "arrow.clockwise")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        private var bookList: some View {
            List(viewModel.books) { book in
                NavigationLink(destination: BookDetailView(book: book)) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(book.title)
                            .font(.headline)
                            .lineLimit(2)
                        Text(book.primaryAuthor)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 4)
                }
            }
            .listStyle(.plain)
        }
    }

#Preview {
    BrowseView()
}
