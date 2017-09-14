//
//  ViewController.swift
//  MapkitBasics
//
//  Created by zhiwei xu on 11/09/2017.
//  Copyright © 2017 zhiwei xu. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var myMap: MKMapView!
    
    @IBOutlet weak var mapType: UISegmentedControl!
    @IBOutlet weak var myPicker: UIPickerView!
    
    var cityList = [city]()
    
    func loadCity() {
        let shanghai = city(name: "Shanghai", lat: 31.2304, long: 121.4737)
        let LA = city(name: "Los Angeles", lat: 34.0522, long: -118.2437)
        let NY = city(name: "New York", lat: 40.7128, long: -74.0059)
        let Beijing = city(name: "Beijing", lat: 39.9042, long: 116.4074)
        
        cityList.append(shanghai)
        cityList.append(LA)
        cityList.append(NY)
        cityList.append(Beijing)
        
    }
    @IBAction func changeMapView(_ sender: Any) {
        switch mapType.selectedSegmentIndex {
        case 0:
            myMap.mapType = MKMapType.standard
        case 1:
            myMap.mapType = MKMapType.satellite
        default:
            myMap.mapType = MKMapType.standard
        }
    }
    
    
//    @IBAction func gotoLondon(_ sender: Any) {
//        let lat = 51.5074
//        let long = -0.1278
//        let span = MKCoordinateSpanMake(0.075, 0.075)
//        let region = MKCoordinateRegion(center: CLLocationCoordinate2DMake(lat, long), span: span)
//        myMap.setRegion(region, animated: true)
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadCity()
        let span = MKCoordinateSpanMake(0.075, 0.075)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2DMake(0.7392, 0.9903), span: span)
        myMap.setRegion(region, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cityList.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cityList[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCity = cityList[row]
        let lat = selectedCity.lat
        let long = selectedCity.long
        let span = MKCoordinateSpanMake(0.075, 0.075)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2DMake(lat, long), span: span)
        myMap.setRegion(region, animated: true)
    }
}

