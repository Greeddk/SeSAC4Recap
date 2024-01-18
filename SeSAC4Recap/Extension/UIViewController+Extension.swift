//
//  ViewController+Extension.swift
//  SeSAC4Recap
//
//  Created by Greed on 1/18/24.
//

import UIKit

extension UIViewController {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    func setBackgroundColor() {
        self.view.backgroundColor = .backgroundColor
    }
    
    func setNavigation(text: String, backButton: Bool) {
        
        navigationItem.title = text
//        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.textColor]
        
        navigationItem.setHidesBackButton(true, animated: true)
        
        if backButton {
            let image = UIImage(systemName: "chevron.left")
            let backButton = UIBarButtonItem(image: image, style: .plain, target: self, action:  #selector(backButtonClicked))
            backButton.tintColor = .textColor
            
            navigationItem.leftBarButtonItem = backButton
        }
        
    }
    
    @objc private func backButtonClicked() {
        
        navigationController?.popViewController(animated: true)
    }
}
