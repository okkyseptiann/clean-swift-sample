//
//  UserModel.swift
//  Clean Swift
//
//  Created by Okky Septian Pradana on 14/08/19.
//  Copyright © 2019 Okky Septian Pradana. All rights reserved.
//

import Foundation
struct User : Codable {
    let first_name : [String]?
    let last_name : String?
    let country : String?
    
    enum CodingKeys: String, CodingKey {
        case first_name = "first_name"
        case last_name = "last_name"
        case country = "country"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        first_name = try values.decodeIfPresent([String].self, forKey: .first_name)
        last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
        country = try values.decodeIfPresent(String.self, forKey: .country)
    }
    
}
