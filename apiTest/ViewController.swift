//
//  ViewController.swift
//  apiTest
//
//  Created by Shinichiro Yamamoto on 2015/12/24.
//  Copyright © 2015年 shinichiro yamamoto. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    
    // テーブルビュー
    @IBOutlet weak var startTable: UITableView!
    
    // フリーワード用のテキストフィールド
    var freeWord: UITextField!
    
    // セル
    var sltCell = String()
    
    // カスタムセル
    var customCell: CustomCellFreeWord!
    

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
            cell.textLabel?.text = "エリアを選ぶ"
            sltCell = (cell.textLabel?.text)!
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            return cell
            
        default:
            return UITableViewCell(style: .Default, reuseIdentifier: "Cell")
        }
        
        
        
    }
    
    
    // MARK:- テキストフィールド

    
    // テキストフィールド改行でキーボードとじる
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.freeWord.endEditing(true)
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
            (segue.destinationViewController as! SelectAreaViewController).selfTitle = sltCell
        }
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
