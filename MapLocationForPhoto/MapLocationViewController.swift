//
//  MapLocationViewController.swift
//  Flickr
//
//  Created by alena on 04.04.2020.
//  Copyright © 2020 alena. All rights reserved.
//

import UIKit
import MapKit

class MapLocationViewController: UIViewController {
    
    var model: PhotoModel?
    var photoLocation: CLLocation {
        let photoLocation = CLLocation(latitude: (model?.geo.0)!, longitude: (model?.geo.1)!)
        return photoLocation
    }
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
 

}
