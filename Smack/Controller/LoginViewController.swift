//
//  LoginViewViewController.swift
//  Smack
//
//  Created by Manyuchi, Carrington C on 2024/09/10.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closeButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func createAccountButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == TO_CREATE_ACCOUNT {
            if let vc = segue.destination as? CreateAccountViewController {
                vc.modalPresentationStyle = .fullScreen
            }
        }
    }
    
}
