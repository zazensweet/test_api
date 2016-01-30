//
//  SearchController.swift
//  apiTest
//
//  Created by Shinichiro Yamamoto on 2016/01/18.
//  Copyright © 2016年 shinichiro yamamoto. All rights reserved.
//

import UIKit
import Alamofire


// protocolの実装
@objc protocol SearchControllerDelegate {
    
    
    // API正常結果を返す
    func successSearch(result: NSDictionary)
    
    // API完了
    optional func completeSearch(status: String)
    
    // API失敗
    optional func failedSearch(error: NSError)
    
}


class SearchController {
    
    // デリゲートの設定（任意なのでoptional型で）
    weak var delegate: SearchControllerDelegate?
    
    // Alamofireのrequest用に用意
    let searchURL = "http://api.gnavi.co.jp/RestSearchAPI/20150630/"
    var option: [String: AnyObject]?

    
//    init(areaPara:String, areaCode:String) {
//        option = ["keyid" : gnavi.apikey, "format" : "json", areaPara : areaCode]
//    }

    
    func setOption(areaPara:String, areaCode:String, freeWord:String, hitPerPage:Int) {
        option = ["keyid" : gnavi.apikey, "format" : "json", areaPara : areaCode, "freeword" : freeWord, "hit_per_page" : hitPerPage]
    }

    
    
    // API Request 開始
    func start() {
        
        Alamofire.request(.GET, searchURL, parameters: option)
            .responseJSON { response in
                
                switch response.result {
                    
                    case .Success:
                        print("SUCCESS")
                        self.delegate?.successSearch(response.result.value as! NSDictionary)
                        break
                    
                    case .Failure(let error):
                        print("ERROR")
                        print(response.result.value)
                        self.delegate?.failedSearch?(error)
                        break
                }
                
                self.delegate?.completeSearch?(response.result.description)
                
        }
        
    }
    
    
    func nextSearch() {
        
        Alamofire.request(.GET, searchURL, parameters: option)
            .responseJSON { response in
                
                debugPrint(response)
                self.delegate?.completeSearch!(response.result.description)
                
        }
        
    }
    
    
}



