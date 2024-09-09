//
//  ChannelViewController.swift
//  Smack
//
//  Created by Manyuchi, Carrington C on 2024/09/09.
//

import UIKit

class ChannelViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        self.revealViewController().toggleAnimationDuration = 2
    }
}
