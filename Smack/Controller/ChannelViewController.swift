//
//  ChannelViewController.swift
//  Smack
//
//  Created by Manyuchi, Carrington C on 2024/09/09.
//

import UIKit

class ChannelViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        self.revealViewController().toggleAnimationDuration = 2
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    
}
