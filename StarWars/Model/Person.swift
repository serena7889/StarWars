//
//  Person.swift
//  StarWars
//
//  Created by Serena Lambert on 16/11/2019.
//  Copyright © 2019 Serena Lambert. All rights reserved.
//

import Foundation

struct Person: Codable {
    let birthYear, eyeColor: String
    let films: [String]
    let gender, hairColor, height: String
    let homeworld: String
    let mass, name, skinColor: String
    let species, starships: [String]
    let url: String
    let vehicles: [String]

    enum CodingKeys: String, CodingKey {
        case birthYear = "birth_year"
        case eyeColor = "eye_color"
        case films, gender
        case hairColor = "hair_color"
        case height, homeworld, mass, name
        case skinColor = "skin_color"
        case species, starships, url, vehicles
    }
}
