//
//  ProductDetailViewController.swift
//  SeSAC4Recap
//
//  Created by Greed on 1/20/24.
//

import UIKit
import WebKit

class ProductDetailViewController: UIViewController {
    
    @IBOutlet var productDetailWebView: WKWebView!
    
    var item: Item = Item(title: "", link: "", image: "", lprice: "", productId: "", mallName: "")
    
    var isFavorite: Bool = false {
        didSet {
            setFavoriteButton()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }

}

extension ProductDetailViewController {
    
    private func setUI() {
        
        setBackgroundColor()
        
        setNavigation(text: item.title, backButton: true)
        
        setFavoriteButton()
        
        // TODO: webkit
        guard let url = URL(string: "https://msearch.shopping.naver.com/product/\(item.productId)") else { return }
        productDetailWebView.load(URLRequest(url: url))
        
    }
    
    private func setFavoriteButton() {
        
        let favoriteButton = UIBarButtonItem(image: UIImage(systemName: isFavorite ? "heart.fill" : "heart"), style: .plain, target: self, action: #selector(favoriteButtonClicked))
        favoriteButton.tintColor = .textColor
        navigationItem.rightBarButtonItem = favoriteButton
        
    }
    
    @objc private func favoriteButtonClicked() {
        
        isFavorite.toggle()
    }
    
}
