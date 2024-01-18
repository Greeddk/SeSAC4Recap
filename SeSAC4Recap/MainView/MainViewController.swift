//
//  MainViewController.swift
//  SeSAC4Recap
//
//  Created by Greed on 1/18/24.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var userSearchBar: UISearchBar!
    @IBOutlet var searchTableView: UITableView!
    
    var searchKeywords: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        configureTableView()
    }
    

}

extension MainViewController {
    
    private func setUI() {
        
        setBackgroundColor()
        
        let nickname = UserDefaultsManager.shared.nickname
        setNavigation(text: "떠나고싶은 \(nickname)님의 새싹쇼핑", backButton: false)
        
        userSearchBar.placeholder = "브랜드, 상품, 프로필, 태그 등"
        
    }
    
    private func configureTableView() {
        
        searchTableView.delegate = self
        searchTableView.dataSource = self
        
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchKeywords.count != 0 ? searchKeywords.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
