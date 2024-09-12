//
//  ChannelViewController.swift
//  Smack
//
//  Created by Manyuchi, Carrington C on 2024/09/09.
//

import UIKit

class ChannelViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    @IBOutlet weak var userImage: CircleImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        self.revealViewController().toggleAnimationDuration = 1
        NotificationCenter.default.addObserver(self, selector: #selector(userDataDidChange), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
    }
    
    @objc func userDataDidChange(_ notif: Notification) {
        if AuthService.instance.isLoggedIn {
            loginButton.setTitle(UserDataService.instance.name, for: .normal)
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            userImage.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        } else {
            loginButton.setTitle("Login", for: .normal)
            userImage.image = UIImage(named: "menuProfileIcon")
            userImage.backgroundColor = .clear
        }
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        if AuthService.instance.isLoggedIn {
            // show profile
            let profile = ProfileViewController()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true)
        } else {
            performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == TO_LOGIN {
            if let vc = segue.destination as? LoginViewController {
                vc.modalPresentationStyle = .fullScreen
            }
        }
    }
    
}
