//
//  CreateAccountViewController.swift
//  Smack
//
//  Created by Manyuchi, Carrington C on 2024/09/10.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var userImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func closePressed(_ sender: UIButton) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func pickAvatarPressed(_ sender: UIButton) {
    }
    
    @IBAction func pickBackgroundColorPressed(_ sender: Any) {
    }
    
    @IBAction func createAccountPressed(_ sender: UIButton) {
        guard let email = emailText.text, emailText.text != "" else {
            return
        }
        guard let password = passwordText.text, passwordText.text != "" else {
            return
        }
        
        AuthService.instance.registerUser(email: email, password: password) { success in
            if success {
                AuthService.instance.loginUser(email: email, password: password) { success in
                    if success {
                        print( "loggedIn User!", AuthService.instance.authToken)
                    }
                }
            }
        }
        
    }
    
}
