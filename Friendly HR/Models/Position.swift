//
//  Position.swift
//  Friendly HR
//
//  Created by Антон Пеньков on 28.03.2024.
//

import Foundation

struct Position: Decodable {
    let name: String
    let imageUrl: URL
    let payRate: String
    let technologyStack: String
    let positionDescription: String
    let companyDescription: String
}
