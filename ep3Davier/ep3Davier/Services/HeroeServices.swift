//
//  HeroeServices.swift
//  ep3Davier
//
//  Created by user213622 on 6/19/23.
//

import Foundation

protocol HeroeServiceProtocol {
    func getHeroes(url: String, completion: @escaping (_ success: Bool, _ data: Heroes?, _ error: String?) -> () )
}

class HeroeService: HeroeServiceProtocol {
    func getHeroes(url: String, completion: @escaping (Bool, Heroes?, String?) -> ()) {
        HttpRequest().GET(url: url) { success, data in
            if success {
                do {
                    let heroeWrapper = try JSONDecoder().decode(HeroeWrapper.self, from: data!)
                    completion(true, HeroeWrapper.heroes, nil)
                } catch (let error) {
                    completion(false, nil, error.localizedDescription)
                }
            } else {
                completion(false, nil, "Error: Heroe GET request failed")
            }
        }
    }
    
    
}
