//
//  DataFormatter.swift
//  Flickr
//
//  Created by alena on 03.04.2020.
//  Copyright © 2020 alena. All rights reserved.
//

import UIKit

class DateFormatterInProject {
    func creatNiceData(withModel model: PhotoModel) -> String {
        let date = DateFormatter().date(from: model.date_taken) ?? Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM, yyyy"
        return dateFormatter.string(from: date)
    }
    

}
