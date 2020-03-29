//
//  DetailViewController.swift
//  Flickr
//
//  Created by alena on 01.03.2020.
//  Copyright © 2020 alena. All rights reserved.
//

import UIKit

class DetailViewController: BaseViewController {
    
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
  
    lazy var refresher: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .black
        refreshControl.addTarget(self, action: #selector(requestData), for: .valueChanged)
        return refreshControl
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayouts()
        configure(withPhoto: model!)
        setupLayout()
        
    }
    
    @objc func requestData() {
        
        refresher.endRefreshing()
    }

    fileprivate func setupLayout() {
        view.backgroundColor = .white
        guard let model = model else { return }
        navigationItem.title = model.owner_name
        scrollView.backgroundColor = .lightGray
        view.addSubview(scrollView)
}
    
    func setupLayouts() {
        //MARK: - setupLayout View
        //плашка для ника/гео/иконки
        self.view.addSubview(substrateForTop)
        substrateForTop.translatesAutoresizingMaskIntoConstraints = false
        substrateForTop.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        substrateForTop.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        substrateForTop.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        substrateForTop.heightAnchor.constraint(equalToConstant: 50).isActive = true
        substrateForTop.backgroundColor = .green
        
        //добавление иконки
        self.substrateForTop.addSubview(userIcon)
        userIcon.translatesAutoresizingMaskIntoConstraints = false
        userIcon.topAnchor.constraint(equalTo: substrateForTop.topAnchor, constant: 10).isActive = true
        userIcon.leadingAnchor.constraint(equalTo: substrateForTop.leadingAnchor, constant: 10).isActive = true
        userIcon.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        
        //добавление стека гео/ник
        self.substrateForTop.addSubview(stackViewNameGeo)
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
        self.view.addSubview(preparedView)
        preparedView.translatesAutoresizingMaskIntoConstraints = false
        preparedView.topAnchor.constraint(equalTo: substrateForTop.bottomAnchor, constant: 10).isActive = true
        preparedView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        preparedView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        preparedView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //добавление бара иконок
        stackIconBar.axis = .horizontal
        stackIconBar.distribution = .fillEqually
        stackIconBar.spacing = 20
        stackIconBar.addArrangedSubview(views)
        stackIconBar.addArrangedSubview(likeImg)
        stackIconBar.addArrangedSubview(commentImg)
        stackIconBar.addArrangedSubview(dateOfDownload)
        self.view.addSubview(stackIconBar)
        stackIconBar.translatesAutoresizingMaskIntoConstraints = false
        stackIconBar.topAnchor.constraint(equalTo: preparedView.bottomAnchor, constant: 10).isActive = true
        stackIconBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        stackIconBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        stackIconBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        //добавление тегов
        self.view.addSubview(tegs)
        tegs.translatesAutoresizingMaskIntoConstraints = false
        tegs.topAnchor.constraint(equalTo: stackIconBar.bottomAnchor, constant: 10).isActive = true
        tegs.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tegs.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tegs.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
    }
    func configure(withPhoto photo: PhotoModel) {
        //MARK: -  Конфигурация изображения
        guard let url = URL(string: photo.url ?? "") else {
            preparedView.image = nil
            return
        }
        preparedView.sd_setImage(with: url)
        
        //MARK: - Конфигурация иконки пользователя
        guard <#condition#> else {
            <#statements#>
        }
    }
    
    
}
