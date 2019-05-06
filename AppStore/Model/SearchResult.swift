//
//  SearchResult.swift
//  AppStore
//
//  Created by Ibrahim Salah on 5/6/19.
//  Copyright © 2019 Ibrahim Salah. All rights reserved.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount:Int
    let results :[Result]
}

struct Result: Decodable {
    let trackName : String
    let primaryGenreName: String
    let averageUserRating: Float?
    let artworkUrl100: String // app image icon
    let screenshotUrls: [String]
}
