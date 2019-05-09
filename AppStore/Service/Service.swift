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
    
    func fetchGames(completion: @escaping (AppsGroup?, Error?) -> ()){
        let urlString = "https://rss.itunes.apple.com/api/v1/en/ios-apps/new-games-we-love/all/50/explicit.json"
        fetchAppGroups(urlString: urlString, completion: completion)
        
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
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error{
                completion(nil, error)
                return
            }
            
            if let data = data {
                do{
                    let appsGroup = try JSONDecoder().decode(AppsGroup.self, from: data)
                    completion(appsGroup, nil)
                } catch {
                    print("Failed to decode json: ", error)
                    completion(nil, error)
                }
            }
            
            
            
            }.resume()
    }
    
    func fetchSocialApps(completion: @escaping ([SocialApp]?, Error?) -> Void){
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error{
                completion(nil, error)
                return
            }
            
            if let data = data {
                do{
                    let socialApps = try JSONDecoder().decode([SocialApp].self, from: data)
                    completion(socialApps, nil)
                } catch {
                    print("Failed to decode json: ", error)
                    completion(nil, error)
                }
            }
            
            
            
            }.resume()
    }
        
}

