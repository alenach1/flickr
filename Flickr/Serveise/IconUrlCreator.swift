//
//  IconUrlCreator.swift
//  Flickr
//
//  Created by alena on 29.03.2020.
//  Copyright © 2020 alena. All rights reserved.
//

import UIKit

class IconUrlCreator {
    func creatUrlIcon(withModel model: PhotoModel) -> String {
        let url = "http://farm\(model.iconfarm).staticflickr.com/\(model.icon_server)/buddyicons/\(model.nsid).jpg"
        return url
    }
}
