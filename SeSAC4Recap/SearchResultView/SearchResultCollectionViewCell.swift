//
//  SearchResultCollectionViewCell.swift
//  SeSAC4Recap
//
//  Created by Greed on 1/19/24.
//

import UIKit
import Kingfisher

class SearchResultCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var itemImageView: UIImageView!
    @IBOutlet var favoriteButton: UIImageView!
    @IBOutlet var shoppingmallLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUI()
    }

}

extension SearchResultCollectionViewCell {
    
    private func setUI() {
        
        backgroundColor = .clear
        
        itemImageView.layer.cornerRadius = 10
        itemImageView.contentMode = .scaleToFill
        
        shoppingmallLabel.font = .small
        shoppingmallLabel.textColor = .systemGray
        
        nameLabel.numberOfLines = 2
        nameLabel.font = .medium
        nameLabel.textColor = .systemGray4
        
        priceLabel.font = .mediumTitle
        priceLabel.textColor = .systemGray6
        
        favoriteButton.image = UIImage(systemName: "heart")
        favoriteButton.tintColor = .black
        favoriteButton.backgroundColor = .textColor
        favoriteButton.layer.cornerRadius = favoriteButton.frame.width / 2
    }
    
    func configureCell(item: Item) {
        
        let url = URL(string: item.image)
        itemImageView.kf.setImage(with: url)
        
        shoppingmallLabel.text = item.mallName
        
        nameLabel.text = item.title
        
        priceLabel.text = item.lprice
        
    }
    
}
