//
//  Link.swift
//  ShortIt
//
//  Created by Александр on 14/01/2022.
//

import Foundation

struct Responce: Codable {
    let shortUrl: String
    let longUrl: String
    
    enum CodingKeys: String, CodingKey {
        case shortUrl = "shorturl"
        case longUrl = "longurl"
    }
}


