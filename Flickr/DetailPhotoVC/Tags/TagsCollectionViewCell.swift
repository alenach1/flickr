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

class TagsCollectionViewCell: UICollectionViewCell {
    
    var model: PhotoModel?
    @IBOutlet weak var tagButton: UIButton!
    static var reuseIdentifier: String { return "tagsCollectionViewCell" }
    static var nib: UINib { return UINib(nibName: "TagsCollectionViewCell", bundle: nil) }
   
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(tagButton)
        tagButton.clipsToBounds = true
        tagButton.contentMode = .scaleAspectFill
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(arrayTags: [String]) {

        for i in 0...arrayTags.count {
            tagButton.titleLabel!.text = arrayTags[i]
        }
    }
}
