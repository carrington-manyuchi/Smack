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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        self.revealViewController().toggleAnimationDuration = 1
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == TO_LOGIN {
            if let vc = segue.destination as? LoginViewController {
                vc.modalPresentationStyle = .fullScreen
            }
        }
    }
    
}
