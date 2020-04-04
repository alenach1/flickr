//
//  DetailComponent.swift
//  Flickr
//
//  Created by alena on 01.04.2020.
//  Copyright © 2020 alena. All rights reserved.
//

import UIKit

class DetailComponent: UIView {
    
    var model: PhotoModel?
    
    var userIcon: UIImageView {
        let userIcon = UIImageView()
        if model?.urlIcon != nil {
        let urlIcon = URL(string: model?.urlIcon ?? "")
        userIcon.sd_setImage(with: urlIcon)
        } else {
            userIcon.image = UIImage(contentsOfFile: "Like")
        }
        userIcon.translatesAutoresizingMaskIntoConstraints = false
        return userIcon
    }
    
    var stackViewNameGeo: UIStackView {
        let stackViewNameGeo = UIStackView()
        stackViewNameGeo.translatesAutoresizingMaskIntoConstraints = false
        stackViewNameGeo.alignment = .center
        stackViewNameGeo.axis = .vertical
        stackViewNameGeo.distribution = .fillEqually
        stackViewNameGeo.spacing = 10
        
        let nameUserLable = UILabel()
        stackViewNameGeo.addArrangedSubview(nameUserLable)
        nameUserLable.translatesAutoresizingMaskIntoConstraints = false
        nameUserLable.text = model?.owner_name
        
        var geoButton: UIButton?
        if geoButton != nil {
            stackViewNameGeo.addArrangedSubview(geoButton!)
            geoButton!.translatesAutoresizingMaskIntoConstraints = false
            geoButton!.setTitle("Кнопка локации", for: .normal)
            geoButton!.backgroundColor = .red
        }
       return stackViewNameGeo
    }
   
    var preparedView: UIImageView {
        let preparedView = UIImageView()
        let url = URL(string: model?.url ?? "")
        preparedView.sd_setImage(with: url)
        preparedView.translatesAutoresizingMaskIntoConstraints = false
        return preparedView
    }
    var stackIconBar: UIStackView {
        let stackIconBar = UIStackView()
        stackIconBar.translatesAutoresizingMaskIntoConstraints = false
        stackIconBar.alignment = .center
        stackIconBar.axis = .horizontal
        stackIconBar.distribution = .fillEqually
        stackIconBar.spacing = 10
        
        let views = UILabel()
        stackIconBar.addArrangedSubview(views)
        views.translatesAutoresizingMaskIntoConstraints = false
        views.text = model?.views
        views.contentMode = .scaleAspectFill
        views.clipsToBounds = true
        
        let likeImg = UIImageView(image: UIImage(contentsOfFile: "Like"))
        stackIconBar.addArrangedSubview(likeImg)
        likeImg.translatesAutoresizingMaskIntoConstraints = false
        likeImg.contentMode = .scaleAspectFill
        likeImg.clipsToBounds = true
        
        let commentImg = UIImageView(image: UIImage(contentsOfFile: "Commented"))
        stackIconBar.addArrangedSubview(commentImg)
        commentImg.translatesAutoresizingMaskIntoConstraints = false
        commentImg.contentMode = .scaleAspectFill
        commentImg.clipsToBounds = true
        
        let dateOfDownload = UILabel()
        stackIconBar.addArrangedSubview(dateOfDownload)
        dateOfDownload.translatesAutoresizingMaskIntoConstraints = false
        dateOfDownload.contentMode = .scaleAspectFill
        dateOfDownload.clipsToBounds = true
        dateOfDownload.text = model?.date_taken
        return stackIconBar
    }
   
    var tags: UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let tags = UICollectionView(frame: .zero, collectionViewLayout: layout)
        tags.translatesAutoresizingMaskIntoConstraints = false
        tags.register(TagsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return tags
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(userIcon)
        userIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        userIcon.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        userIcon.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        userIcon.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
//        userIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//        userIcon.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        userIcon.trailingAnchor.constraint(equalTo:self.trailingAnchor).isActive = true
//        userIcon.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        userIcon.heightAnchor.constraint(equalToConstant: userIcon.intrinsicContentSize.height).isActive = true
        userIcon.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
