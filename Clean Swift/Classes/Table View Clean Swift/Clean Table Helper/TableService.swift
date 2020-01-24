//
//  TableService.swift
//  Clean Swift
//
//  Created by Okky Septian Pradana on 14/08/19.
//  Copyright © 2019 Okky Septian Pradana. All rights reserved.
//

import Foundation
import SwiftyJSON
import UIKit

class TableService: NSObject {
    static func getLogin (_ request: [String: Any], success: @escaping (User) -> Void) {
        Services.GET(url: "http://private-af5ff-testapi4132.apiary-mock.com/request",
                     parameter: ["": ""],
                     success: { (json) in
            do {
                let data = json.rawString()?.data(using: .utf8)!
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(User.self, from: data!)
                success(responseModel)
            } catch {
                
            } }) { error in
            print(error)
        }
    }
}
