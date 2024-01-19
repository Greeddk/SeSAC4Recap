//
//  APIManager.swift
//  SeSAC4Recap
//
//  Created by Greed on 1/19/24.
//

import Foundation
import Alamofire

struct NaverAPIManager {
    
    func callRequest() {
        
        let url = "https://openapi.naver.com/v1/search/shop.json"
        AF.request(url)
        
        
    }
    
}
