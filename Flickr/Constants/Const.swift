//
//  Const.swift
//  Flickr
//
//  Created by alena on 24.02.2020.
//  Copyright © 2020 alena. All rights reserved.
//

import Foundation

struct Const {
    
    struct API_const {
        static let token = "aa0d8bc526d857a0ec0f10bab4ab3c83"
        static let baseUrl = "https://api.flickr.com/services/rest/"
    }
    
    enum Screen {
        case tape
        case collection
        
        var per_page: Int {
            switch self {
            case .tape:
                return 20
            case .collection:
                return 50
                
            }
        }
    }
}
