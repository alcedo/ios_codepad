//
//  PhotoMapViewController.swift
//  Photo Map
//
//  Created by Victor Liew on 6/13/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit
import MapKit
import SnapKit


class PhotoMapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var mapView: MKMapView!
    var locationManager: CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self;
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.startUpdatingLocation()
        
        self.title = "Photo Map View"
        self.view.backgroundColor = UIColor.whiteColor()
        self.mapView = MKMapView()
        self.view = self.mapView
        self.mapView.showsUserLocation = true;
        self.mapView.delegate = self;
        
        let image = UIImageView(image: UIImage(named: "camera"))
        image.userInteractionEnabled = true
        let singleTapGesture = UITapGestureRecognizer(target: self, action: "singleTapping")
        singleTapGesture.numberOfTapsRequired = 1
        image.addGestureRecognizer(singleTapGesture)
        self.view.addSubview(image)
        
        image.snp_makeConstraints { (make) -> Void in
            make.bottom.centerX.equalTo(self.view)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager:CLLocationManager, didUpdateLocations locations:[AnyObject]) {
        let spanX = 0.007
        let spanY = 0.007
        var newRegion = MKCoordinateRegion(center:self.mapView.userLocation.coordinate, span: MKCoordinateSpanMake(spanX, spanY))
        self.mapView.setRegion(newRegion, animated: true)
    }
    
    func singleTapping() {
        var vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
            var originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            var editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
            self.dismissViewControllerAnimated(true, completion: nil)
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewControllerWithIdentifier("addLocationVC") as! LocationsViewController
            self.navigationController?.pushViewController(vc, animated: true)
            
            vc.didSelectLocation = {[unowned self] (lat, long) -> () in
                
                let annotate = MKPointAnnotation()
                let latCoord = lat as! CLLocationDegrees
                let longCoord = long as! CLLocationDegrees
                
                annotate.coordinate = CLLocationCoordinate2DMake(latCoord, longCoord)
                self.mapView.addAnnotation(annotate)
                
                self.navigationController?.popViewControllerAnimated(true)
                
                // Implement the mapView:viewForAnnotation delegate method to provide an annotation view for bonus stage.
                
            }
    }
    
//    func mapView(mapView: MKMapView!, didUpdateUserLocation userLocation: MKUserLocation!) {
//        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
//        let location = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
//        let region = MKCoordinateRegion(center: location, span: span)
//        self.mapView.setRegion(region, animated: true)
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
