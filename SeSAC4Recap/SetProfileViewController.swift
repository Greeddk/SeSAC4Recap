//
//  SetProfileViewController.swift
//  SeSAC4Recap
//
//  Created by Greed on 1/18/24.
//

import UIKit
import TextFieldEffects

class SetProfileViewController: UIViewController {

    let profileList: [UIImage] = [.profile1, .profile2, .profile3, .profile4, .profile5, .profile6, .profile7, .profile8, .profile9, .profile10, .profile11, .profile12, .profile13, .profile14]
    
    @IBOutlet var roundedProfileImage: UIImageView!
    @IBOutlet var camLogoImage: UIImageView!
    @IBOutlet var nicknameTextField: HoshiTextField!
    @IBOutlet var nickInfoLabel: UILabel!
    @IBOutlet var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigation(text: "프로필 설정")
        setUI()
    }
    
}

extension SetProfileViewController {
     
    private func setUI() {
        
        setBackgroundColor()
        
        roundedProfileImage.image = profileList[Int.random(in: 0...13)]
        roundedProfileImage.layer.borderWidth = 4
        roundedProfileImage.layer.borderColor = UIColor.point.cgColor
        roundedProfileImage.setRoundImage()
        
        camLogoImage.image = .camera
        
        nicknameTextField.placeholder = "닉네임을 입력해주세요 :)"
        nicknameTextField.placeholderFontScale = 1.3
        nicknameTextField.borderActiveColor = .point
        nicknameTextField.borderInactiveColor = .textColor
        nicknameTextField.placeholderColor = .systemGray
        nicknameTextField.textColor = .textColor
        nicknameTextField.backgroundColor = .backgroundColor
        
        nickInfoLabel.text = "닉네임에 @ 포함 안되셈!!"
        nickInfoLabel.font = .small
        nickInfoLabel.textColor = .point
        
        submitButton.setUI(text: "완료")
    }
    
    private func nicknameInspect() {
        
    }
    
}
