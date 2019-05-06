//
//  Service.swift
//  AppStore
//
//  Created by Ibrahim Salah on 5/6/19.
//  Copyright © 2019 Ibrahim Salah. All rights reserved.
//

import Foundation
class Serivce {
    static let shared =  Serivce() // singletone
    
    
    // fetch search results
    func fetchApps(serachTerm: String,completion: @escaping ([Result], Error?) -> ()){
        let urlString = "https://itunes.apple.com/search?term=\(serachTerm)&entity=software"
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.dataTask(with:url) { (data, response, error) in
            if let error = error {
                completion([], error)
                return
            }
            
            if let data = data {
                do{
                    let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                    completion(searchResult.results, nil)
                } catch {
                    print("Can not decode json!", error)
                    completion([], error)
                }
                
            }
            }.resume()
    }
}
