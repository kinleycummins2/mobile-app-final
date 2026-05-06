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
//                I wasn't able to put my views directly in here, so they are delcared toward the bottom of the file
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
                        .tint(.pink)
                        .padding()
                    }
                }
                .navigationTitle("Book Browse")
            }
//        sets this stack to only show once the books are loaded in
            .onAppear {
                if viewModel.books.isEmpty{
                    viewModel.fetchBooks()
                    hasLoaded = true
                }
            }
        }
//    views I mentioned above
//    this is the one that shows when its loading
        private var loadingView: some View {
            VStack(spacing: 16) {
                ProgressView()
                    .scaleEffect(1.4)
                Text("Finding books...")
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
//    this view shows when an error appears (looks very pretty because I may of spent a while looking at an error..)
        private var errorView: some View {
            VStack(spacing: 16) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.system(size: 44))
                    .foregroundColor(.orange)
                Text(viewModel.errorMessage)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
//                Same button as before, the generate new books button
                Button {
                    viewModel.fetchBooks()
                } label: {
                    Label("Generate New Books", systemImage: "arrow.clockwise")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .tint(.pink)
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
// View for the actual booklist, shows them in a v stack manner
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
