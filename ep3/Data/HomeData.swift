//
//  Home.swift
//  ep3
//
//  Created by user213622 on 6/17/23.
//

import Foundation

typealias Heroes = [Heroe]

struct Heroe: Decodable {
    let name: String
    let biography: Biography
    let image: Image
    
    enum CodingKeys: String, CodingKey {
        case name
        case biography
        case image
    }
}
    
    //nombre completo
struct Biography: Decodable {
    let fullname: String
        
    enum CodingKeys: String, CodingKey {
        case fullname = "full-name"
    }
}
    
    //url de imagen
struct Image: Decodable {
    let url: String
        
    enum CodingKeys: String, CodingKey {
        case url
    }
}
    
    //estructura principal
struct HeroeWrapper: Decodable {
    let heroes: Heroes
        
    enum CodingKeys: String, CodingKey  {
        case heroes = "results"
    }
}

