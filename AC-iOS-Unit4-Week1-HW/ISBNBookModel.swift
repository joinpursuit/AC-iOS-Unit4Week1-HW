//
//  ISBNBook.swift
//  AC-iOS-Unit4-Week1-HW
//
//  Created by Masai Young on 12/14/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

class ISBNAPIClient {
    private init() {}
    static let manager = ISBNAPIClient()
    
    private var isbnBooks = [ISBNBook]()
    
    func addISBNbook(book: ISBNBook) {
        isbnBooks.append(book)
    }
    
    func getISBNbooks() -> [ISBNBook] {
        return isbnBooks
    }
    
    func removeISBNbooks() {
        isbnBooks = [ISBNBook]()
    }
    
    func fetchISBNBook(from urlStr: String, completionHandler: @escaping (ISBNBook) -> Void, errorHandler: (Error) -> Void) {
        guard let url = URL(string: urlStr) else {return}
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let book = try JSONDecoder().decode(ISBNBook.self, from: data)
                completionHandler(book)
            }
            catch {
                print(error)
            }
        }
        NetworkHelper.manager.performDataTask(with: url,
                                              completionHandler: completion,
                                              errorHandler: {print($0)})
    }
}

struct ISBNBook: Codable {
    let kind: String
    let totalItems: Int
    let items: [Item]?
}

struct Item: Codable {
    let kind: String
    let id: String
    let etag: String
    let selfLink: String
    let volumeInfo: VolumeInfo
    let searchInfo: SearchInfo
}

struct VolumeInfo: Codable {
    let title: String
    let authors: [String]
    let description: String
    let imageLinks: ImageLinks
    let language: String
    let previewLink: String
    let infoLink: String
}


struct ImageLinks: Codable {
    let smallThumbnail: String
    let thumbnail: String
}

struct SearchInfo: Codable {
    let textSnippet: String
}


