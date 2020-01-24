//
//  Services.swift
//  Clean Swift
//
//  Created by Djijit J. Yusnipar on 14/08/19.
//  Copyright © 2019 Okky Septian Pradana. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Services: NSObject {
    static var manager: SessionManager!
    static var managerUpload:SessionManager!
    static var currentController: UIViewController!
    
    static func GET(url: String, parameter: [String: Any], success: @escaping (JSON) -> Void, failure: @escaping (Error) -> Void) {
        
        if manager == nil {
            let configuration = URLSessionConfiguration.default
            configuration.timeoutIntervalForRequest = 0
            configuration.timeoutIntervalForResource = 0
            manager = SessionManager(configuration: configuration)
        }
        
        let request = manager.request(url, method: .get, parameters: parameter, encoding: URLEncoding.default)
        
        request.responseString { (response) in
            switch response.result {
            case .success(let json):
                let jsonObject = JSON(json)
                print("End Point --> \(url)")
                print("Success with JSON --> \(response)")
                success(jsonObject)
            case .failure(let error):
                print("Error --> \(error)")
            }
        }
    }
    
    static func POST(url: String, header: [String: String], parameter: [String: Any], isLoading: Bool, success: @escaping (JSON) -> Void, failure: @escaping (Error) -> Void) {
        if manager == nil {
            let configuration = URLSessionConfiguration.default
            configuration.timeoutIntervalForRequest = 0
            configuration.timeoutIntervalForResource = 0
            manager = SessionManager(configuration: configuration)
        }
        
        let request = manager.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: header)
        
        request.responseJSON { (response) in
            switch response.result {
            case .success(let json):
                let jsonObject = JSON(json)
                print("End Point --> \(url)")
                print("Success with JSON --> \(response)")
                success(jsonObject)
            case .failure(let error):
                print("Error --> \(error)")
            }
        }
    }
    
    func requestWith(url: String, imageData: Data?,
                     parameters: [String : Any],
                     onCompletion: ((JSON?) -> Void)? = nil,
                     onError: ((Error?) -> Void)? = nil) {
        
        let url = url
        
        let headers: HTTPHeaders = [
            "Content-type": "multipart/form-data"
        ]
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            for (key, value) in parameters {
                multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
            }
            
            if let data = imageData {
                multipartFormData.append(data,
                                         withName: "image",
                                         fileName: "image.png",
                                         mimeType: "image/png") }},
                         usingThreshold: UInt64.init(),
                         to: url, method: .post,
                         headers: headers) { result in
            switch result {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    print("Succesfully uploaded")
                    print("End Point --> \(url)")
                    print("Success with JSON --> \(response)")
                    if let err = response.error {
                        onError?(err)
                        return
                    }
                    onCompletion?(nil)
                }
            case .failure(let error):
                print("Error in upload: \(error.localizedDescription)")
                print("Error --> \(error)")
                onError?(error)
            }
        }
    }
}
