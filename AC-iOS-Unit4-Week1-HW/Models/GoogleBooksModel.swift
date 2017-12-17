//
//  GoogleBooksModel.swift
//  AC-iOS-Unit4-Week1-HW
//
//  Created by C4Q on 12/16/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

//Endpoint 3
//https://www.googleapis.com/books/v1/volumes?q=+isbn:0385514239

//Example
//https://www.googleapis.com/books/v1/volumes?q=+isbn:0385514239

//let apiKey = "AIzaSyD1fwxd2uoPzrrhizy4-wANHEvViVmaOSE"

struct GoogleBooksWrapper: Codable {
    var items: [GoogleBooks]
}

struct GoogleBooks: Codable  {
    var volumeInfo: [BookInfo]
}

struct BookInfo: Codable {
    var title: String
    var subtitle: String?
    var authors: [String]
    var summary: String //This is the summary
    var imageLinks: ImageWrapper
    var allAuthors: String {
        var authorString = ""
        for authors in authors {
            authorString.append(authors)
        }
        return authorString
    }
}

struct ImageWrapper: Codable {
    var smallThumbnail: String
    var thumbnail: String
}
