//
//  PhotoCVCell.swift
//  Flickr
//
//  Created by alena on 01.03.2020.
//  Copyright © 2020 alena. All rights reserved.
//

import UIKit
import Reusable
import SDWebImage

class PhotoCVCell: UICollectionViewCell, NibReusable {

    @IBOutlet weak var imgView: UIImageView!
    
    static var reuseIdentifier: String { return "photoCVCell" }
    static var nib: UINib { return UINib(nibName: "PhotoCVCell", bundle: nil) }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgView.clipsToBounds = true
        imgView.contentMode = .scaleAspectFill
        
    }
    
    func configure(withPhoto photo: PhotoModel) {
        guard let url = URL(string: photo.url ?? "") else {
            imgView.image = nil
            return
        }
        imgView.sd_setImage(with: url)
    }
}
