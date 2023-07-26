//
//  HeroServices.swift
//  ep3
//
//  Created by user213622 on 6/17/23.
//

import Foundation

protocol HeroServiceProtocol {
    func getHero(url: String, completion: @escaping (_ success: Bool, _ data: Heros?, _ error: String?)->())
}

class HeroService: HeroServiceProtocol {
    func getHero(url: String, completion: @escaping (Bool, Heros?, String?) -> ()) {
        HttpRequest().GET(url: url) { success, data in
            if success {
                do {
                    let HeroWrapper = try JSONDecoder().decode(HeroeWrapper.self, from: data!)
                    completion(true, HeroWrapper.heroes, nil)
                } catch (let error) {
                    completion(false, nil, error.localizedDescription)
                }
            } else {
                completion(false, nil, "Error: Meal GET request failed")
            }

        }
    }
}
