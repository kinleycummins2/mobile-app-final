//
//  BookViewModel.swift
//  FinalProject
//
//  Created by Kinley Cummins on 5/5/26.
//

import SwiftUI

class BookViewModel: ObservableObject {
    @Published var books: [BookModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""
    
    // keeping these same 5 genres
    let genres = ["young_adult", "dystopia", "childrens", "romance", "adventure"]
    
    // function for getting one random book for each genre
    func fetchBooks(){
        books = []
        errorMessage = ""
        isLoading = true
        
        let group = DispatchGroup() // DispatchGroup allows it to wait until all 5 requests are done
        var results: [BookModel] = []
        
//        added a publish year limit because I was getting books from the 1700s
        for genre in genres {
            guard let url = URL(string: "https://openlibrary.org/search.json?subject=\(genre)&publish_year=[1925 TO 9999]&limit=50")
            else{
                continue
            }
            
            group.enter()
            
            URLSession.shared.dataTask(with: url) {data, response, error in
                defer {group.leave()}
                
                if let error = error{
                    print("Request failed for \(genre): \(error.localizedDescription)")
                    return
                }
                
                guard let data = data else {
                    print("No data for \(genre)")
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(BookSearchResponse.self, from: data)
//                    Trying to only pull books with a cover
                    let withCovers = result.docs.filter { $0.cover_i != nil && ($0.first_publish_year ?? 0) >= 1925 }
//                    API doesn't have a random feature, so this is how I'm randomly generating
                    if let pick = withCovers.randomElement() {
                        results.append(pick)
                    }
                } catch {
                    print("Decoding failed for \(genre): \(error)")
                }
                    
            }.resume()
        }
        
        // Updating the UI on the main thread when all 5 requests are done loading
        group.notify(queue: .main){
            self.isLoading = false
            self.books = results
            if results.isEmpty {
                self.errorMessage = "Could not load books. Check your connection and try again!"
            }
        }
    }
}
