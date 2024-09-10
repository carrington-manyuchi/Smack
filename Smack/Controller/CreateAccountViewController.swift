//
//  CreateAccountViewController.swift
//  Smack
//
//  Created by Manyuchi, Carrington C on 2024/09/10.
//

import UIKit

class CreateAccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func closePressed(_ sender: UIButton) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
}
