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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }
    

}

extension ProductDetailViewController {
    
    private func setUI() {
        
        setBackgroundColor()
        
        // TODO: webkit
    }
}
