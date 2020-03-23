//
//  API_conf.swift
//  Flickr
//
//  Created by alena on 24.02.2020.
//  Copyright © 2020 alena. All rights reserved.
//

import Foundation

class API_conf {
    class func createRequest(withURL url: String, andParams params: [String : AnyHashable]) -> URLRequest {
        
        var url = url + "?"
        
        for (key, value) in params {
            url += key + "=" + "\(value)" + "&"
        }
        url = String(url.dropLast())
        
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        return request
    }

    class func generalCompletionHandler(withData data: Data?,
                                        withError requestError: Error?,
                                        success: (_ json: Any) -> Void,
                                        failure: (_ erorrDescription: String) -> Void) {
        if let erorr = requestError {
            failure(erorr.localizedDescription)
        }
        
        guard let data = data else {
            failure("data is NIL")
            return
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            success(json)
        } catch {
            failure("Ошибка сериализации")
            return
        }
        
    }
}


