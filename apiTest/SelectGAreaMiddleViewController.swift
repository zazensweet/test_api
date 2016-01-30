//
//  SelectGAreaMiddleViewController.swift
//  apiTest
//
//  Created by Shinichiro Yamamoto on 2016/01/15.
//  Copyright © 2016年 shinichiro yamamoto. All rights reserved.
//

// L名：M一覧

import UIKit
import Alamofire

class SelectGAreaMiddleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    // テーブルビュー
    @IBOutlet weak var selectGAreaMiddleTable: UITableView!
    
    // API URL JSON
    let requestUrl = "http://api.gnavi.co.jp/master/GAreaMiddleSearchAPI/20150630/"
    
    // JSONデータ取得用
    var jsonData: NSArray!
    var sortJsonData = [AnyObject]()
    var sortJsonDataArray: NSArray!
    
    // SearchModel
    var searchModel = SearchModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // コントローラーのタイトルを設定する（手前のコントローラーのセルより）
        self.title = searchModel.gAreaL
        
        self.selectGAreaMiddleTable.delegate = self
        self.selectGAreaMiddleTable.dataSource = self
        
        // JSONをゲット
        Alamofire.request(.GET, requestUrl, parameters: ["keyid" : gnavi.apikey, "format" : "json"]).responseJSON { response in
         
            self.jsonData = response.result.value!["garea_middle"] as! NSArray
            
            self.sorter()
            
            self.testPrint()
            
        }
        
        self.selectGAreaMiddleTable.tableFooterView = UIView()
        
    }

    
    // 選択したエリアLからエリアMに絞る
    func sorter() {
        sortJsonData = [self.title!]
        for jd in jsonData {
            if jd["garea_large"]!!["areacode_l"] as! String == searchModel.gAreaLCode {
                sortJsonData.append(jd)
            }
        }
        sortJsonDataArray = sortJsonData
        selectGAreaMiddleTable.reloadData()
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
        
        //        if sortJsonDataArray[indexPath.row]["areaname_l"] == nil {
        //            return cell
        //        }
        
        if indexPath.row == 0 {
            cell.accessoryType = UITableViewCellAccessoryType.None
            cell.textLabel?.text = "\(self.title!)を指定する"
            cell.textLabel!.font = UIFont.boldSystemFontOfSize(UIFont.labelFontSize())
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            cell.textLabel?.text = sortJsonDataArray[indexPath.row]["areaname_m"] == nil ? "-" : sortJsonDataArray[indexPath.row]["areaname_m"] as! String
        }
        
        return cell
        
    }
    
    
    // MARK:- セグエ
    
    
    // セルをタップ
    func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        
        // セルの選択ハイライト戻す
        self.selectGAreaMiddleTable.deselectRowAtIndexPath(indexPath, animated: true)
        
        if indexPath.row == 0 {
            
            // 選択したエリア情報をおさめる
            searchModel.selectArea = searchModel.gAreaL
            searchModel.selectAreaCode = searchModel.gAreaLCode
            searchModel.selectAreaPara = "areacode_l"
        
            searchModel.gAreaM = ""
            searchModel.gAreaMCode = ""
            searchModel.gAreaS = ""
            searchModel.gAreaSCode = ""
            
            self.navigationController?.popToRootViewControllerAnimated(true)
            
        } else {
            
            searchModel.gAreaM = sortJsonDataArray[indexPath.row]["areaname_m"] as! String
            searchModel.gAreaMCode = sortJsonDataArray[indexPath.row]["areacode_m"] as! String
            performSegueWithIdentifier("selectGAreaSmallSegue", sender: nil)
            
        }
        
    }
    
    
    // セグエ準備
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "selectGAreaSmallSegue") {
            (segue.destinationViewController as! SelectGAreaSmallViewController).searchModel = self.searchModel
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
