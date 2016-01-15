//
//  ViewController.swift
//  apiTest
//
//  Created by Shinichiro Yamamoto on 2015/12/24.
//  Copyright © 2015年 shinichiro yamamoto. All rights reserved.
//

// フリーワードとエリアを選ぶメニューを配置

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    
    // テーブルビュー
    @IBOutlet weak var startTable: UITableView!
    
    // テキストビュー
    @IBOutlet weak var sortResult: UITextView!
    
    // フリーワード用のテキストフィールド
    var freeWord: UITextField!
    
    // カスタムセル
    var customCell: CustomCellFreeWord!
    
    // SearchModel
    var searchModel = SearchModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // コントローラーのタイトルを設定する
        self.title = "ぐるなびぃ"
        
        self.startTable.delegate = self
        self.startTable.dataSource = self
        
        //カスタムセルを指定
        self.customCell = UINib(nibName: "CustomCellFreeWord", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! CustomCellFreeWord
        
        self.freeWord = self.customCell.freeWordTextField
        
        self.freeWord.delegate = self
        
        self.startTable.tableFooterView = UIView()
        
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
        return 2
    }


    // 各行のセルを返す
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        switch indexPath.row {
            
        case 0:
            return self.customCell

        case 1:
            let cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
            cell.textLabel?.text = searchModel.selectArea
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            return cell
            
        default:
            return UITableViewCell(style: .Default, reuseIdentifier: "Cell")
            
        }
        
    }
    
    
    // MARK:- テキストフィールド

    
    // テキストフィールド改行でキーボードとじる
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        searchModel.freeWord = self.freeWord.text!
        self.freeWord.endEditing(true)
        self.printSearchModel()
        return false
    }
    
    
    // MARK:- セグエ
    
    
    // セルをタップ
    func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        
        // セルの選択ハイライト戻す
        startTable.deselectRowAtIndexPath(indexPath, animated: true)
        
        let selectedCell = indexPath.row
        
        if selectedCell == 1 {
            performSegueWithIdentifier("selectAreaSegue", sender: nil)
        }
        
    }
   
    
    // セグエ準備
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "selectAreaSegue") {
            (segue.destinationViewController as! SelectAreaViewController).searchModel = self.searchModel
        }
        
    }

    
    // SearchModelの状況確認
    func printSearchModel() {
        print("-----------検索条件-----------")
        print("フリーワード：\(searchModel.freeWord)")
        print("エリア：\(searchModel.area)")
        print("エリアコード：\(searchModel.areaCode)")
        print("都道府県：\(searchModel.pref)")
        print("都道府県コード：\(searchModel.prefCode)")
        print("エリアL：\(searchModel.gAreaL)")
        print("エリアLコード：\(searchModel.gAreaLCode)")
        print("エリアM：\(searchModel.gAreaM)")
        print("エリアMコード：\(searchModel.gAreaMCode)")
        print("エリアS：\(searchModel.gAreaS)")
        print("エリアSコード：\(searchModel.gAreaSCode)")
        
        self.sortResult.text =
            "検索条件：\n" +
            "フリーワード：\(searchModel.freeWord)\n" +
            "エリア：\(searchModel.area)\n" +
            "エリアコード：\(searchModel.areaCode)\n" +
            "都道府県：\(searchModel.pref)\n" +
            "都道府県コード：\(searchModel.prefCode)\n" +
            "エリアL：\(searchModel.gAreaL)\n" +
            "エリアLコード：\(searchModel.gAreaLCode)\n" +
            "エリアM：\(searchModel.gAreaM)\n" +
            "エリアMコード：\(searchModel.gAreaMCode)\n" +
            "エリアS：\(searchModel.gAreaS)\n" +
            "エリアSコード：\(searchModel.gAreaSCode)\n"
        
    }
    
    
    // 戻ってきた時のエリアを選ぶの表示
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    
        self.startTable.reloadData()
        
        self.printSearchModel()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
