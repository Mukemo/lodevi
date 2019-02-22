//
//  Constants.swift
//  lodevi
//
//  Created by apple on 26/12/18.
//  Copyright © 2018 apple. All rights reserved.
//

import Foundation

//typealias for the callback in success register and login function
typealias callback = (_ success: Bool) -> ()

//BASE URL
let BASE_URL_LODEVI = "https://app.lodevi.net/api"
// Boolean auth UserDefaults keys
let DEFAULTS_REGISTERED = "isRegistered"
let DEFAULTS_AUTHENTICATED = "isAuthenticated"

// Auth Email
let DEFAULTS_NAME = "email"
// Auth Phone Number
let DEFAULTS_PHONE = "phone"
// Auth Token
let DEFAULTS_TOKEN = "authToken"


let POST_USER_REGISTER = "\(BASE_URL_LODEVI)/user/register"
let POST_USER_LOGIN = "\(BASE_URL_LODEVI)/user/token"
//Getting all artists
let GET_ALL_ARTISTS = "\(BASE_URL_LODEVI)/authors"
//Getting all categories
let GET_ALL_CATEGORY = "\(BASE_URL_LODEVI)/categories"
//Getting all the collection
let GET_ALL_COLLECTION = "\(BASE_URL_LODEVI)/collections"
//Getting all contents
let GET_ALL_CONTENT = "\(BASE_URL_LODEVI)/content"
