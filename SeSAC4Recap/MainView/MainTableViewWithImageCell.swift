//
//  MainTableViewWithImageCell.swift
//  SeSAC4Recap
//
//  Created by Greed on 1/18/24.
//

import UIKit

class MainTableViewWithImageCell: UITableViewCell {
    
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var infoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainImageView.image = .empty
        infoLabel.text = "최근 검색어가 없어요"
        infoLabel.font = .largeTitleBold
        infoLabel.textAlignment = .center
        
    }
    
}
