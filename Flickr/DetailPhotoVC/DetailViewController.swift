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
    var contentView = DetailComponent()
    
  
    lazy var refresher: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .black
        refreshControl.addTarget(self, action: #selector(requestData), for: .valueChanged)
        return refreshControl
    }()
    
   
        var scrollView = UIScrollView()
       
   

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        
        configure(withPhoto: model!)
        
        
    }
    
    @objc func requestData() {
        refresher.endRefreshing()
    }

    fileprivate func setupLayout() {
        view.backgroundColor = .white
        guard let model = model else { return }
        navigationItem.title = model.owner_name
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    func configure(withPhoto photo: PhotoModel) {
        //MARK: -  Конфигурация изображения
        guard let url = URL(string: photo.url ?? "") else {
            contentView.preparedView.image = nil
            return
        }
        contentView.preparedView.sd_setImage(with: url)
        
        //MARK: - Конфигурация иконки пользователя
        guard let urlIcon = URL(string: photo.urlIcon ?? "") else {
            contentView.userIcon.image = nil
            return
        }
        contentView.userIcon.sd_setImage(with: urlIcon)
    }
    
    
}
