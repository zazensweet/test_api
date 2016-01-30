//
//  SelectGAreaSmallViewController.swift
//  apiTest
//
//  Created by Shinichiro Yamamoto on 2016/01/15.
//  Copyright © 2016年 shinichiro yamamoto. All rights reserved.
//

// M名：S一覧

import UIKit
import Alamofire

class SelectGAreaSmallViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    // テーブルビュー
    @IBOutlet weak var selectGAreaSmallTable: UITableView!
    
    // API URL JSON
    let requestUrl = "http://api.gnavi.co.jp/master/GAreaSmallSearchAPI/20150630/"
    
    // JSONデータ取得用
    var jsonData: NSArray!
    var sortJsonData = [AnyObject]()
    var sortJsonDataArray: NSArray!
    
    // SearchModel
    var searchModel = SearchModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // コントローラーのタイトルを設定する（手前のコントローラーのセルより）
        self.title = searchModel.gAreaM
        
        self.selectGAreaSmallTable.delegate = self
        self.selectGAreaSmallTable.dataSource = self
        
        // JSONをゲット
        Alamofire.request(.GET, requestUrl, parameters: ["keyid" : gnavi.apikey, "format" : "json"]).responseJSON { response in
            
            self.jsonData = response.result.value!["garea_small"] as! NSArray
            
            self.sorter()
            
            self.testPrint()
            
        }
        
        self.selectGAreaSmallTable.tableFooterView = UIView()
        
    }

    
    // 選択したエリアMからエリアSに絞る
    func sorter() {
        sortJsonData = [self.title!]
        for jd in jsonData {
            if jd["garea_middle"]!!["areacode_m"] as! String == searchModel.gAreaMCode {
                sortJsonData.append(jd)
            }
        }
        sortJsonDataArray = sortJsonData
        selectGAreaSmallTable.reloadData()
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
            cell.textLabel?.text = "\(sortJsonDataArray[indexPath.row]["areaname_s"] == nil ? "-" : sortJsonDataArray[indexPath.row]["areaname_s"] as! String)を指定する"
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        
        return cell
        
    }
    
    
    // セルをタップ
    func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        
        // セルの選択ハイライト戻す
        self.selectGAreaSmallTable.deselectRowAtIndexPath(indexPath, animated: true)
        
        if indexPath.row == 0 {
            
            // 選択したエリア情報をおさめる
            searchModel.selectArea = searchModel.gAreaM
            searchModel.selectAreaCode = searchModel.gAreaMCode
            searchModel.selectAreaPara = "areacode_m"
            
            searchModel.gAreaS = ""
            searchModel.gAreaSCode = ""
            
        } else {
            
            searchModel.gAreaS = sortJsonDataArray[indexPath.row]["areaname_s"] as! String
            searchModel.gAreaSCode = sortJsonDataArray[indexPath.row]["areacode_s"] as! String
            
            // 選択したエリア情報をおさめる
            searchModel.selectArea = searchModel.gAreaS
            searchModel.selectAreaCode = searchModel.gAreaSCode
            searchModel.selectAreaPara = "areacode_s"
            
        }
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
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
