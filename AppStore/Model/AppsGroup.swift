//
//  AppsGroup.swift
//  AppStore
//
//  Created by Ibrahim Salah on 5/7/19.
//  Copyright © 2019 Ibrahim Salah. All rights reserved.
//

import Foundation
struct AppsGroup: Decodable {
    let feed : Feed
}

struct Feed : Decodable{
    let title : String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let artistName, name, artworkUrl100: String
}
