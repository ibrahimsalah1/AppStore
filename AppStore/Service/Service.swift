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
    func fetchApps(serachTerm: String,completion: @escaping (SearchResult?, Error?) -> ()){
        let urlString = "https://itunes.apple.com/search?term=\(serachTerm)&entity=software"
        genericFetchJSONData(urlString: urlString, completion: completion)
    }
    //https://itunes.apple.com/lookup
    func fetchAppDetails(id:String, completion: @escaping (SearchResult?, Error?) -> ()){
        let urlString = "https://itunes.apple.com/lookup?id=\(id)"
        genericFetchJSONData(urlString: urlString, completion: completion)
        
    }
    
    func fetchReview(id:String,completion: @escaping ((Review?, Error?) -> Void)){
         let urlString = "https://itunes.apple.com/rss/customerreviews/page=1/id=\(id)/sortby=mostrecent/json?l=en&cc=us"
        genericFetchJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchGames(completion: @escaping (AppsGroup?, Error?) -> ()){
        let urlString = "https://rss.itunes.apple.com/api/v1/en/ios-apps/new-games-we-love/all/50/explicit.json"
        genericFetchJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchTopFreeApps(completion: @escaping (AppsGroup?, Error?) -> ()){
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/25/explicit.json"
        fetchAppGroups(urlString: urlString, completion: completion)
        
    }
    
    func fetchTopGrossing(completion: @escaping (AppsGroup?, Error?) -> ()){
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/50/explicit.json"
        fetchAppGroups(urlString: urlString, completion: completion)
        
    }
    
    func fetchAppGroups(urlString: String,completion: @escaping (AppsGroup?, Error?)-> Void){
        genericFetchJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchSocialApps(completion: @escaping ([SocialApp]?, Error?) -> Void){
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        genericFetchJSONData(urlString: urlString, completion: completion)
    }
    
    func genericFetchJSONData<T:Decodable>(urlString:String, completion: @escaping (T?, Error?)->Void){
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error{
                completion(nil, error)
                return
            }
            
            if let data = data {
                do{
                    let socialApps = try JSONDecoder().decode(T.self, from: data)
                    completion(socialApps, nil)
                } catch {
                    print("Failed to decode json: ", error)
                    completion(nil, error)
                }
            }
            
            }.resume()
    }
}

