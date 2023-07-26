//
//  HomeServices.swift
//  ep3
//
//  Created by user213622 on 6/17/23.
//

import Foundation

protocol HomeServiceProtocol {
    func getCategories(url: String, completion: @escaping (_ success: Bool, _ data: Heroes?, _ error: String?) -> () )
}

class HomeServices: HomeServiceProtocol {
    func getCategories(url: String, completion: @escaping (Bool, Heroes?, String?) -> ()) {
        HttpRequest().GET(url: url) { success, data in
            if success {
                do {
                    let heroWrapper = try JSONDecoder().decode(HeroWrapper.self, from: data!)
                    completion(true, heroWrapper.heroes, nil)
                } catch (let error) {
                    completion(false, nil, error.localizedDescription)
                }
            } else {
                completion(false, nil, "Error: Categories GET request failed")
            }
        }
    }
}

