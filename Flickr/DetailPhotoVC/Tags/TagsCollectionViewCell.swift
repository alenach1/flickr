//
//  TagsCollectionViewCell.swift
//  Flickr
//
//  Created by alena on 03.04.2020.
//  Copyright © 2020 alena. All rights reserved.
//

import UIKit

class TagsCollectionViewCell: UICollectionViewCell {
    
    var model: PhotoModel?

    var tagButton: UIButton {
        let tagButton = UIButton()
        tagButton.clipsToBounds = true
        tagButton.contentMode = .scaleAspectFill
        tagButton.translatesAutoresizingMaskIntoConstraints = false
        return tagButton
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(tagButton)
        tagButton.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        tagButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        tagButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        tagButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func configure(withPhoto photo: PhotoModel) {
//        for tag in photo.tagsArray ?? <#default value#> {
//          tagButton.titleLabel = photo.tagsArray[tag - 1]
//        }
//        
//    }
}
