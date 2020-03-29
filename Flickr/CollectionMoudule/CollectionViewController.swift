//
//  ViewController.swift
//  Flickr
//
//  Created by alena on 01.03.2020.
//  Copyright © 2020 alena. All rights reserved.
//

import UIKit
import Reusable
import SwiftyJSON
import SDWebImage

enum VCCollectionState {
    case initial
    case uploading
    case loaded
}

class CollectionViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataSourse: [PhotoModel] = []
    let imgUrlCreator = ImgUrlCreator()
    let iconCreator = IconUrlCreator()
    
    var state: VCCollectionState = .initial
    
    var total: Int = 0
    var currentPage = 1
    
    
    let activicyIndekator = UIActivityIndicatorView(style: .medium)
    
    //ленивая переменная для ленивого создания рефрешера
    lazy var refresher: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .black
        refreshControl.addTarget(self, action: #selector(requestData), for: .valueChanged)
        return refreshControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        loadPhotos()
        collectionView.register(cellType: PhotoCVCell.self)
        
    }
    
    fileprivate func setupLayout() {
        setupActivityIndicator()
        view.backgroundColor = .white
        collectionView.refreshControl = refresher
    }
    
    @objc func requestData() {
          clearData()
          loadPhotos()
          
      }
    
    fileprivate func clearData() {
        currentPage = 1
    }
   
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (UIScreen.main.bounds.width - 20) / 3
        return CGSize(width: width, height: width)
        
        
    }
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSourse.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: PhotoCVCell.self)
        let photo = dataSourse[indexPath.row]
        cell.configure(withPhoto: photo)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.model = dataSourse[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension CollectionViewController {
    func loadPhotos() {
        state = .uploading
        loaderView?.startAnimation()
        API_Wreapper.getInterestsPhoto(page: 1, per_page: Const.Screen.collection.per_page, success: { [weak self] (response) in
            guard let self = self else { return }
            print(response)
            let json = JSON(response)
            let photoArray = json["photos"]["photo"].arrayValue
            var photos: [PhotoModel] = []
            
            for jsonPhoto in photoArray {
            
            let photo = PhotoModel(json: jsonPhoto)
                
                let url = self.imgUrlCreator.creatUrl(withModel: photo)
                photo.url = url
                
                let urlIcon = self.iconCreator.creatUrlIcon(withModel: photo)
                photo.urlIcon = urlIcon
                
                photos.append(photo)
            }
            let currentPage = json["photos"]["page"].intValue
            self.total = json["photos"]["total"].intValue
            self.currentPage = currentPage + 1
            self.dataSourse = photos
            self.state = .loaded
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                self.refresher.endRefreshing()
                self.loaderView?.stopAnimation()
            }
            
        }) { (error) in
            print(error ?? "")
        }
    }
}
