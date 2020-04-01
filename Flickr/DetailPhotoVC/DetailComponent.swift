//
//  DetailComponent.swift
//  Flickr
//
//  Created by alena on 01.04.2020.
//  Copyright © 2020 alena. All rights reserved.
//

import UIKit

class DetailComponent: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
       var view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
       var model: PhotoModel?
       var userIcon = UIImageView()
       var substrateForTop = UIView()
       var stackViewNameGeo = UIStackView()
       var nameUserLable = UILabel()
       var geoButton: UIButton?
       
       var preparedView = UIImageView()
       var stackIconBar = UIStackView()
       var views = UILabel()
       var likeImg = UIImageView(image: UIImage(contentsOfFile: "Like"))
       var commentImg = UIImageView(image: UIImage(contentsOfFile: "Commented"))
       var dateOfDownload = UILabel()
       var tegs = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
       
    func setupViews() {
        self.addSubview(substrateForTop)
        self.substrateForTop.addSubview(userIcon)
        self.substrateForTop.addSubview(stackViewNameGeo)
        self.addSubview(preparedView)
        self.addSubview(stackIconBar)
        self.addSubview(tegs)
        
    }
    func setupLayouts() {
        
        substrateForTop.translatesAutoresizingMaskIntoConstraints = false
        substrateForTop.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        substrateForTop.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        substrateForTop.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        substrateForTop.heightAnchor.constraint(equalToConstant: 50).isActive = true
        substrateForTop.backgroundColor = .green
        
        //добавление иконки
        
        userIcon.translatesAutoresizingMaskIntoConstraints = false
        userIcon.topAnchor.constraint(equalTo: substrateForTop.topAnchor, constant: 10).isActive = true
        userIcon.leadingAnchor.constraint(equalTo: substrateForTop.leadingAnchor, constant: 10).isActive = true
        userIcon.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        
        //добавление стека гео/ник
        
        stackViewNameGeo.translatesAutoresizingMaskIntoConstraints = false
        stackViewNameGeo.topAnchor.constraint(equalTo: substrateForTop.topAnchor, constant: 0).isActive = true
        stackViewNameGeo.leadingAnchor.constraint(equalTo: userIcon.trailingAnchor, constant: 10).isActive = true
        stackViewNameGeo.trailingAnchor.constraint(equalTo: substrateForTop.trailingAnchor, constant: 0).isActive = true
        stackViewNameGeo.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //добавление вью в стек и настройка стека
        stackViewNameGeo.axis = .vertical
        stackViewNameGeo.distribution = .fillEqually
        stackViewNameGeo.spacing = 20
        stackViewNameGeo.addArrangedSubview(nameUserLable)
        nameUserLable.text = model?.owner_name
        guard let geoButton = geoButton else { return }
        stackViewNameGeo.addArrangedSubview(geoButton)
        geoButton.setTitle("\(model?.geo)", for: .normal)
        geoButton.backgroundColor = .none
        
        //добавление картинки
        
        preparedView.translatesAutoresizingMaskIntoConstraints = false
        preparedView.topAnchor.constraint(equalTo: substrateForTop.bottomAnchor, constant: 10).isActive = true
        preparedView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        preparedView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        preparedView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //добавление бара иконок
        stackIconBar.axis = .horizontal
        stackIconBar.distribution = .fillEqually
        stackIconBar.spacing = 20
        stackIconBar.addArrangedSubview(views)
        stackIconBar.addArrangedSubview(likeImg)
        stackIconBar.addArrangedSubview(commentImg)
        stackIconBar.addArrangedSubview(dateOfDownload)
       
        stackIconBar.translatesAutoresizingMaskIntoConstraints = false
        stackIconBar.topAnchor.constraint(equalTo: preparedView.bottomAnchor, constant: 10).isActive = true
        stackIconBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        stackIconBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        stackIconBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //добавление тегов
        
        tegs.translatesAutoresizingMaskIntoConstraints = false
        tegs.topAnchor.constraint(equalTo: stackIconBar.bottomAnchor, constant: 10).isActive = true
        tegs.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        tegs.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        tegs.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
          
}
