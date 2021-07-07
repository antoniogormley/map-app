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
    
    @Published var restraurants = [Business]()
    @Published var sights = [Business]()

    
    override init() {
        super.init()
        //set content model as the delegate of tthe location manager
        locationManger.delegate = self
        
       //Request permission from user
        locationManger.requestWhenInUseAuthorization()
        
        

    }
    
    //MARK: - Location manager delegete methods
    
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
        let userLocation = locations.first
        if userLocation != nil {
            //we have location
            
            //stop updating location after we get it once
            locationManger.startUpdatingLocation()
            //if we have the coord send to yelp api
            getBusinesses(category: Constants.sightsKey, location: userLocation!)
            getBusinesses(category: Constants.restaurantsKey, location: userLocation!)

        }
    }
    //MARK: - Yelp API methods
    func getBusinesses(category:String,location:CLLocation) {
        //create url
        var urlComponents = URLComponents(string: Constants.apiURL)
        urlComponents?.queryItems = [
            URLQueryItem(name: "latitude", value: String(location.coordinate.latitude)),
            URLQueryItem(name: "longitude", value: String(location.coordinate.longitude)),
            URLQueryItem(name: "categories", value: category),
            URLQueryItem(name: "limit", value: "6")
            ]
        let url = urlComponents?.url
        
        if let url = url {
        //create url request
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            request.httpMethod = "GET"
            request.addValue("Bearer \(Constants.apiKey)", forHTTPHeaderField: "Authorization")
        //get urlsession
            let session = URLSession.shared
        //create data task
            let dataTask = session.dataTask(with: request) { data, response, error in
                //check there isnt an error
                if error == nil {
                   
                    //parse json
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(BusinessSearch.self,from: data!)
                        DispatchQueue.main.async {
                            //assign results to appropriate property

                            if category == Constants.sightsKey {
                                self.sights = result.businesses
                            }
                            else if category == Constants.restaurantsKey {
                                self.restraurants = result.businesses
                            }
                        }
                        
                    }catch{
                        print(error)
                    }
                }
            }
        //start data task
            dataTask.resume()
            
        }
    }
}
