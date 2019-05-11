//
//  Review.swift
//  AppStore
//
//  Created by Ibrahim Salah on 5/10/19.
//  Copyright © 2019 Ibrahim Salah. All rights reserved.
//

import Foundation
struct Review: Decodable {
    let feed: ReviewFeed
    
}

struct ReviewFeed : Decodable {
    let entry: [Entry]
    
}
struct Entry : Decodable {
    let author:Author
    let title :Name
    let content: Name
    let rating : Name
    
    private enum CodingKeys: String, CodingKey{
        case author, title, content
        case rating = "im:rating"
    }
}
struct Author: Decodable {
    let name : Name
}
struct Name : Decodable{
    let label : String
}
