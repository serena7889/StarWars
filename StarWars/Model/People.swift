//
//  People.swift
//  StarWars
//
//  Created by Serena Lambert on 16/11/2019.
//  Copyright © 2019 Serena Lambert. All rights reserved.
//

import Foundation

struct People: Codable {
    let count: Int
//    let next: String
//    let prev: String
    let results: [Person]
}
