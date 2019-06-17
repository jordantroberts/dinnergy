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
        
        searchInMap()
    }
    
    func searchInMap() {
        // 1 MKLocalSearchRequest object is created and can be used to specify search parameters. The search query is set to the title of the currently selected index of the segment control
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex)
        // 2 The region on which the search will be applied is defined
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        request.region = MKCoordinateRegion(center: initialLocation.coordinate, span: span)
        // 3 MLLocalSearchObject initiates thes earch operation and deliver the results back into an array of MKMapItems. This will contain the name, latitide and longitute of the current POI
        let search = MKLocalSearch(request: request)
        search.start(completionHandler: {(response, error) in
            for item in response!.mapItems {
                self.addPinToMapView(title: item.name, latitude: item.placemark.location!.coordinate.latitude, longitude: item.placemark.location!.coordinate.longitude)
            }
        })
    }
    
    func addPinToMapView(title: String?, latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        if let title = title {
            let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = title
            
            mapView.addAnnotation(annotation)
        }
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
        
        mapView.removeAnnotations(mapView.annotations)
        searchInMap()
        
    }
    

}
