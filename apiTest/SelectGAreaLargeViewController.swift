//
//  SelectGAreaLargeViewController.swift
//  apiTest
//
//  Created by Shinichiro Yamamoto on 2016/01/07.
//  Copyright © 2016年 shinichiro yamamoto. All rights reserved.
//

import UIKit
import Alamofire

class SelectGAreaLargeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    // テーブルビュー
    @IBOutlet weak var selectGAreaLargeTable: UITableView!
    
    // 手前のビューコントローラーから
    var selfTitle = String()
    var prefCode = String()
    
    // セル
    var sltCell = String()
    var sltCellCode = String()
    
    // API URL JSON
    let requestUrl = "http://api.gnavi.co.jp/master/GAreaLargeSearchAPI/20150630/"
    
    // JSONデータ取得用
    var jsonData: NSArray!
    var sortJsonData = [AnyObject]()
    var sortJsonDataArray: NSArray!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // コントローラーのタイトルを設定する（手前のコントローラーのセルより）
        self.title = selfTitle
        
        selectGAreaLargeTable.delegate = self
        selectGAreaLargeTable.dataSource = self
        
        // JSONをゲット
        Alamofire.request(.GET, requestUrl, parameters: ["keyid" : gnavi.apikey, "format" : "json"]).responseJSON { response in
            
            self.jsonData = response.result.value!["garea_large"] as! NSArray
            
            self.sltGAreaLarge()
            
            self.testPrint()
            
        }
        
    }

    
    // 選択した都道府県のエリアLに絞る
    func sltGAreaLarge() {
        sortJsonData = [selfTitle]
        for jd in jsonData {
            if jd["pref"]!!["pref_code"] as! String == prefCode {
                sortJsonData.append(jd)
            }
        }
        sortJsonDataArray = sortJsonData
        selectGAreaLargeTable.reloadData()
    }
    
    
    func testPrint() {
        
        // print(prefCode)
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
            cell.textLabel?.text = "\(selfTitle)を指定する"
            cell.textLabel!.font = UIFont.boldSystemFontOfSize(UIFont.labelFontSize())
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            cell.textLabel?.text = sortJsonDataArray[indexPath.row]["areaname_l"] == nil ? "-" : sortJsonDataArray[indexPath.row]["areaname_l"] as! String
        }
        
        return cell
        
    }
    
    
    // MARK:- セグエ
    
    
    // セルをタップ
    func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        
        // セルの選択ハイライト戻す
        selectGAreaLargeTable.deselectRowAtIndexPath(indexPath, animated: true)
        
        if indexPath.row == 0 {
            print("指定して最初の画面に戻る")
            print(selfTitle)
            print(prefCode)
            self.navigationController?.popToRootViewControllerAnimated(true)
        } else {
            sltCell = sortJsonDataArray[indexPath.row]["areaname_l"] as! String
            sltCellCode = sortJsonDataArray[indexPath.row]["areacode_l"] as! String
        }
        
        // performSegueWithIdentifier("selectGAreaLargeSegue", sender: nil)
        
    }
    
    
//    // セグエ準備
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        
//        if (segue.identifier == "selectGAreaLargeSegue") {
//            (segue.destinationViewController as! SelectGAreaLargeViewController).selfTitle = sltCell
//            (segue.destinationViewController as! SelectGAreaLargeViewController).prefCode = sltCellCode
//        }
//        
//    }
    
    
    
    
    
    
    
    
    
    
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
