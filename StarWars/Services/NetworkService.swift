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
                    print("URL: \(url)")
                    if response.statusCode == 200 {
                        print("Data: \(data.description)")
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
    
//    func addTask(task: Task, onSuccess: @escaping (Tasks) -> Void, onFailure: @escaping (String) -> Void) {
//        let url = URL(string: "\(URL_BASE)\(URL_ADD_TODO)")
//
//        var request = URLRequest(url: url!)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//
//        do {
//            let body = try JSONEncoder().encode(task)
//            request.httpBody = body
//
//            let taskData = session.dataTask(with: request) { (data, response, error) in
//                DispatchQueue.main.async {
//
//                    if let error = error {
//                        onFailure(error.localizedDescription)
//                        return
//                    }
//
//                    guard let data = data, let response = response as? HTTPURLResponse else {
//                        onFailure("Invalid data or response")
//                        return
//                    }
//
//                    do {
//                        if response.statusCode == 200 {
//                            let items = try JSONDecoder().decode(Tasks.self, from: data)
//                            onSuccess(items)
//                        } else {
//                            let err = try JSONDecoder().decode(APIError.self, from: data)
//                            onFailure(err.message)
//                        }
//                    } catch {
//                        onFailure(error.localizedDescription)
//                    }
//                }
//
//
//            }
//            debugPrint("6")
//            taskData.resume()
//
//        } catch {
//
//        }
//
//
//    }
        
    
}
