//
//  NetworkService.swift
//  StarWars
//
//  Created by Serena Lambert on 16/11/2019.
//  Copyright © 2019 Serena Lambert. All rights reserved.
//

import Foundation

class NetworkService {
    
    static let instance = NetworkService()
    
    let URL_BASE = "http://swapi.co/api"
    let URL_PEOPLE = "/people"
    let URL_VEHICLES = "/vehicles"
    
    let session = URLSession(configuration: .default)
    
    func getPeople(onSuccess: @escaping ([Person]) -> Void, onFailure: @escaping (String) -> Void) {
        
        let url = URL(string: "\(URL_BASE)\(URL_PEOPLE)")!
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            DispatchQueue.main.async {
                
                if let error = error {
                    debugPrint("Error getting tasks: \(error.localizedDescription)")
                    return
                }
                
                guard let data = data, let response = response as? HTTPURLResponse else {
                    debugPrint("Invalid data or response returned")
                    return
                }
                
                do {
                    if response.statusCode == 200 {
                        let people = try JSONDecoder().decode(People.self, from: data)
                        onSuccess(people.results)
                    } else {
                        onFailure("response.statusCode is not 200")
                    }
                } catch {
                    onFailure("error decoding JSON: \(error.localizedDescription)")
                }
                
            }
            
        }
        task.resume()
    }

    
    func getVehicles(onSuccess: @escaping ([Vehicle]) -> Void, onFailure: @escaping (String) -> Void) {
        
        let url = URL(string: "\(URL_BASE)\(URL_VEHICLES)")!
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            DispatchQueue.main.async {
                
                if let error = error {
                    debugPrint("Error getting tasks: \(error.localizedDescription)")
                    return
                }
                
                guard let data = data, let response = response as? HTTPURLResponse else {
                    debugPrint("Invalid data or response returned")
                    return
                }
                
                do {
                    if response.statusCode == 200 {
                        let vehicles = try JSONDecoder().decode(Vehicles.self, from: data)
                        onSuccess(vehicles.results)
                    } else {
                        onFailure("response.statusCode is not 200")
                    }
                } catch {
                    onFailure("error decoding JSON: \(error.localizedDescription)")
                }
                
            }
            
        }
        task.resume()
    }
    
    
    
}
