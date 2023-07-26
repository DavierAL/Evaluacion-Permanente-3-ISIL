//
//  Heroe.swift
//  ep3Davier
//
//  Created by user213622 on 6/18/23.
//

import Foundation

typealias Heroes = [Heroe]

struct Heroe: Decodable {
    let name: String
    let image: Image
    let biography: Biography
 
    
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
    //appearance
struct Appearance: Decodable {
    let gender: String
    let race: String
    
    enum CodingKeys: String, CodingKey {
        case gender
        case race
    }
}
    
    //estructura principal
struct HeroeWrapper: Decodable {
    let heroes: Heroes
        
    enum CodingKeys: String, CodingKey  {
        case heroes = "results"
    }
}
