//
//  AuthService.swift
//  Smack
//
//  Created by Manyuchi, Carrington C on 2024/09/10.
//

import Foundation
import Alamofire
import SwiftyJSON


class AuthService {
    
    // singleton - is going to be accessed globally. it can only be one instance at a time
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    var isLoggedIn: Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.setValue(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken: String {
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set {
            defaults.setValue(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail: String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            defaults.setValue(newValue, forKey: USER_EMAIL)
        }
    }
    
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler) {
        let lowerCaseEmail = email.lowercased()
        
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        AF.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HTTPHeaders(HEADER)).responseJSON { response in
            switch response.result {
            case .success:
                // Check if status code is 200 OK (or whatever success code you expect)
                if let statusCode = response.response?.statusCode, statusCode == 200 {
                    completion(true)
                } else {
                    completion(false)
                }
                
            case .failure(let error):
                // Pass the error to the completion handler or log it
                print("Error registering user: \(error.localizedDescription)")
                completion(false)
            }
        }
    }
    
    
    func loginUser(email: String, password: String, completion: @escaping CompletionHandler) {
        
        let lowercaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "email": lowercaseEmail,
            "password": password
        ]

        AF.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HTTPHeaders(HEADER)).responseJSON { response in
                    
            switch response.result {
            case .success:
                // Check if status code is 200 OK (or whatever success code you expect)
                if let statusCode = response.response?.statusCode, statusCode == 200 {
                    do {
                        guard let data = response.data else { return }
                        let json = try JSON(data: data)
                        self.userEmail = json["user"].stringValue
                        self.authToken = json["token"].stringValue
                        self.isLoggedIn = true
                        completion(true)
                    } catch {
                        print("Error parsing JSON: \(error.localizedDescription)")
                        completion(false)
                    }
                } else {
                    completion(false)
                }
                
            case .failure(let error):
                // Pass the error to the completion handler or log it
                print("Error logging in user: \(error.localizedDescription)")
                completion(false)
            }
        }

    }
    
    func createUser(name: String, email: String, avatarName: String, avatarColor: String, completion: @escaping CompletionHandler) {
        
        let lowercasedEmail = email.lowercased()
        
        let body: [String: Any] = [
            "name": name,
            "email": lowercasedEmail,
            "avatarName": avatarName,
            "avatarColor": avatarColor
        ]
        
        let header = [
            "Authorisation": "Bearer \(AuthService.instance.authToken)",
            "Content-Type": "application/json; charset=utf-8"
        ]
        
        AF.request(URL_USER_ADD, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HTTPHeaders(HEADER)).responseJSON { response in
            switch response.result {
            case .success:
                // Check if status code is 200 OK (or whatever success code you expect)
                if let statusCode = response.response?.statusCode, statusCode == 200 {
                    do {
                        guard let data = response.data else { return }
                        let json = try JSON(data: data)
                        let id = json["_id"].stringValue
                        let color = json["avatarColor"].stringValue
                        let email = json["email"].stringValue
                        let avatarName = json["avatarName"].stringValue
                        let name = json["name"].stringValue
                        
                        UserDataService.instance.setUserData(id: id, color: color, avatarName: avatarName, email: email, name: name)

                        completion(true)
                    } catch {
                        print("Error parsing JSON: \(error.localizedDescription)")
                        completion(false)
                    }
                } else {
                    completion(false)
                }
                
            case .failure(let error):
                // Pass the error to the completion handler or log it
                print("Error logging in user: \(error.localizedDescription)")
                completion(false)
            }
        }
    }
    
}
