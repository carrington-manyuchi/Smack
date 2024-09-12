//
//  ProfileViewController.swift
//  Smack
//
//  Created by Manyuchi, Carrington C on 2024/09/12.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func setupViews() {
        profileImage.image = UIImage(named: UserDataService.instance.avatarName)
        profileImage.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        userName.text = UserDataService.instance.name
        userName.text = UserDataService.instance.email
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(closeTap))
        view.addGestureRecognizer(closeTouch)
        
    }
    
    
    @objc func closeTap() {
        dismiss(animated: true)
    }

    @IBAction func closeModalPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func logoutPressed(_ sender: UIButton) {
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        dismiss(animated: true)
    }
    
    
    
}
