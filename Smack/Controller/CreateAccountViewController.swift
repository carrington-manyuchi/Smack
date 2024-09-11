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
    
    // Variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func closePressed(_ sender: UIButton) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func pickAvatarPressed(_ sender: UIButton) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func pickBackgroundColorPressed(_ sender: Any) {
    }
    
    @IBAction func createAccountPressed(_ sender: UIButton) {
        
        guard let name = usernameText.text, usernameText.text != "" else {
            return
        }
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
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor) { success in
                            if success {
                                print(UserDataService.instance.name)
                                print(UserDataService.instance.avatarName)
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                            }
                        }
                    }
                }
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == TO_AVATAR_PICKER {
            if let destinationVC =  segue.destination as?  AvatarPickerViewController {
                destinationVC.modalPresentationStyle = .fullScreen
            }
        }
    }
    
}
