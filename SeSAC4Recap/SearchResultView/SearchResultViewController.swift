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
    
    let searchManager = NaverAPIManager()
    let udManager = UserDefaultsManager.shared
    
    var shoppingList = ShoppingList(total: 0, start: 0, display: 0, items: []) {
        didSet {
            searchResultCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let text = udManager.searchKeyword
        //이 코드는 왜 안될까요..? completionhandler가 단순히 파라미터가 아니라 escaping 과 관련이 있어서 그런걸까요?
        //        searchManager.callRequest(text: list.last!, completionhandler: { value in
        //            self.shoppingList = value
        //        })
        searchManager.callRequest(text: text) { value in
            self.shoppingList = value
            self.numberOfResultLabel.text = "\(self.shoppingList.total) 개의 검색 결과"
        }
        
        setUI()
        configureCollectionView()
        
    }
    
}

extension SearchResultViewController {
    
    func setUI() {
        
        setBackgroundColor()
        
        numberOfResultLabel.textColor = .point
        numberOfResultLabel.font = .medium
        
        configureFilterButton(button: accurateFilterButton, text: "정확도")
        configureFilterButton(button: dateFilterButton, text: "날짜순")
        configureFilterButton(button: highPriceFilterButton, text: "가격높은순")
        configureFilterButton(button: lowPriceFilterButton, text: "가격낮은순")
    }
    
    func configureNavigationBar(text: String) {
        
        setNavigation(text: text, backButton: true)
    }
    
    func configureCollectionView() {
        
        searchResultCollectionView.dataSource = self
        searchResultCollectionView.delegate = self
        
        searchResultCollectionView.backgroundColor = .clear
        
        let xib = UINib(nibName: SearchResultCollectionViewCell.identifier, bundle: nil)
        searchResultCollectionView.register(xib, forCellWithReuseIdentifier: SearchResultCollectionViewCell.identifier)
        
        let spacing: CGFloat = 10
        let cellWidth = UIScreen.main.bounds.width - spacing * 3
        let cellHeight = UIScreen.main.bounds.height - spacing * 3
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.itemSize = CGSize(width: cellWidth / 2 , height: cellHeight / 3)
        
        searchResultCollectionView.collectionViewLayout = layout
        
    }
    
    func configureFilterButton(button: UIButton, text: String) {
        
        button.setTitle(text, for: .normal)
        button.setTitleColor(.textColor, for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .backgroundColor
        button.layer.borderColor = UIColor.textColor.cgColor
        button.layer.borderWidth = 1
    }
}

extension SearchResultViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingList.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCollectionViewCell.identifier, for: indexPath) as! SearchResultCollectionViewCell
        
        cell.configureCell(item: shoppingList.items[indexPath.item])
        
        return cell
    }
    // TODO: 웹킷뷰와 연결 및 네비게이션 타이틀 상품이름으로
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: ProductDetailViewController.identifier) as! ProductDetailViewController
        
        vc.item = shoppingList.items[indexPath.item]
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
