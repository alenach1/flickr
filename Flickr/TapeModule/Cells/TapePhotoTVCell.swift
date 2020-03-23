//
//  TapePhotoTVCell.swift
//  Flickr
//
//  Created by alena on 24.02.2020.
//  Copyright © 2020 alena. All rights reserved.
//

import UIKit
import SDWebImage

class TapePhotoTVCell: UITableViewCell {

    @IBOutlet weak var imageViewFlickr: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageViewFlickr.contentMode = .scaleAspectFit
    }
    func configure(with photoModel: PhotoModel) {
        guard let url = URL(string: photoModel.url ?? "") else {
        imageViewFlickr.image = nil
            return
        }
        imageViewFlickr.sd_setImage(with:url)
    }
}
