//
//  TagsCollectionViewCell.swift
//  Flickr
//
//  Created by alena on 03.04.2020.
//  Copyright © 2020 alena. All rights reserved.
//

import UIKit
import SDWebImage
import Reusable

class TagsCollectionViewCell: UICollectionViewCell, NibReusable {
    
    @IBOutlet weak var tagButtonInCollectionView: UIButton!
    static var reuseIdentifier: String { return "tagsCollectionViewCell" }
    static var nib: UINib { return UINib(nibName: "TagsCollectionViewCell", bundle: nil) }
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tagButtonInCollectionView.clipsToBounds = true
        tagButtonInCollectionView.contentMode = .scaleAspectFill
        print(tagButtonInCollectionView)
    }

    func configure(tags: String) {
        
        tagButtonInCollectionView.setTitle(tags, for: .normal)
        
    }
}
