//
//  ViewController.swift
//  Turismo
//
//  Created by Flaviano Dias Fontes on 16/01/18.
//  Copyright © 2018 Flaviano Dias Fontes. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    var currentLocation = CLLocation()
    let regionRadius: CLLocationDistance = 8000
    let reach = Reachability()
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidAppear(_ animated: Bool) {
        if(CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse){
            if(self.locationManager.location == nil){
                self.locationManager.requestWhenInUseAuthorization()
            }
            else{
                self.currentLocation = self.locationManager.location!
            }
        }
        
        if let coordinate = self.locationManager.location?.coordinate{
            let cl = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
            self.centerMapOnLocation(cl)
        }
        else{
            //alert
            print("Lembrar de colocar um uialertview")
            let cl = CLLocation(latitude: -8.0536907, longitude: -34.9030814)
            self.centerMapOnLocation(cl)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.mapView.delegate = self
        self.mapView.showsUserLocation = true
        self.locationManager.delegate = self
        
        self.locationManager.requestWhenInUseAuthorization()
        self.initLocationService()
        self.updateTCCLocations()
        let menuButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "list"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.go))
        self.navigationItem.leftBarButtonItem = menuButton
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func go(){
        self.performSegue(withIdentifier: "segueToList", sender: nil)
    }
    
    //colocar o mapa em uma determinada localização
    func centerMapOnLocation(_ location: CLLocation){
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        self.mapView.setRegion(coordinateRegion, animated: true)
        
        self.addUserAnnotation(location.coordinate)
    }
    //plotar pino do cliente
    func addUserAnnotation(_ coordinate: CLLocationCoordinate2D){
        let annotation = UserPin()
        annotation.coordinate = coordinate
        self.mapView.addAnnotation(annotation)
    }
    
    // Para inicializara a localização e taxa de atualização
    
    func initLocationService(){
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.currentLocation = manager.location!
    }
    
    // Mudar a imagem do Pino
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var pinView = MKAnnotationView()
        //Pin do usuário
        if (annotation is MKUserLocation) {
            return nil
        }
        
        if annotation is UserPin{
            
            var userPin = MKAnnotationView()
            let image = UIImage(named: "userPin")
            
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: "userPin"){
                dequeuedView.annotation = annotation
                userPin = dequeuedView
                userPin.canShowCallout = false
                userPin.image = image
                userPin.centerOffset = CGPoint(x: 0.0, y: -userPin.frame.size.height*0.5)
                userPin.isDraggable = true
            }
            else{
                userPin = MKAnnotationView(annotation: annotation, reuseIdentifier: "userPin")
                userPin.canShowCallout = false
                userPin.image = image
                
                userPin.centerOffset = CGPoint(x: 0.0, y: -userPin.frame.size.height*0.5)
                userPin.isDraggable = true
            }
            pinView = userPin
        }
        
        if annotation is LocalPin{
            var localPin = MKAnnotationView()
            let localPinImage = UIImage(named: "localPin")!
            
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: "localPin"){
                dequeuedView.annotation = annotation
                localPin = dequeuedView
                localPin.canShowCallout = false
                localPin.image = localPinImage
                localPin.centerOffset = CGPoint(x: 0.0, y: -localPin.frame.size.height*0.5)
                localPin.isDraggable = false
                localPin.isSelected = false
            }
            else{
                localPin = MKAnnotationView(annotation: annotation, reuseIdentifier: "localPin")
                localPin.canShowCallout = false
                localPin.image = localPinImage
                localPin.centerOffset = CGPoint(x: 0.0, y: -localPin.frame.size.height*0.5)
                localPin.isDraggable = false
                localPin.isSelected = false
            }
            pinView = localPin
        }
        return pinView
    }
    
    // Nesse caso desse mapa, quando eu toco no pino ele aparece um balãozinho com o "i" de informação. Ai quando eu clico no balãozinho ai chama esse método aqui
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        mapView.deselectAnnotation(view.annotation, animated: true)
        let placemark = MKPlacemark(coordinate: (view.annotation?.coordinate)!, addressDictionary: nil)
        
        _ = UIAlertController(title: "", message: "", preferredStyle: UIAlertControllerStyle.alert)
        
    }
    
    //plotar pontos no mapa
    func updateTCCLocations(){
        self.mapView.removeAnnotations(self.mapView.annotations)
        
        reach.getLocals(){ (success, locals, message) in
            if success{
                for (_, local) in locals.enumerated(){
                    var region = MKCoordinateRegion()
                    if let address = local.address{
                    
                        if let lat = address.lat{
                            if let lng = address.lng{
                                print(lat)
                                region.center.latitude = lat
                                region.center.longitude = lng
                                let annotation = LocalPin()
                                annotation.coordinate = CLLocationCoordinate2DMake(lat, lng)
                                self.mapView.addAnnotation(annotation)
                            }
                        }
                        
                    }
                    
                }
            }
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToList"{
            let view = segue.destination as! LocalsTableViewController
        }
    }
    
    
}

