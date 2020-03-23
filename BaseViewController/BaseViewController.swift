//
//  BaseViewController.swift
//  Flickr
//
//  Created by alena on 05.03.2020.
//  Copyright © 2020 alena. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var loaderView: FlickrLoader?

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    func setupActivityIndicator () {
        loaderView = FlickrLoader(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        loaderView?.center = view.center
        loaderView?.hideIfStopAnimate = true
        guard let loaderView = loaderView else { return }
        view.addSubview(loaderView)
        view.bringSubviewToFront(loaderView)
    }
}
