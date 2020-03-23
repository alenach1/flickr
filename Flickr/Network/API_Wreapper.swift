//
//  API_Weapper.swift
//  Flickr
//
//  Created by alena on 24.02.2020.
//  Copyright © 2020 alena. All rights reserved.
//

import Foundation

class API_Wreapper {
    
    class func getInterestsPhoto(page: Int, per_page: Int, success: @escaping (_ json: Any) -> Void,
                                 failure: @escaping (_ error: String?) -> Void) {
        
        let url = Const.API_const.baseUrl
        let params: [String : AnyHashable] =
            ["method" : "flickr.interestingness.getList",
             "api_key" : Const.API_const.token,
             "format" : "json",
             "per_page" : per_page,
             "page" : page,
             "extras" : "date_taken,icon_server,geo,tags,owner_name,views",
             "nojsoncallback" : 1]
        
        let request: URLRequest = API_conf.createRequest(withURL: url, andParams: params)
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            API_conf.generalCompletionHandler(withData: data, withError: error, success: success, failure: failure)
            
    }
        dataTask.resume()
}
    
    class func getSize(photoId: String, success: @escaping (_ json: Any) -> Void, failure: @escaping (_ error: String) -> Void) {
        
        let url = Const.API_const.baseUrl
        let params: [String: AnyHashable] = ["method" : "flickr.photos.getSizes",
                                             "api_key" : Const.API_const.token,
                                             "photo_id" : photoId,
                                             "format" : "json",
                                             "nojsoncallback" : 1]
        
           let request: URLRequest = API_conf.createRequest(withURL: url, andParams: params)
            
            let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
                API_conf.generalCompletionHandler(withData: data, withError: error, success: success, failure: failure)
                
        }
            dataTask.resume()
    }
    
    class func peopleGetInfo(photoId: String, success: @escaping (_ json: Any) -> Void, failure: @escaping (_ error: String) -> Void) {
    
    let url = Const.API_const.baseUrl
    let params: [String: AnyHashable] = ["method" : "flickr.people.getInfo",
                                         "api_key" : Const.API_const.token,
                                         "photo_id" : photoId,
                                         "format" : "json",
                                         "nojsoncallback" : 1,
                                         "user_id" : "nsid"]
    
       let request: URLRequest = API_conf.createRequest(withURL: url, andParams: params)
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            API_conf.generalCompletionHandler(withData: data, withError: error, success: success, failure: failure)
            
    }
        dataTask.resume()
    }
}
