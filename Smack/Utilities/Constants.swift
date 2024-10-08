//
//  Constants.swift
//  Smack
//
//  Created by Manyuchi, Carrington C on 2024/09/10.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

// URL Constants
let BASE_URL = "https://chattychatjb.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)account/add"


// Colors
let smackPurplePlaceholder = #colorLiteral(red: 0.5568627451, green: 0.4980392157, blue: 0.8901960784, alpha: 0.5035440811)

//Notification Constants
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUderDataChanged")

// Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER  = "toAvatarPicker"

// User defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

// Headers

let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]
