//
//  SearchViewController.swift
//  apiTest
//
//  Created by Shinichiro Yamamoto on 2016/01/24.
//  Copyright © 2016年 shinichiro yamamoto. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, SearchControllerDelegate {

    
    // テーブルビュー
    @IBOutlet weak var searchTable: UITableView!
    
    
    // SearchModel
    var searchModel = SearchModel()
    

    // SearchController
    let searchCont = SearchController.init(areaPara:"areacode_m", areaCode:"AREAM2115")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // コントローラーのタイトルを設定する（絞り込んだエリアの名前）
        self.title = searchModel.selectArea
        
        self.searchCont.delegate = self
    
        self.searchCont.start()
        
    }
    
    
    
    
    // 検索
    func successSearch(result: NSDictionary) {
        print(result)
        print("COMPETE")
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
