//
//  GetInfoUser.swift
//  Flickr
//
//  Created by alena on 23.03.2020.
//  Copyright © 2020 alena. All rights reserved.
//

import UIKit
import SwiftyJSON

class GetInfoUserServeise {
    
    class func getInfoUser(photos: [PhotoModel], completion: @escaping (_ isSuccess: Bool) -> Void) {
        
        var index = 0
       
        for photo in photos {
            
            API_Wreapper.peopleGetInfo(photoId: photo.id, success: { (response) in
                let jsonData  = JSON(response)
                let nsid = jsonData["user_id"]["id"].dictionaryValue
                
                
                if index == photos.count - 1 {
                    completion(true)
                } else {
                    index += 1
                }
               
                
            }) { (error) in
                completion(false)
            }

                
                
                
                
    
}
}
}
