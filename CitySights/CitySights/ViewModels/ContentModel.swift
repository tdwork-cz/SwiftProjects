//
//  ContentModel.swift
//  CitySights
//
//  Created by Тимофей Дудич on 4.03.22.
//

import Foundation
import CoreLocation

//NSObject just give abillity to the class to behave itself like and Objective-C class
class ContentModel:NSObject,ObservableObject,CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    
    //Because NSObject has its own constuctor and we need to override it
    override init() {
        super.init()
        //To track statuses and other thins of locationManager
        locationManager.delegate = self
        
        //Watch the user's location only when he is in the app
        locationManager.requestWhenInUseAuthorization()
    }
    
    // MARK - Location Manager Delegate Methods
    //Tells the app when the delegate manager is created
    //And when the status of location is changed (by user permission)
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        //This is enum of Statuses (denied, allowOnlyOnce and so on...)
        if locationManager.authorizationStatus == .authorizedAlways ||
            locationManager.authorizationStatus == .authorizedWhenInUse {
            //The method will do nothing, if user deny the permission
            locationManager.startUpdatingLocation()
        }
        else {
            
        }
    }
    
    //Gives us user's location. It's performed temporarily (if the location is constant)
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let userLocation = locations.first //The coordinates of the user
        {
            locationManager.stopUpdatingLocation()
            getBusinesses(category: "arts", location: userLocation)
            //getBusinesses(category: "restaurants", location: userLocation)
        }
    }
    
    //MARK - Yelp API methods:
    func getBusinesses(category:String, location:CLLocation) {
        //Here we have the base URL
        var urlComponents = URLComponents(string: "https://api.yelp.com/v3/businesses/search?")
        //Here we specifing the parameters
        urlComponents?.queryItems = [
            URLQueryItem(name: "longtitude", value:String(location.coordinate.longitude)),
            URLQueryItem(name: "latitude", value:String(location.coordinate.latitude)),
            URLQueryItem(name: "categories", value:category),
            URLQueryItem(name: "limit", value:"25")
        ]
        if let url = urlComponents?.url {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            //Adding value to the header field, which specicifes the request details
            request.addValue("Bearer OV-04NfkPB_LOkc8wWWSDivFDRi_UK-JbwJCwXZbH9wZ2UzFMv8j0aILJTCH3yZ2O0Ejp6uY73fgGOwF99O9bgzbAE8w3U4oSbIa6nHFMDIM45IDCLGN1_g7kWYmYnYx",
                             forHTTPHeaderField:"Authorization")
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request) { data, response, error in
                if error == nil {
                    
                }
                else {
                    print(error.self!)
                }
            }
            dataTask.resume()
        }
    }
}
