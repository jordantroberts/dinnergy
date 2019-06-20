import UIKit
import MapKit

class MapViewController: ViewController, MKMapViewDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    let initialLocation = CLLocation(latitude: 51.5173403, longitude: -0.0754695)
    let searchRadius: CLLocationDistance = 1500
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        let coordinateRegion = MKCoordinateRegion.init(center: initialLocation.coordinate, latitudinalMeters: searchRadius * 1.5, longitudinalMeters: searchRadius * 1.5)
        mapView.setRegion(coordinateRegion, animated: true)
        
        searchInMap()
    }
    
    func searchInMap() {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        request.region = MKCoordinateRegion(center: initialLocation.coordinate, span: span)
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
    
    @IBAction func searchOnValueChanged(_ sender: Any) {
        
        mapView.removeAnnotations(mapView.annotations)
        searchInMap()
    }
}
