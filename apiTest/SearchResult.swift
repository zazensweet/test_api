//
//  SearchResult.swift
//  apiTest
//
//  Created by Shinichiro Yamamoto on 2016/01/30.
//  Copyright © 2016年 shinichiro yamamoto. All rights reserved.
//


// レストラン検索結果用
class SearchResult {
    
    
    // MARK: - 絞り込んだ情報
    
    
    // 店舗名称：name
    var _name: String = ""
    
    var name: String {
        get {
            return self._name
        }
        set(newValue) {
            self._name = newValue
        }
    }
    
    
}





