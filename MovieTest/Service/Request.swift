//
//  Request.swift
//  ICPChallange
//
//  Created by Denny Arfansyah on 01/07/21.
//

import Alamofire

struct Request {
    
    static func setParams(data: Data?) -> Parameters? {
        if let d = data {
            do {
                return try JSONSerialization.jsonObject(with: d , options: []) as? [String : Any]
            } catch {
                return nil
            }
        }
        return nil
    }
    
    static func getAuthorizationHeader() -> [String : String] {
        var header : [String:String] = ["Content-Type": "application/json"]
        header["X-AUTH-TOKEN"] = "asdasas"
        return header
    }
    
}
