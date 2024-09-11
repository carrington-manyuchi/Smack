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
    var bgColor: UIColor?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if UserDataService.instance.avatarName != "" {
            userImageView.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
            if avatarName.contains("light") &&  bgColor == nil {
                userImageView.backgroundColor = .lightGray
            }
        }
    }
    
    
    private func setupView() {
        usernameText.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedString.Key.foregroundColor: smackPurplePlaceholder])
        emailText.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedString.Key.foregroundColor: smackPurplePlaceholder])
        passwordText.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor: smackPurplePlaceholder])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }

    @IBAction func closePressed(_ sender: UIButton) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func pickAvatarPressed(_ sender: UIButton) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func pickBackgroundColorPressed(_ sender: Any) {
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        
        bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        UIView.animate(withDuration: 0.3) {
            self.userImageView.backgroundColor = self.bgColor
        }
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
