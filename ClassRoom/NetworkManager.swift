//
//  NetworkManager.swift
//  ClassRoom
//
//  Created by Igor Provorov on 3/24/20.
//  Copyright © 2020 Vadim Zhuk. All rights reserved.
//
// swiftlint:disable all


import Foundation

class NetworkManager {
    func fetchData() {
        let session = URLSession.shared
        //let url = URL(string:"https://swapi.co/api/people/")
        guard let  url = URL(string:"https://swapi.co/api/people/") else { return}

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
       // guard let uri = url else { return  }
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return}
            guard  error == nil else { return}
            guard  let response = response as? HTTPURLResponse,(200...299).contains(response.statusCode) else {return}
            do {
//                let json = try JSONSerialization.jsonObject(with: data, options: [])
//                print(json)
                let json = try JSONDecoder().decode(StarWarsPeople.self, from: data)
                json.people.forEach {
                    print($0.name)
                }
            } catch {
                
            }
            
        }
        task.resume()
    }
}

struct StarWarsPeople:Codable {
    let count: Int
    let next: String
    let people: [SWChar]
    
    enum CodingKeys: String,CodingKey {
        case count
        case next
        case people = "results"
    }
    
}

struct SWChar:Codable {
    let name: String
    
    
}
