//
//  BookDetailGoogleAPIClient.swift
//  AC-iOS-Unit4-Week1-HW
//
//  Created by C4Q on 12/16/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

struct BookDetailGoogleAPIClient {
    private init(){}
    static let shared = BookDetailGoogleAPIClient()
    func getBookDetails(isbn: String,
                        completionHandler: @escaping ([BookWrapper]?) -> Void,
                        errorHandler: @escaping (Error) -> Void) {
//        let myGoogleAPIKey = "AIzaSyB0MSiQ37Z90T23RfL19PQi7YVYoZ4Tnvk"
//        let urlStr = "https://www.googleapis.com/books/v1/volumes?q=isbn:\(isbn)&key=\(myGoogleAPIKey)"
        let urlStr = "https://www.googleapis.com/books/v1/volumes?q=isbn:\(isbn)"
        guard let url = URL(string: urlStr) else {
            errorHandler(AppError.badURL(str: urlStr))
            return
        }
        let request = URLRequest(url: url)
        let googleBookDetails: (Data) -> Void = {(data: Data) in
            do {
                let results = try JSONDecoder().decode(ResultsWrapper.self, from: data)
                guard let json = results.items else {return}
                completionHandler(json)
            }
            catch {
                errorHandler(AppError.codingError(rawError: error))
            }
        }
        NetworkHelper.manager.performDataTask(with: request,
                                              completionHandler: googleBookDetails,
                                              errorHandler: errorHandler)
    }
}
