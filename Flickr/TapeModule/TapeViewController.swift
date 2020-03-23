//
//  TapeViewController.swift
//  Flickr
//
//  Created by alena on 24.02.2020.
//  Copyright © 2020 alena. All rights reserved.
//

import UIKit
import SwiftyJSON

enum VCState {
    case uploading
    case loaded
}


class TapeViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    //ленивая переменная для ленивого создания рефрешера
    lazy var refresher: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .black
        refreshControl.addTarget(self, action: #selector(requestData), for: .valueChanged)
        return refreshControl
    }()
    
    let cellId = "tapePhotoTVCell"
    var state: VCState = .loaded
    
    let imgUrlCreator = ImgUrlCreator()
    var dataSourse: [PhotoModel] = []
    
    var total: Int = 0
    var currentPage = 1
    
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabaleView()
        loadPhotos()
        registerNibs()
        
        
        
    }
    
   
    //MARK: - Обновляем данные таблицы refresh
    @objc func requestData() {
        clearData()
        loadPhotos()
        refresher.endRefreshing()
    }
    
    fileprivate func clearData() {
        currentPage = 1
    }
    
    //MARK: - Настраиваем стиль таблицы
    fileprivate func setupTabaleView() {
        setupActivityIndicator()
        tableView.tableFooterView = UIView()
        tableView.refreshControl = refresher
        
    }
}

//MARK: - Настраиваем таблицу
//Количество столбцов
extension TapeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourse.count
    }
//Формируем ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TapePhotoTVCell
        let photoModel = dataSourse[indexPath.row]
        cell.configure(with: photoModel)
        return cell
    }
//Формируем высоту и ширину ячеек
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let size = dataSourse[indexPath.row].size else { return 300 }
        return getSizeFor(photoSize: size)
    }
    
//Регистрируем ячейку(контейнер)
    fileprivate func registerNibs() {
        let nib = UINib(nibName: "TapePhotoTVCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellId)
    }
//Формируем наполнение ячейки
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == dataSourse.count - 1 {
            if state == .loaded && dataSourse.count < total {
                loadPhotos()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "DetailViewController") as? DetailViewController else { return }
            let vc = DetailViewController()
        vc.model = dataSourse[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

//MARK: - Получаем размер фотографий
extension TapeViewController {
    fileprivate func getSizeFor(photoSize: CGSize) -> CGFloat {
        let ratio = photoSize.width / photoSize.height
        return view.bounds.width / ratio
    }
}

//MARK: - Отправляем запрос в интернет
extension TapeViewController {
    func loadPhotos() {
        state = .uploading
        loaderView?.startAnimation()
        API_Wreapper.getInterestsPhoto(page: currentPage, per_page: Const.Screen.tape.per_page, success: { [weak self] (response) in
            
            guard let self = self else { return }
            print(response)
            let json = JSON(response)
            let photoArray = json["photos"]["photo"].arrayValue
            var photos: [PhotoModel] = []
            
            for jsonPhoto in photoArray {
            
                let photo = PhotoModel(json: jsonPhoto)
                
                let url = self.imgUrlCreator.creatUrl(withModel: photo)
                photo.url = url
                photos.append(photo)
            }
            let currentPage = json["photos"]["page"].intValue
            self.total = json["photos"]["total"].intValue
            
            GetInfoUserServeise.getInfoUser(photos: photos) { [weak self] (isSuccess) in
                guard let self = self else { return }
            }
            PhotoSizeManager.getSize(photos: photos) { [weak self] (isSuccess) in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    self.loaderView?.stopAnimation()
                    self.dataSourse.append(contentsOf: photos)
                    self.tableView.reloadData()
                    self.currentPage = currentPage + 1
                    self.state = .loaded
                    
                }
            }
            }) { (error) in
                print(error ?? "")
        }
    }
}
