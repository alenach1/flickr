//
//  PhotoModel.swift
//  Flickr
//
//  Created by alena on 24.02.2020.
//  Copyright © 2020 alena. All rights reserved.
//

import UIKit
import SwiftyJSON

class PhotoModel {
    let id: String
    let owner: String
    let secret: String
    let server: String
    let farm: Int
    let title: String?
    var date_taken: String
    let icon_server: String
    let geo: (Double, Double)
    var tags: String
    let owner_name: String
    let views: String
    let nsid: String
    let iconfarm: String
    
    var size: CGSize?
    var url: String?
    var urlIcon: String?
    var tagsArray: [String]?
    
    init(id: String, owner: String, secret: String, server: String, farm: Int, title: String?, date_taken: String, icon_server: String, geo: (Double , Double), tags: String, owner_name: String, views: String, nsid: String, iconfarm: String) {
        self.owner = owner
        self.secret = secret
        self.server = server
        self.id = id
        self.farm = farm
        self.title = title
        self.date_taken = date_taken
        self.icon_server = icon_server
        self.geo = geo
        self.tags = tags
        self.owner_name = owner_name
        self.views = views
        self.nsid = nsid
        self.iconfarm = iconfarm
    }
    
    
}

extension PhotoModel {
    convenience init(json: JSON) {
        let id = json["id"].stringValue
        let owner = json["owner"].stringValue
        let secret = json["secret"].stringValue
        let server = json["server"].stringValue
        let farm = json["farm"].intValue
        let title = json["title"].stringValue
        var date_taken = json["datetaken"].stringValue
        let icon_server = json["iconserver"].stringValue
        let geo = (json["latitude"].doubleValue, json["longitude"].doubleValue)
        var tags = json["tags"].stringValue
        let owner_name = json["ownername"].stringValue
        let views = json["views"].stringValue
        let nsid = json["owner"].stringValue
        let iconfarm = json["iconfarm"].stringValue
        self.init(id: id, owner: owner, secret: secret, server: server, farm: farm, title: title, date_taken: date_taken, icon_server: icon_server, geo: geo, tags: tags, owner_name: owner_name, views: views, nsid: nsid, iconfarm: iconfarm)
    }

}
