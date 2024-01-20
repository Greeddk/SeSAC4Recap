//
//  MainKeywordTableViewCell.swift
//  SeSAC4Recap
//
//  Created by Greed on 1/19/24.
//

import UIKit

class MainKeywordTableViewCell: UITableViewCell {

    @IBOutlet var searchImageView: UIImageView!
    @IBOutlet var searchedKeyword: UILabel!
    @IBOutlet var deleteButton: UIButton!
    
    let udManager = UserDefaultsManager.shared
    
    var index: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUI()
    }
    
    @IBAction func deleteButtonClicked(_ sender: UIButton) {
        
        var list: [String] = udManager.searchList
        //TODO: Out of index 처리 필요
        list.reverse()
        list.remove(at: index)
        list.reverse()
        
        udManager.searchList = list
        
    }
    
}

extension MainKeywordTableViewCell {
    
    // TODO: 버튼 이미지 크기 변경
    private func setUI() {
        
        backgroundColor = .clear
        
        searchImageView.image = UIImage(systemName: "magnifyingglass")
        searchImageView.tintColor = .textColor
        
        searchedKeyword.textColor = .textColor
        searchedKeyword.font = .medium
        
        deleteButton.setTitle("", for: .normal)
        deleteButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        deleteButton.tintColor = .systemGray
        
    }
    
    func configureCell(text: String) {
        
        searchedKeyword.text = text
    }
    
    
}
