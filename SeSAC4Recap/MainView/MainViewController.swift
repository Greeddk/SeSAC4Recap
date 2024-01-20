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
    
    @IBOutlet var headerBackView: UIView!
    @IBOutlet var headerLabel: UILabel!
    @IBOutlet var allClearButton: UIButton!
    
    var udManager = UserDefaultsManager.shared
    
    var searchKeywords = UserDefaultsManager.shared.searchList {
        didSet {
            searchTableView.reloadData()
            setUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        configureTableView()
        configureTabBar()
    
    }

    @objc private func allClearButtonClicked() {
        
        searchKeywords = []
        udManager.searchList = []
        
    }
    
}

extension MainViewController {
    
    private func configureTabBar() {
        
        tabBarController?.tabBar.tintColor = .point
        tabBarController?.tabBar.unselectedItemTintColor = .systemGray
        
    }
    
    private func setUI() {
        
        setBackgroundColor()
        
        let nickname = UserDefaultsManager.shared.nickname
        setNavigation(text: "", backButton: false)
        tabBarController?.title = "떠나고싶은 \(nickname)님의 새싹쇼핑"
        
        headerBackView.backgroundColor = .clear
        
        setSearchBar()
        
        headerLabel.text = "최근 검색"
        headerLabel.font = .mediumBold
        
        allClearButton.setTitle("모두 지우기", for: .normal)
        allClearButton.titleLabel?.font = .medium
        allClearButton.addTarget(self, action: #selector(allClearButtonClicked), for: .touchUpInside)
        
        userSearchBar.text = ""
        
        if searchKeywords.isEmpty {
            
            headerLabel.textColor = .backgroundColor
            
            allClearButton.setTitleColor(.backgroundColor, for: .normal)
            
            searchTableView.allowsSelection = false
            
        } else {
            
            headerLabel.textColor = .textColor
            
            allClearButton.setTitleColor(.point, for: .normal)
        }
        
    }
    
    private func setSearchBar() {
        
        userSearchBar.barTintColor = .clear
        userSearchBar.searchTextField.leftView?.tintColor = .lightGray
        userSearchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "브랜드, 상품, 프로필, 태그 등", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        userSearchBar.searchTextField.textColor = .textColor
        userSearchBar.backgroundColor = .white

    }
    
    private func configureTableView() {
        
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.backgroundColor = .backgroundColor
        
        let emptyViewXib = UINib(nibName: MainImageTableViewCell.identifier, bundle: nil)
        
        searchTableView.register(emptyViewXib, forCellReuseIdentifier: MainImageTableViewCell.identifier)
        
        let keywordViewXib = UINib(nibName: MainKeywordTableViewCell.identifier, bundle: nil)
        
        searchTableView.register(keywordViewXib, forCellReuseIdentifier: MainKeywordTableViewCell.identifier)
        
        
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchKeywords.count != 0 ? searchKeywords.count : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if searchKeywords.isEmpty {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: MainImageTableViewCell.identifier) as! MainImageTableViewCell
            
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: MainKeywordTableViewCell.identifier, for: indexPath) as! MainKeywordTableViewCell
            
            var list = searchKeywords
            list.reverse()
            
            cell.configureCell(text: list[indexPath.row])
            cell.index = indexPath.row
            
            return cell
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if searchKeywords.isEmpty {
            return UIScreen.main.bounds.height / 2
        }
        
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // TODO: delete 버튼 눌렀을 땐 그 항목 삭제
        
        tableView.reloadRows(at: [indexPath], with: .fade)
        
        let vc = storyboard?.instantiateViewController(withIdentifier: SearchResultViewController.identifier) as! SearchResultViewController
        
        var list = searchKeywords
        list.reverse()
        
        let text = list[indexPath.row]
        
        udManager.searchKeyword = text
        
        vc.configureNavigationBar(text: text)
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension MainViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let text = searchBar.text, !text.isEmpty else { return }

        searchKeywords.append(text)
        udManager.searchList = searchKeywords
        udManager.searchKeyword = text
        
        let vc = storyboard?.instantiateViewController(withIdentifier: SearchResultViewController.identifier) as! SearchResultViewController
        
        vc.configureNavigationBar(text: text)
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
