//
//  MapViewController.swift
//  Dinnergy
//
//  Created by Simon 易 on 17/06/2019.
//  Copyright © 2019 Edgy Eats. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: ViewController, MKMapViewDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    let initialLocation = CLLocation(latitude: 51.5173403, longitude: -0.0754695)
    let searchRadius: CLLocationDistance = 1500
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        mapView.delegate = self
        
        let coordinateRegion = MKCoordinateRegion.init(center: initialLocation.coordinate, latitudinalMeters: searchRadius * 1.5, longitudinalMeters: searchRadius * 1.5)
        mapView.setRegion(coordinateRegion, animated: true)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    @IBAction func searchOnValueChanged(_ sender: Any) {
        
        
        
        
    }
    

}
