//
//  SelectAreaViewController.swift
//  apiTest
//
//  Created by Shinichiro Yamamoto on 2016/01/05.
//  Copyright © 2016年 shinichiro yamamoto. All rights reserved.
//

import UIKit
import Alamofire

class SelectAreaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    // テーブルビュー
    @IBOutlet weak var selectAreaTable: UITableView!
    
    // 手前のビューコントローラーから
    var selfTitle = String()
    
    // セル
    var sltCell = String()
    var sltCellCode = String()
    
    // API URL JSON
    let requestUrl = "http://api.gnavi.co.jp/master/AreaSearchAPI/20150630/"
    
    // JSONデータ取得用
    var jsonData: NSArray!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // コントローラーのタイトルを設定する（手前のコントローラーのセルより）
        self.title = selfTitle
        
        selectAreaTable.delegate = self
        selectAreaTable.dataSource = self
        
        // JSONをゲット
        Alamofire.request(.GET, requestUrl, parameters: ["keyid" : gnavi.apikey, "format" : "json"]).responseJSON { response in
            
            self.jsonData = response.result.value!["area"] as! NSArray
            self.selectAreaTable.reloadData()
            
            self.testPrint()
            
        }
    
    }
    
    
    func testPrint() {
        print(jsonData)
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
        
        return jsonData == nil ? 0 : jsonData!.count
        
    }

    
    // 各行のセルを返す
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
        
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        if jsonData[indexPath.row]["area_name"] == nil {
            return cell
        }
        
        cell.textLabel?.text = jsonData[indexPath.row]["area_name"] == nil ? "-" : jsonData[indexPath.row]["area_name"] as! String
        
        return cell
        
    }
    
    
    // MARK:- セグエ
    
    
    // セルをタップ
    func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        
        // セルの選択ハイライト戻す
        selectAreaTable.deselectRowAtIndexPath(indexPath, animated: true)
        
        sltCell = jsonData[indexPath.row]["area_name"] as! String
        sltCellCode = jsonData[indexPath.row]["area_code"] as! String
        
        performSegueWithIdentifier("selectPrefSegue", sender: nil)
        
    }
    
    
    // セグエ準備
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "selectPrefSegue") {
            (segue.destinationViewController as! SelectPrefViewController).selfTitle = sltCell
            (segue.destinationViewController as! SelectPrefViewController).areaCode = sltCellCode
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
