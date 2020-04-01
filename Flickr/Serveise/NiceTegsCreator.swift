//
//  NiceTegsCreator.swift
//  Flickr
//
//  Created by alena on 29.03.2020.
//  Copyright © 2020 alena. All rights reserved.
//

import UIKit

class NiceTagsCreator {
    func creatNiceTags(withModel model: PhotoModel) -> String {
        var arrayTags = ""
        let tegs = model.tags
        let array = tegs.components(separatedBy: " ")
        for i in array {
            arrayTags = arrayTags + " #" + i
        }
        return arrayTags
    }
}


