//
//  SettingProfileTableViewCell.swift
//  SeSAC4Recap
//
//  Created by Greed on 1/20/24.
//

import UIKit

class SettingProfileTableViewCell: UITableViewCell {

    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var nicknameLabel: UILabel!
    @IBOutlet var userFavoriteInfoLabel: UILabel!
    
    let udManager = UserDefaultsManager.shared
    let favoriteCount = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUI()
    }

}

extension SettingProfileTableViewCell {
    
    private func setUI() {
        
        backgroundColor = .backViewColor
        
        profileImageView.setRoundProfileImage()
        profileImageView.image = UIImage(named: udManager.userImage)
        
        nicknameLabel.font = .largeTitleBold
        nicknameLabel.textColor = .textColor
        nicknameLabel.text = udManager.nickname
        
        userFavoriteInfoLabel.font = .largeBold
        userFavoriteInfoLabel.textColor = .textColor
        let text = "\(favoriteCount)개의 상품을 좋아하고 있어요!"
        userFavoriteInfoLabel.text = text
        changeTextColor(text: text)
        
    }
    
    private func changeTextColor(text: String) {
        
        let attributeString = NSMutableAttributedString(string: text)
        
        attributeString.addAttribute(.foregroundColor, value: UIColor.point, range: (text as NSString).range(of: "\(favoriteCount)개의 상품"))
        
        userFavoriteInfoLabel.attributedText = attributeString
    }
    
}
