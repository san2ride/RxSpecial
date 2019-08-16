//
//  Gear.swift
//  RxSpecial
//
//  Created by Jason Sanchez on 8/15/19.
//  Copyright © 2019 Jason Sanchez. All rights reserved.
//

import Foundation

struct Gear : Codable {
    var id: Int
    var imageUrl: URL
    var name: String
    var order: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case imageUrl = "image"
        case name
        case order
    }
}

struct Info : Codable {
    var title: String
    var version: String
}

struct SecurityDefinition: Codable {
    var type: String
}

struct Swagger : Codable {
    var swagger: String
    var info: Info
    var host: String
    var schemes: [String]
    var basePath: String
    var consumes: [String]
    var produces: [String]
    var securityDefinition: [String:SecurityDefinition]
}
