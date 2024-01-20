//
//  SetProfileViewController.swift
//  SeSAC4Recap
//
//  Created by Greed on 1/18/24.
//

import UIKit
import TextFieldEffects

class SetProfileViewController: UIViewController {
    
    let profileList: [String] = ["profile1", "profile2", "profile3", "profile4", "profile5", "profile6", "profile7", "profile8", "profile9", "profile10", "profile11", "profile12", "profile13", "profile14"]
    
    var isValidated: Bool = false
    
    let udManager = UserDefaultsManager.shared
    
    @IBOutlet var roundedProfileImage: UIImageView!
    @IBOutlet var camLogoImage: UIImageView!
    @IBOutlet var nicknameTextField: HoshiTextField!
    @IBOutlet var nickInfoLabel: UILabel!
    @IBOutlet var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setNavigation(text: "프로필 설정", backButton: true)
        setUI()
    }
     
}

extension SetProfileViewController {
    
    private func setDelegate() {
        
        nicknameTextField.delegate = self
    }
    
    private func setUI() {
        
        setBackgroundColor()
        
        let image = profileList[Int.random(in: 0...13)]
        udManager.userImage = image
        
        roundedProfileImage.image = UIImage(named: image)
        roundedProfileImage.setRoundProfileImage()
        
        camLogoImage.image = .camera
        
        nicknameTextField.placeholder = "닉네임을 입력해주세요 :)"
        nicknameTextField.placeholderFontScale = 1.3
        nicknameTextField.borderActiveColor = .point
        nicknameTextField.borderInactiveColor = .textColor
        nicknameTextField.placeholderColor = .systemGray
        nicknameTextField.textColor = .textColor
        nicknameTextField.backgroundColor = .backgroundColor
        
        nickInfoLabel.text = " "
        nickInfoLabel.font = .small
        nickInfoLabel.textColor = .point
        
        submitButton.setUI(text: "완료")
        submitButton.addTarget(self, action: #selector(submitButtonClicked), for: .touchUpInside)
        
    }
    
    @objc private func submitButtonClicked() {
        
        if isValidated {
            
            nickInfoLabel.text = "사용할 수 있는 닉네임입니다"
            
            let sb = UIStoryboard(name: storyboardName.main.rawValue, bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: tabBarName.mainTabBar.rawValue) as! UITabBarController
            
            udManager.nickname = nicknameTextField.text!
            udManager.userState = true
            
            navigationController?.pushViewController(vc, animated: true)
            
        } else {
            nickInfoLabel.text = "닉네임을 올바르게 입력해주세요"
        }
    }
    
}

// TODO: 로직 고치기
extension SetProfileViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        var text = textField.text
        if text!.count < 2 || text!.count >= 10 {
            nickInfoLabel.text = "2글자 이상 10글자 미만으로 설정해주세요"
            isValidated = false
        } else if text!.contains("@") || text!.contains("#") || text!.contains("$") || text!.contains("%") {
            nickInfoLabel.text = "닉네임에 @,#,$,% 는 포함할 수 없어요"
            isValidated = false
        } else if text!.contains("0") || text!.contains("1") || text!.contains("2") || text!.contains("3") || text!.contains("4") || text!.contains("5") || text!.contains("6") || text!.contains("7") || text!.contains("8") || text!.contains("9") {
            nickInfoLabel.text = "닉네임에 숫자는 포함할 수 없어요"
            isValidated = false
        } else {
            nickInfoLabel.text = nil
            isValidated = true
        }
        
        return true
    }
}
