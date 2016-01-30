//
//  SearchViewController.swift
//  apiTest
//
//  Created by Shinichiro Yamamoto on 2016/01/24.
//  Copyright © 2016年 shinichiro yamamoto. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SearchControllerDelegate {

    
    // テーブルビュー
    @IBOutlet weak var searchTable: UITableView!
    
    // JSONデータ取得用
    var jsonData: NSDictionary!
    
    // SearchModel
    var searchModel = SearchModel()
    
    // SearchResult
    var searchResult = SearchResult()
    
    // SearchModelの選択したエリア情報用
    var sec: String? // コード
    var sep: String? // パラメータ名
    var hpp: Int? // 表示件数
    
    // SearchController
    let searchCont = SearchController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // コントローラーのタイトルを設定する（絞り込んだエリアの名前）
        self.title = searchModel.selectArea
        
        self.searchTable.delegate = self
        self.searchTable.dataSource = self
        
        self.searchTable.tableFooterView = UIView()
        
        // 選択したエリア情報を代入
        self.sec = searchModel.selectAreaCode
        self.sep = searchModel.selectAreaPara
        self.hpp = 20
        
        self.searchCont.delegate = self
    
        // SearchControllerのoptionに情報を渡す
        self.searchCont.setOption(sep!, areaCode:sec!, hitPerPage:hpp!)
        
        // 絞り込んだ条件で検索開始
        self.searchCont.start()
        
    }
    
    
    // SearchControllerのsuccessSearch
    func successSearch(result: NSDictionary) {
        
        // 結果を代入
        self.jsonData = result
        
        searchTable.reloadData()
        
    }
    
    
    // MARK:- テーブルビュー
    
    
    /*
    // セクションの個数を返す
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return
    }
    */
    
    
    /*
    // セクションのタイトルを返す
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return
    }
    */
    
    
    // セクション毎の行数を返す
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return jsonData == nil ? 0 : jsonData["rest"]!.count
        
    }
    
    
    // 各行のセルを返す
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
        
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        if jsonData["rest"]![indexPath.row]["name"] == nil {
            return cell
        }
        
        cell.textLabel?.text = jsonData == nil ? "-" : jsonData["rest"]![indexPath.row]["name"] as! String
        
        
        return cell
        
    }
    
    
    // MARK:- セグエ
    
    
    // セルをタップ
    func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        
        // セルの選択ハイライト戻す
        self.searchTable.deselectRowAtIndexPath(indexPath, animated: true)
        
        self.searchResult.name = jsonData["rest"]![indexPath.row]["name"] as! String

        performSegueWithIdentifier("searchDetailSegue", sender: nil)
        
    }
    
    
    // セグエ準備
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "searchDetailSegue") {
            (segue.destinationViewController as! SearchDetailViewController).searchResult = self.searchResult
        }
        
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
