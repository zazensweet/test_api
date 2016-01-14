//
//  SelectPrefViewController.swift
//  apiTest
//
//  Created by Shinichiro Yamamoto on 2016/01/06.
//  Copyright © 2016年 shinichiro yamamoto. All rights reserved.
//

import UIKit
import Alamofire

class SelectPrefViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    // テーブルビュー
    @IBOutlet weak var selectPrefTable: UITableView!
    
    // 手前のビューコントローラーから
    var selfTitle = String()
    var areaCode = String()
    
    // セル
    var sltCell = String()
    var sltCellCode = String()
    
    // API URL JSON
    let requestUrl = "http://api.gnavi.co.jp/master/PrefSearchAPI/20150630/"
    
    // JSONデータ取得用
    var jsonData: NSArray!
    var sortJsonData = [AnyObject]()
    var sortJsonDataArray: NSArray!
    
    // SearchModel
    var searchModel: SearchModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // コントローラーのタイトルを設定する（手前のコントローラーのセルより）
        // self.title = selfTitle
        self.title = searchModel.area
        
        selectPrefTable.delegate = self
        selectPrefTable.dataSource = self
        
        // JSONをゲット
        Alamofire.request(.GET, requestUrl, parameters: ["keyid" : gnavi.apikey, "format" : "json"]).responseJSON { response in
            
            self.jsonData = response.result.value!["pref"] as! NSArray
            
            self.sltPref()
            
            self.testPrint()
            
        }
        
    }
    
    
    // 選択したエリアの都道府県に絞る
    func sltPref() {
        for jd in jsonData {
            if jd["area_code"] as! String == areaCode {
                sortJsonData.append(jd)
            }
        }
        sortJsonDataArray = sortJsonData
        selectPrefTable.reloadData()
    }
    
    
    func testPrint() {
        
        print(sortJsonDataArray)
        // print(jsonData)
        // print(jsonData[0]["area_code"])
        // print(areaCode)
        // print("確認：\(sortJsonData)")
        
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
    
        return sortJsonDataArray == nil ? 0 : sortJsonDataArray!.count
        
    }
    
    
    // 各行のセルを返す
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
        
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        if sortJsonDataArray[indexPath.row]["pref_name"] == nil {
            return cell
        }
        
        cell.textLabel?.text = sortJsonDataArray[indexPath.row]["pref_name"] == nil ? "-" : sortJsonDataArray[indexPath.row]["pref_name"] as! String
        
        return cell
        
    }
    
    
    // MARK:- セグエ
    
    
    // セルをタップ
    func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        
        // セルの選択ハイライト戻す
        selectPrefTable.deselectRowAtIndexPath(indexPath, animated: true)
        
        sltCell = sortJsonDataArray[indexPath.row]["pref_name"] as! String
        sltCellCode = sortJsonDataArray[indexPath.row]["pref_code"] as! String
        
        performSegueWithIdentifier("selectGAreaLargeSegue", sender: nil)
        
    }
    
    
    // セグエ準備
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "selectGAreaLargeSegue") {
            (segue.destinationViewController as! SelectGAreaLargeViewController).selfTitle = sltCell
            (segue.destinationViewController as! SelectGAreaLargeViewController).prefCode = sltCellCode
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
