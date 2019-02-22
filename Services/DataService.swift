//
//  DataService.swift
//  lodevi
//
//  Created by apple on 02/02/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
protocol DataServiceDelegate:class{
    func artistLoaded()
    func categoryLoaded()
    func collectionLoaded()
}

class DataService{
    static let instance = DataService()
    weak var delegate: DataServiceDelegate?
    var artists = [Artist]()
    var categories = [Category]()
    var collections = [Collection]()
    let defaults = UserDefaults.standard
    
    //Getting all the artists
   func getAllArtists(completion: @escaping callback){
        //preparing the name
        let userName = defaults.string(forKey: DEFAULTS_NAME)
        //create a URLSessionConfig
        let sessionConfig = URLSessionConfiguration.default
        
        //create a URLsession
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        guard let URL = URL(string: GET_ALL_ARTISTS) else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        
        guard let token = AuthService.instance.authToken else {
            completion(false)
            return
        }
    
        let encodedName = (userName?.data(using: .utf8)?.base64EncodedString())!
        request.addValue("Bearer \(encodedName).\(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
    
        let task = session.dataTask(with: request) { (data: Data?, response:URLResponse?, error: Error?) -> Void in
            if error == nil {
                //success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("Bearer \(encodedName).\(token)")
                print("URLSession succeeded \(statusCode)")
                print("Response \(String(describing: response))")

                if let data = data {
                self.artists = Artist.parseArtistJSONData(data: data)
                print(self.artists)
                self.delegate?.artistLoaded()
            } else{
                print("URLSession failde \(String(describing: error?.localizedDescription))")
            }
            
        }
    }
    task.resume()
    session.finishTasksAndInvalidate()
 }
func getAllCategories(completion: @escaping callback){
        //preparing the name
        let userName = defaults.string(forKey: DEFAULTS_NAME)
        //create a URLSessionConfig
        let sessionConfig = URLSessionConfiguration.default
        
        //create a URLsession
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        guard let URL:URL = URL(string: GET_ALL_CATEGORY) else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        
        guard let token = AuthService.instance.authToken else {
            completion(false)
            return
        }
        let encodedName = (userName?.data(using: .utf8)?.base64EncodedString())!
        request.addValue("Bearer \(encodedName).\(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
    
        let task = session.dataTask(with: request) { (data: Data?, response:URLResponse?, error: Error?) -> Void in
            if error == nil {
                //success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URLSession succeeded \(statusCode)")
                print("Response \(String(describing: response))")
                if let data = data {
                self.categories = Category.parseCategoryJSONData(data: data)
                print(self.categories)
                self.delegate?.categoryLoaded()
                }
            } else{
                print("URLSession failde \(String(describing: error?.localizedDescription))")
            }
            
        }
        task.resume()
        session.finishTasksAndInvalidate()
    }
    
    //get All Collection function
    func getAllCollections(completion: @escaping callback){
        //preparing the name
        let userName = defaults.string(forKey: DEFAULTS_NAME)
        //create a URLSessionConfig
        let sessionConfig = URLSessionConfiguration.default
        
        //create a URLsession
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        guard let URL:URL = URL(string: GET_ALL_COLLECTION) else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        
        guard let token = AuthService.instance.authToken else {
            completion(false)
            return
        }
        let encodedName = (userName?.data(using: .utf8)?.base64EncodedString())!
        request.addValue("Bearer \(encodedName).\(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request) { (data: Data?, response:URLResponse?, error: Error?) -> Void in
            if error == nil {
                //success
                print("Yay!!!")
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URLSession succeeded \(statusCode)")
                print("Response \(String(describing: response))")
                if let data = data {
                    self.collections = Collection.parseCollectionJSONData(data: data)
                    print(self.collections)
                    self.delegate?.collectionLoaded()
                }
            } else{
                print("URLSession failed \(String(describing: error?.localizedDescription))")
            }
            
        }
        task.resume()
        session.finishTasksAndInvalidate()
    }
    
    func getAllContents(completion: @escaping callback){
        //preparing the name
        let userName = defaults.string(forKey: DEFAULTS_NAME)
        //create a URLSessionConfig
        let sessionConfig = URLSessionConfiguration.default
        
        //create a URLsession
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        guard let URL:URL = URL(string: GET_ALL_CONTENT) else {return}
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        
        guard let token = AuthService.instance.authToken else {
            completion(false)
            return
        }
        let encodedName = (userName?.data(using: .utf8)?.base64EncodedString())!
        request.addValue("Bearer \(encodedName).\(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request) { (data: Data?, response:URLResponse?, error: Error?) -> Void in
            if error == nil {
                //success
                print("Yay!!!")
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URLSession succeeded \(statusCode)")
                print("Response \(String(describing: response))")
                if let data = data {
                    self.collections = Collection.parseCollectionJSONData(data: data)
                    print(self.collections)
                    self.delegate?.collectionLoaded()
                }
            } else{
                print("URLSession failed \(String(describing: error?.localizedDescription))")
            }
            
        }
        task.resume()
        session.finishTasksAndInvalidate()
    }
}
