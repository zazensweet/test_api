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
    
    
    // エリアを選ぶ
    var _selectArea: String = "エリアを選ぶ"
    
    var selectArea: String {
        get {
            return self._selectArea
        }
        set(newValue) {
            self._selectArea = newValue
        }
    }
    
    var _selectAreaCode: String = ""
    
    var selectAreaCode: String {
        get {
            return self._selectAreaCode
        }
        set(newValue) {
            self._selectAreaCode = newValue
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
    
    var _areaCode: String = ""
    
    var areaCode: String {
        get {
            return self._areaCode
        }
        set(newValue) {
            self._areaCode = newValue
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
    
    var _prefCode: String = ""
    
    var prefCode: String {
        get {
            return self._prefCode
        }
        set(newValue) {
            self._prefCode = newValue
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
    
    var _gAreaLCode: String = ""
    
    var gAreaLCode: String {
        get {
            return self._gAreaLCode
        }
        set(newValue) {
            self._gAreaLCode = newValue
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
    
    var _gAreaMCode: String = ""
    
    var gAreaMCode: String {
        get {
            return self._gAreaMCode
        }
        set(newValue) {
            self._gAreaMCode = newValue
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
    
    var _gAreaSCode: String = ""
    
    var gAreaSCode: String {
        get {
            return self._gAreaSCode
        }
        set(newValue) {
            self._gAreaSCode = newValue
        }
    }
    
    
}





