//
//  Constants.swift
//  Smack
//
//  Created by Manyuchi, Carrington C on 2024/09/10.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()


let BASE_URL = "https://chattychatjb.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"


// Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"



// User defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

