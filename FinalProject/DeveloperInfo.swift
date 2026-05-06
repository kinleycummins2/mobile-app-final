//
//  DeveloperInfo.swift
//  FinalProject
//
//  Created by Kinley Cummins on 5/5/26.
//

import Foundation

enum DeveloperInfo: CaseIterable{
    case name
    case favbook
    case major
    case summary

    
    var label: String {
        switch self {
        case .name: "Name"
        case .favbook: "Favorite Series"
        case .major: "Major"
        case .summary: "Summary"

        }
    }
    
    var value: String {
        switch self {
        case .name: "Kinley Cummins"
        case .favbook: "Any of the books from The Hunger Games universe... but Catching Fire holds a special place in my heart!"
        case .major: "Computer Information Science"
        case .summary: "This app was created with intention of being a final project for the course Mobile App Development. It is a app that utliizes the OpenLibrary API by getting 5 random books from 5 different genres. From there, the user can select a book to view more detail about it or randomize the books again."

        }
    }
    
    var icon: String{
        switch self{
        case .name: "person.fill"
        case .favbook: "books.vertical.fill"
        case .major: "laptopcomputer"
        case .summary: "doc.text.fill"
        }
    }
}
