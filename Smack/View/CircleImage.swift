//
//  CircleImage.swift
//  Smack
//
//  Created by Manyuchi, Carrington C on 2024/09/11.
//

import UIKit

@IBDesignable
class CircleImage: UIImageView {

    override  func awakeFromNib() {
        setupView()
        super.awakeFromNib()
    }

    func setupView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
    override  func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
}
