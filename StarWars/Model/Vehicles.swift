//
//  Vehicles.swift
//  StarWars
//
//  Created by Serena Lambert on 16/11/2019.
//  Copyright © 2019 Serena Lambert. All rights reserved.
//

import Foundation

struct Vehicles: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Vehicle]
}
