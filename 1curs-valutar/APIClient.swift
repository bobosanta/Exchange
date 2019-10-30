//
//  APIClient.swift
//  1curs-valutar
//
//  Created by Dan Pop on 01/05/2019.
//  Copyright © 2019 Archlime. All rights reserved.
//

import Foundation
import Alamofire


    class APIClient {
        
        static func get(path: String, params: [String: Any]? = nil, completion: @escaping (_ json: Any?) -> ()) {
            performRequest(path: path, method: .get, params: params, completion: completion)
        }
        
        static func post(path: String, params: [String: Any]? = nil, completion: @escaping (_ json: Any?) -> ()) {
            performRequest(path: path, method: .post, params: params, completion: completion)
        }
        
        static func patch(path: String, params: [String: Any]? = nil, completion: @escaping (_ json: Any?) -> ()) {
            performRequest(path: path, method: .patch, params: params, completion: completion)
        }
        
        
        
        private static func performRequest(path: String, method: HTTPMethod, params: [String: Any]?, completion: @escaping (_ json: Any?) -> Void) {
            var requestParams = [String: Any]()

            if let p = params {
                requestParams = p
            }
            print(url(from: path))
            Alamofire.request(url(from: path), method: method, parameters: requestParams).validate().responseJSON { response in
                print("response status code: \(String(describing: response.response?.statusCode))")
                completion(response.result.value)
            }
        }
    
    private static func url(from string: String) -> String {
        return "https://www.1curs-valutar.ro/wp-json/tradebeacon/v1/" + string
        
    }
    
}
