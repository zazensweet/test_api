//
//  SearchDetailViewController.swift
//  apiTest
//
//  Created by Shinichiro Yamamoto on 2016/01/30.
//  Copyright © 2016年 shinichiro yamamoto. All rights reserved.
//

import UIKit

class SearchDetailViewController: UIViewController {

    
    // SearchModel
    var searchModel = SearchModel()
    
    // SearchResult
    var searchResult = SearchResult()
    
    // テスト用のテキストビュー
    @IBOutlet weak var testTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // コントローラーのタイトルを設定する（絞り込んだエリアの名前）
        self.title = searchResult.name
        
        self.testTextView.text =
            "店舗名：\(searchResult.name)\n" +
            "読み：\(searchResult.name_kana)\n" +
            "URL：\(searchResult.url)\n" +
            "住所：\(searchResult.address)\n" +
            "電話：\(searchResult.tel)\n" +
            "営業時間：\(searchResult.opentime)\n" +
            "休業日：\(searchResult.holiday)\n" +
            "店舗写真：\(searchResult.shopImage)"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
