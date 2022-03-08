//
//  ContentModel.swift
//  CitySights
//
//  Created by Тимофей Дудич on 4.03.22.
//

import Foundation
import CoreLocation

class ContentModel:NSObject,ObservableObject,CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    
    @Published var restaurants = [Business]()
    @Published var sights = [Business]()
    
    override init() {
        super.init()
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
    }
    
    // MARK - Location Manager Delegate Methods
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        if locationManager.authorizationStatus == .authorizedAlways ||
            locationManager.authorizationStatus == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
        else {
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let userLocation = locations.first
        {
            locationManager.stopUpdatingLocation()
            getBusinesses(category: Constants.restaurantsKey, location: userLocation)
            getBusinesses(category: Constants.sightsKey, location: userLocation)
        }
    }
    
    //MARK - Yelp API methods:
    func getBusinesses(category:String, location:CLLocation) {
        var urlComponents = URLComponents(string: Constants.apiUrl)
        urlComponents?.queryItems = [
            URLQueryItem(name: "latitude", value: String(location.coordinate.latitude)),
            URLQueryItem(name: "longitude", value:String(location.coordinate.longitude)),
            URLQueryItem(name: "categories", value:category),
            URLQueryItem(name: "limit", value:"25")
        ]
        if let url = urlComponents?.url {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("Bearer \(Constants.apiKey)",
                             forHTTPHeaderField:"Authorization")
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request) { data, response, error in
                if error == nil {
                    do {
                        let decoder = JSONDecoder()
                        let businessData = try decoder.decode(BusinessSearch.self, from: data!)
                        
                        DispatchQueue.main.async {
                            switch category {
                                case Constants.sightsKey :
                                    self.sights = businessData.businesses
                                case Constants.restaurantsKey:
                                    self.restaurants = businessData.businesses
                                default:
                                    break
                            }
                        }
                    }
                    catch {
                        print(error)
                    }
                }
                else {
                    print(error.self!)
                }
            }
            dataTask.resume()
        }
    }
}
