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
    
    
    // 店舗名：name
    var _name: String = ""
    
    var name: String {
        get {
            return self._name
        }
        set(newValue) {
            self._name = newValue
        }
    }
    
    
    // 店舗名（読み）：name_kana
    var _name_kana: String = ""
    
    var name_kana: String {
        get {
            return self._name_kana
        }
        set(newValue) {
            self._name_kana = newValue
        }
    }
    
    
    // URL（PCサイト）：url
    var _url: String = ""
    
    var url: String {
        get {
            return self._url
        }
        set(newValue) {
            self._url = newValue
        }
    }
    
    
    // 住所：address
    var _address: String = ""
    
    var address: String {
        get {
            return self._address
        }
        set(newValue) {
            self._address = newValue
        }
    }
    
    
    // 電話：tel
    var _tel: String = ""
    
    var tel: String {
        get {
            return self._tel
        }
        set(newValue) {
            self._tel = newValue
        }
    }
    
    
    // 営業時間：opentime
    var _opentime: String = ""
    
    var opentime: String {
        get {
            return self._opentime
        }
        set(newValue) {
            self._opentime = newValue
        }
    }
    
    
    // 休業日：holiday
    var _holiday: String = ""
    
    var holiday: String {
        get {
            return self._holiday
        }
        set(newValue) {
            self._holiday = newValue
        }
    }
    
    
    // 店舗写真1：shopImage
    var _shopImage: String = ""
    
    var shopImage: String {
        get {
            return self._shopImage
        }
        set(newValue) {
            self._shopImage = newValue
        }
    }
    
    
}





