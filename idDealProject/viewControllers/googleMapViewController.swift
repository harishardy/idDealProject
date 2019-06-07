//
//  googleMapViewController.swift
//  idDealProject
//
//  Created by harishardy on 07/06/19.
//  Copyright © 2019 iosdev. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class googleMapViewController: UIViewController {

    override func viewDidLoad() {
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let lat = Double(appDelegate.globalLatitude!)
        let long = Double(appDelegate.globalLongitude!)
        
        let camera = GMSCameraPosition.camera(withLatitude: lat!, longitude:    long!, zoom: 12.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat!, longitude:     long!)
//        marker.title = "Adayar"
//        marker.snippet = "CHENNAI"
        marker.map = mapView
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
