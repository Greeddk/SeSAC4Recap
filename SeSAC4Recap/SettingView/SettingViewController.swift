//
//  SettingViewController.swift
//  SeSAC4Recap
//
//  Created by Greed on 1/20/24.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet var settingTableView: UITableView!
    
    let list = settingOptionsName.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setTableView()
    }

}

extension SettingViewController {
    
    private func setUI() {
        
        setBackgroundColor()
        setNavigation(text: "", backButton: false)
        tabBarController?.title = "설정"
        
    }
    
    private func setTableView() {
        
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.isScrollEnabled = false
        
        settingTableView.backgroundColor = .clear
        settingTableView.separatorColor = .systemGray
        
        let profileXib = UINib(nibName: SettingProfileTableViewCell.identifier, bundle: nil)
        settingTableView.register(profileXib, forCellReuseIdentifier: SettingProfileTableViewCell.identifier)
        
        let optionXib = UINib(nibName: SettingOptionTableViewCell.identifier, bundle: nil)
        settingTableView.register(optionXib, forCellReuseIdentifier: SettingOptionTableViewCell.identifier)
        
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        } else {
            return list.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingProfileTableViewCell.identifier, for: indexPath) as! SettingProfileTableViewCell
            cell.isOpaque = true
            cell.layer.opacity = 0.2
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: SettingOptionTableViewCell.identifier, for: indexPath) as! SettingOptionTableViewCell
            
            cell.configureCell(text: list[indexPath.row].rawValue)
            
            if indexPath.section == 0 || indexPath.row == 4 {
                
            } else {
                
                cell.selectionStyle = .none
                
            }
            
            return cell
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 100
        } else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.reloadRows(at: [indexPath], with: .fade)
        
        if indexPath.section == 0 {
            
           
        } else if indexPath.row == 4 {
            
            showAlert()
            
        }
        
    }
    
    func showAlert() {
        
        let alert = UIAlertController(title: "처음부터 시작하기", message: "데이터를 모두 초기화하시겠습니까?", preferredStyle: .alert)
        
        let comfirmButton = UIAlertAction(title: "확인", style: .default)
        let cancelButton = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(comfirmButton)
        alert.addAction(cancelButton)
        
        present(alert, animated: true)
    }
}
