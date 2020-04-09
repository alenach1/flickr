//
//  DetailComponent.swift
//  Flickr
//
//  Created by alena on 01.04.2020.
//  Copyright © 2020 alena. All rights reserved.
//

import UIKit
import Reusable

class DetailComponent: UIView {
    
    var model: PhotoModel?
    
    var userIcon = UIImageView()
    
    var stackViewNameGeo = UIStackView()
   
    var preparedView = UIImageView()
        
    var stackIconBar = UIStackView()
    
//    var tagsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())

    weak var vc: DetailViewController?
        
    
    init(frame: CGRect, model: PhotoModel, vc: DetailViewController) {
        super.init(frame: frame)
        self.model = model
        self.vc = vc
        if let vc = self.vc {
        if let model = self.model {
        setupLayouts(model: model)
        }
        }
    }
    
    fileprivate func setupLayouts(model: PhotoModel) {
        
        backgroundColor = .systemBackground
        
//        userIcon
        guard let urlIcon = URL(string: model.urlIcon ?? "") else {
              userIcon.image = nil
                  return
              }
        userIcon.sd_setImage(with: urlIcon)
        addSubview(userIcon)
        userIcon.layer.cornerRadius = 25
        userIcon.clipsToBounds = true
        userIcon.translatesAutoresizingMaskIntoConstraints = false
        userIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        userIcon.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        userIcon.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //stackViewNameGeo
        addSubview(stackViewNameGeo)
        stackViewNameGeo.translatesAutoresizingMaskIntoConstraints = false
        stackViewNameGeo.alignment = .center
        stackViewNameGeo.axis = .vertical
        stackViewNameGeo.distribution = .fillEqually
        stackViewNameGeo.spacing = 10
        let nameUserLable = UILabel()
        stackViewNameGeo.addArrangedSubview(nameUserLable)
        nameUserLable.translatesAutoresizingMaskIntoConstraints = false
        nameUserLable.text = model.owner_name
        let geoButton = UIButton()
            stackViewNameGeo.addArrangedSubview(geoButton)
            geoButton.translatesAutoresizingMaskIntoConstraints = false
            geoButton.setTitle("Location", for: .normal)
            geoButton.backgroundColor = .red
        
        stackViewNameGeo.leadingAnchor.constraint(equalTo: userIcon.trailingAnchor, constant: 20).isActive = true
        stackViewNameGeo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20).isActive = true
        stackViewNameGeo.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        stackViewNameGeo.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //preparedView
        addSubview(preparedView)
        preparedView.translatesAutoresizingMaskIntoConstraints = false
        preparedView.clipsToBounds = true
        let url = URL(string: model.url ?? "")
        preparedView.sd_setImage(with: url)
        preparedView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        preparedView.topAnchor.constraint(equalTo: stackViewNameGeo.bottomAnchor, constant: 20).isActive = true
        preparedView.trailingAnchor.constraint(equalTo:self.trailingAnchor, constant: 0).isActive = true
        preparedView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
       //stackIconBar
        addSubview(stackIconBar)
        stackIconBar.translatesAutoresizingMaskIntoConstraints = false
        stackIconBar.alignment = .center
        stackIconBar.axis = .horizontal
        stackIconBar.distribution = .fillEqually
        stackIconBar.spacing = 10
        
        let views = UILabel()
        stackIconBar.addArrangedSubview(views)
        views.translatesAutoresizingMaskIntoConstraints = false
        views.text = model.views
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
        dateOfDownload.text = model.date_taken
        stackIconBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        stackIconBar.topAnchor.constraint(equalTo: preparedView.bottomAnchor, constant: 20).isActive = true
        stackIconBar.trailingAnchor.constraint(equalTo:self.trailingAnchor, constant: -10).isActive = true
        stackIconBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //tagsCollectionView
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        
        let tagsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        addSubview(tagsCollectionView)
        
        tagsCollectionView.register(TagsCollectionViewCell.self, forCellWithReuseIdentifier: "tagsCollectionViewCell")
        tagsCollectionView.dataSource = vc
        tagsCollectionView.delegate = vc
        tagsCollectionView.translatesAutoresizingMaskIntoConstraints = false
     
        tagsCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        tagsCollectionView.topAnchor.constraint(equalTo: stackIconBar.bottomAnchor, constant: 20).isActive = true
        tagsCollectionView.trailingAnchor.constraint(equalTo:self.trailingAnchor, constant: -10).isActive = true
        tagsCollectionView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
