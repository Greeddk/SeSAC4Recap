//
//  SettingViewController.swift
//  SeSAC4Recap
//
//  Created by Greed on 1/20/24.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet var settingTableView: UITableView!
    
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
        
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
    
}
