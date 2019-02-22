//
//  AuthService.swift
//  lodevi
//
//  Created by apple on 26/12/18.
//  Copyright © 2018 apple. All rights reserved.
//

import Foundation


class AuthService{
    static let instance = AuthService()
    let defaults = UserDefaults.standard
    
    var isRegistered: Bool? {
        get {
            return defaults.bool(forKey: DEFAULTS_REGISTERED) == true
        }
        set {
            defaults.set(newValue, forKey: DEFAULTS_REGISTERED)
        }
    }
    
    var isAuthenticated: Bool? {
        get {
            return defaults.bool(forKey: DEFAULTS_AUTHENTICATED) == true
        }
        set {
            defaults.set(newValue, forKey: DEFAULTS_AUTHENTICATED)
        }
    }
    
    var name: String? {
        get {
            return defaults.value(forKey: DEFAULTS_NAME) as? String
        }
        set {
            defaults.set(newValue, forKey: DEFAULTS_NAME)
        }
    }
    
    var phone: String? {
        get{
            return defaults.value(forKey: DEFAULTS_PHONE) as? String
        }
        set {
            defaults.set(newValue, forKey: DEFAULTS_PHONE)
        }
    }
    
    var authToken: String? {
      get {
          return defaults.value(forKey: DEFAULTS_TOKEN) as? String
    
      }
         set {
            defaults.set(newValue, forKey: DEFAULTS_TOKEN)
         }
      }
    
    
    func registerUser(username: String, password: String, telephone: String, completion: @escaping callback) {
        
        let json = [
            "username": username,
            "plain_password": password,
            "tel": telephone
            ] as [String : Any]
        
        
        let sessionConfig = URLSessionConfiguration.default
        
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        guard let URL = URL(string: POST_USER_REGISTER) else {
            isRegistered = false
            completion(false)
            return
        }
        var request = URLRequest(url: URL)
        
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
           do {
             guard let jsonData = try? JSONSerialization.data(withJSONObject: json) else {
               return
              }
            
           
    
            request.httpBody = jsonData
            let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
                if (error == nil) {
                    // Success
                    print(request)
                    let statusCode = (response as! HTTPURLResponse).statusCode
                    print("URL Session Task Succeeded: HTTP \(statusCode)")

                    //bad request solving problem
                    if statusCode == 400 {
                        print("An error occured with status code \(statusCode)")
                        completion(false)
                        return
                    }
                    // Check for status 200 or 409
                    if statusCode != 200 && statusCode != 409 {
                        self.isRegistered = false
                        completion(false)
                        return
                    } else {
                        self.isRegistered = true
                        completion(true)
                    }
                } else {
                    // Failure
                    print("URL Session Task Failed: \(error?.localizedDescription)")
                    completion(false)
                }
//                if let data = data {
//                    do{
//                        let json = try? JSONSerialization.jsonObject(with: data, options: [])
//                        print("Yay")
//                        print(json!)
//                    } catch let error{
//                        print("An error")
//                        print(error.localizedDescription)
//                    }
//                }
//                if let response = response {
//                   print((response as! HTTPURLResponse).statusCode)
//                }
            })
            task.resume()
            session.finishTasksAndInvalidate()
            
        } catch let err {
            self.isRegistered = false
            completion(false)
            print(err)
        }
    }
  
   // //app.lodevi.net/api/user/register
    
    func login(username:String, password: String, completion: @escaping callback){
        let json = ["username": username, "plain_password": password]
        
        let sessionConfig = URLSessionConfiguration.default
        
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        guard let URL = URL(string: POST_USER_LOGIN) else {
            isAuthenticated = false
            completion(false)
            return
        }
        var bearer = username.data(using: .utf8)?.base64EncodedString()
        var request = URLRequest(url: URL)
        
        request.httpMethod = "POST"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: json, options: [])
            
            let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
                if (error == nil) {
                    // Success
                    let statusCode = (response as! HTTPURLResponse).statusCode
                    print("URL Session Task Succeeded: HTTP \(statusCode)")
                    if statusCode != 200 {
                        // Failed
                        print("Not 200 Status")
                        completion(false)
                        return
                    } else {
                        guard let data = data else {
                            completion(false)
                            return
                        }
                        do {
                            let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Dictionary<String, AnyObject>
                            if result != nil {
                                print(result)
                                if let username = result?["username"] as? String {
                                    if let token = result?["token"] as? String {
                                        // Successfully authenticated and have a token
                                        self.name = username
                                        self.authToken = token
                                        self.isRegistered = true
                                        self.isAuthenticated = true
                                        completion(true)
                                    } else {
                                        completion(false)
                                    }
                                } else {
                                    completion(false)
                                }
                            } else {
                                completion(false)
                            }
                        } catch let err {
                            completion(false)
                            print(err)
                        }
                    }
                } else {
                    // Failure
                    print("URL Session Task Failed: \(error!.localizedDescription)")
                    completion(false)
                    return
                }
            })
            task.resume()
            session.finishTasksAndInvalidate()
            
        } catch let err {
            completion(false)
            print(err)
        }
    }
}
