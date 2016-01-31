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
    
    // 検索するボタン
    @IBOutlet weak var searchBtn: UIButton!
    
    // フリーワード用のテキストフィールド
    var freeWord: UITextField!
    
    // カスタムセル
    var customCell = CustomCellFreeWord()
    
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
        
        // 空の行のセパレータを消す
        self.startTable.tableFooterView = UIView()
        
        // 初期は検索ボタンは無効化
        self.searchBtn.enabled = false
        self.searchBtn.alpha = 0.2
        
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
    
    
    // フリーワードをsearchModelにおさめる
    func textFieldDidEndEditing(textField: UITextField) {
        
        searchModel.freeWord = self.freeWord.text!
        
        // 検索ボタンを有効にする
        self.onSearchBtn()
        
        self.startTable.reloadData()
        
    }
    
    
    // テキストフィールド改行でキーボードとじる
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
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
    
    
    // 検索ボタンをタップ
    @IBAction func goSearchBtn(sender: AnyObject) {
        
        // 検索結果一覧画面へ
        performSegueWithIdentifier("searchSegue", sender: nil)
        
    }
    
    
    // セグエ準備
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "selectAreaSegue") {
            
            (segue.destinationViewController as! SelectAreaViewController).searchModel = self.searchModel
            
        } else if (segue.identifier == "searchSegue") {
            
            (segue.destinationViewController as! SearchViewController).searchModel = self.searchModel
            
        }
        
    }

    
    // 戻ってきた時のエリアを選ぶの表示
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.startTable.reloadData()
        
        // 検索ボタンを有効にする
        self.onSearchBtn()
        
        self.printSearchModel()
        
    }
    
    // 検索ボタンを有効にする
    func onSearchBtn() {
        
        if self.searchModel.selectArea != "エリアを選ぶ" || self.searchModel.freeWord != "" {
            
            self.searchBtn.enabled = true
            self.searchBtn.alpha = 1.0
            
        } else if self.searchModel.selectArea == "エリアを選ぶ" || self.searchModel.freeWord == "" {
            
            self.searchBtn.enabled = false
            self.searchBtn.alpha = 0.2
            
        }
        
    }
    
    
    // SearchModelの状況確認
    func printSearchModel() {
        print("-----------検索条件-----------")
        print("フリーワード：\(searchModel.freeWord)")
        print("選択したエリア：\(searchModel.selectArea)")
        print("選択したエリアコード：\(searchModel.selectAreaCode)")
        print("選択したエリアパラ：\(searchModel.selectAreaPara)")
        print("----------------------")
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
            "選択したエリア：\(searchModel.selectArea)\n" +
            "選択したエリアコード：\(searchModel.selectAreaCode)\n" +
            "選択したエリアパラ：\(searchModel.selectAreaPara)\n" +
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
    
    

   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
