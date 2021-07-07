//
//  ContentModel.swift
//  City Sights App
//
//  Created by Antonio Gormley on 07/07/2021.
//

import Foundation
import CoreLocation

class ContentModel:NSObject, CLLocationManagerDelegate, ObservableObject {
    
    var locationManger = CLLocationManager()
    
    override init() {
        super.init()
        //set content model as the delegate of tthe location manager
        locationManger.delegate = self
        
       //Request permission from user
        locationManger.requestWhenInUseAuthorization()
        
        

    }
    
    //MARK - Location manager delegete methods
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if locationManger.authorizationStatus == .authorizedAlways || locationManger.authorizationStatus ==  .authorizedWhenInUse {
            
            //start geolocating the user after permission
             locationManger.startUpdatingLocation()

            
            
        }
        else if locationManger.authorizationStatus == .denied{
            //we dont have permission
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //gives us the location  of  the user
       
        //stop updating location after we get it once
        locationManger.startUpdatingLocation()
        
        //if we have the coord send to yelp api
        
    }
    
}
