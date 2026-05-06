//
//  BookModel.swift
//  FinalProject
//
//  Created by Kinley Cummins on 5/5/26.
//

import Foundation

// Using the search.json endpoint to look for books by subject
// which returns an array of books
struct BookSearchResponse: Decodable{
    let docs: [BookModel]
}

// I only included the fields I wanted to use
// This is going to match one book object in the docs array
struct BookModel: Decodable, Identifiable {
    let key: String
    let title: String
    let author_name: [String]? // Needs to match the JSON data - brackets since it returns an array and ? for nullable
    let first_publish_year: Int?
    let cover_i: Int? // Cover images have a seperate url, the id returned is what goes on the end of the url
    let subject: [String]?
    
    // Identifiable needed for swiftUI to loop over the books
    var id: String { key }
    
    // Just listing the first author (if many) or returning unknown author if null
    var primaryAuthor: String {
        author_name?.first ?? "Unknown Author"
    }
    
    // Getting the cover from the cover image URL and utlizing the cover id from above
    var coverURL: URL? {
        guard let coverId = cover_i
        else {return nil}
        return URL(string: "https://covers.openlibrary.org/b/id/\(coverId)-L.jpg")
    }
    
    // Returning our subjects as readable strings
    var subjectSummary: String {
        guard let subjects = subject, !subjects.isEmpty
        else {return "No subjects listed"}
        return subjects.prefix(5).joined(separator: ", ")
    }
}
