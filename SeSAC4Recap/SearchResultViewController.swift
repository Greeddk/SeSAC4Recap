//
//  SearchResultViewController.swift
//  SeSAC4Recap
//
//  Created by Greed on 1/19/24.
//

import UIKit

class SearchResultViewController: UIViewController {

    
    @IBOutlet var numberOfResultLabel: UILabel!
    
    @IBOutlet var accurateFilterButton: UIButton!
    @IBOutlet var dateFilterButton: UIButton!
    @IBOutlet var highPriceFilterButton: UIButton!
    @IBOutlet var lowPriceFilterButton: UIButton!
    
    @IBOutlet var searchResultCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }

}

extension SearchResultViewController {
    
    func setUI() {
        
        setBackgroundColor()
        
        
        
    }
    
    func configureView(text: String) {
        
        setNavigation(text: text, backButton: true)
    }
}
