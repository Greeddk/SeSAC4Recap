//
//  UIImageView+Extension.swift
//  SeSAC4Recap
//
//  Created by Greed on 1/18/24.
//

import UIKit

extension UIImageView {
    
    func setRoundProfileImage() {
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.borderWidth = 4
        self.layer.borderColor = UIColor.point.cgColor
    }
}
