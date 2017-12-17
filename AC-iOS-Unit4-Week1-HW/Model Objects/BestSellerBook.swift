//
//  BestSellerBook.swift
//  AC-iOS-Unit4-Week1-HW
//
//  Created by C4Q on 12/16/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

/// https://api.nytimes.com/svc/books/v3/lists.json?api-key=99f973e47a244b3a8ee6b95a632550ae&list=Hardcover-Fiction

struct BestSellerBookWrapper: Codable {
    let results: [BestSellerBook]
}

struct BestSellerBook: Codable {
    let listName: String
    let displayName: String
    let weeksOnList: Int
    let isbns: [ISBNNum]
    let bookDetails: [Detail]
    
    enum CodingKeys: String, CodingKey {
        case listName = "list_name"
        case displayName = "display_name"
        case weeksOnList = "weeks_on_list"
        case isbns
        case bookDetails = "book_details"
    }
}

struct ISBNNum: Codable {
    let isbn10: String
    let isbn13: String
}

struct Detail: Codable {
    let title: String
    let description: String /// SHORT DESCRIPTION
    let contributor: String
    let author: String
}

