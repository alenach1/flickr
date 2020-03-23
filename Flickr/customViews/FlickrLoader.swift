//
//  FlickrLoader.swift
//  Flickr
//
//  Created by alena on 05.03.2020.
//  Copyright © 2020 alena. All rights reserved.
//

import Foundation
import UIKit

class FlickrLoader: UIView {
    
    let redView = UIView()
    let blueView = UIView()
    
    var hideIfStopAnimate: Bool = false
    var canAnimate = false
    var isBlueTop = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupView() {
        backgroundColor = UIColor.clear
        redView.backgroundColor = Color.red
        redView.frame.origin = CGPoint(x: 0, y: bounds.midY - CGFloat(Layout.viewWidth / 2))
        redView.frame.size = CGSize(width: Layout.viewWidth, height: Layout.viewWidth)
        addSubview(redView)
        redView.layer.cornerRadius = Layout.viewCornerRadius
    
        
        blueView.backgroundColor = Color.blue
        blueView.frame.origin = CGPoint(x: (bounds.width - Layout.viewWidth), y: bounds.midY - CGFloat(Layout.viewWidth / 2))
        blueView.frame.size = CGSize(width: Layout.viewWidth, height: Layout.viewWidth)
        blueView.layer.cornerRadius = Layout.viewCornerRadius
        addSubview(blueView)
    }
}

extension FlickrLoader {
    
    func startAnimation() {
        isHidden = false
        canAnimate = true
        animate()
    }
    func stopAnimation() {
        canAnimate = false
        if hideIfStopAnimate {
            self.isHidden = true
        }
    }
    
    fileprivate func animate () {
        
       
        blueView.layer.zPosition = isBlueTop ? 999 : 1000
        redView.layer.zPosition = isBlueTop ? 999 : 1000
        isBlueTop = !isBlueTop
       
        UIView.animate(withDuration: 0.8, animations: {
            let redCenter = self.redView.center
            let blueCenter = self.blueView.center
            
            self.redView.center = blueCenter
            self.blueView.center = redCenter
            
        }) { (finished) in
            if finished && self.canAnimate {
                self.animate()
            }
           
        }
    }
}

extension FlickrLoader {
    enum Layout {
        static let viewWidth: CGFloat = 20
        static var viewCornerRadius: CGFloat {
            return CGFloat(viewWidth / 2)
        }
    }
    
    enum Color {
        static let blue = #colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1)
        static let red = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
    }
}

//extension TimeInterval {
//    var flickrAnimationDuration: TimeInterval = 1.0
//}
