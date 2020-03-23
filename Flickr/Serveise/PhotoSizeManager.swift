//
//  PhotoSizeManager.swift
//  Flickr
//
//  Created by alena on 24.02.2020.
//  Copyright © 2020 alena. All rights reserved.
//

import UIKit
import SwiftyJSON

class PhotoSizeManager {
    class func getSize(photos: [PhotoModel], completion: @escaping (_ isSuccess: Bool) -> Void) {
        
        var index = 0
       
        for photo in photos {
            
            API_Wreapper.getSize(photoId: photo.id, success: { (response) in
                let jsonData  = JSON(response)
                let sizes = jsonData["sizes"]["size"][4].dictionaryValue
                guard let width = sizes["width"]?.floatValue else { return }
                guard let height = sizes["height"]?.floatValue else { return }
                
                photo.size?.width = CGFloat(width)
                photo.size?.height = CGFloat(height)
                
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

//Для каждой фотографии вот тут вы идете в интернет и поулчаете ее размер по запросу что я скинул в телегу
//В модели вы создаете новое свойство CGSize() и присваиваете каждой модели его CGSize(width: , height: )
//Во вью контроллере данные должны быть уже добавлены в dataSource с существующим полученным с сервера размером и только тогда обновлять таблицу
//У модели должен быть метод который выдаст вам высоту по ширене экрана чтоб изображение было полностью отображено
    

