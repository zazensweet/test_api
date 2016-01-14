//
//  SearchModel.swift
//  apiTest
//
//  Created by Shinichiro Yamamoto on 2016/01/11.
//  Copyright © 2016年 shinichiro yamamoto. All rights reserved.
//


// レストラン検索用
class SearchModel {
    
    
    // フリーワード文言
    var _freeWord: String = ""
    
    var freeWord: String {
        get {
            return self._freeWord
        }
        set(newValue) {
            self._freeWord = newValue
        }
    }
    
    
    // エリア：Area
    var _area: String = ""
    
    var area: String {
        get {
            return self._area
        }
        set(newValue) {
            self._area = newValue
        }
    }
    
    
    // 都道府県：Pref
    var _pref: String = ""
    
    var pref: String {
        get {
            return self._pref
        }
        set(newValue) {
            self._pref = newValue
        }
    }
    
    
    // エリアL：GAreaLarge
    var _gAreaL: String = ""
    
    var gAreaL: String {
        get {
            return self._gAreaL
        }
        set(newValue) {
            self._gAreaL = newValue
        }
    }
    
    
    // エリアM
    var _gAreaM: String = ""
    
    var gAreaM: String {
        get {
            return self._gAreaM
        }
        set(newValue) {
            self._gAreaM = newValue
        }
    }
    
    
    // エリアS
    var _gAreaS: String = ""
    
    var gAreaS: String {
        get {
            return self._gAreaS
        }
        set(newValue) {
            self._gAreaS = newValue
        }
    }
    
    
}





