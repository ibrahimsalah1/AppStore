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
    let trackId: Int?
    let trackName : String?
    let primaryGenreName: String?
    let averageUserRating: Float?
    let artworkUrl100: String? // app image icon
    let artworkUrl512: String?
    let screenshotUrls: [String]?
    let userRatingCount: Int?
    let formattedPrice:String?
    let releaseNotes:String?
    let description:String?
    let version:String?
    let price: Double?
    let collectionName : String?
}
