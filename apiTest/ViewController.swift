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
    var freeWordTextField = UITextField()
    
    // セル
    var sltCell = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // コントローラーのタイトルを設定する
        self.title = "ぐるなびぃ"
        
        startTable.delegate = self
        startTable.dataSource = self
        freeWordTextField.delegate = self
        
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
        
        // カスタムCellのxibファイルを作成してやる
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "Cell")
        
        switch indexPath.row {
            
        case 0:
            // フリーワード用のテキストフィールド
            let cellWidth = cell.frame.width
            let cellHeight = cell.frame.height
            
            freeWordTextField.frame = CGRectMake(0,0,cellWidth,cellHeight)
            freeWordTextField.backgroundColor = UIColor(colorLiteralRed: 0.97, green: 0.97, blue: 0.97, alpha: 1)
            freeWordTextField.placeholder = "フリーワード"
            freeWordTextField.clearButtonMode = UITextFieldViewMode.WhileEditing
            
            cell.contentView.addSubview(freeWordTextField)
            
            // セルの設定
            cell.accessoryType = UITableViewCellAccessoryType.None
            
        case 1:
            // セルの設定
            cell.textLabel?.text = "エリアを選ぶ"
            sltCell = (cell.textLabel?.text)!
            
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            
        default:
            break
            
        }
        
        return cell
        
    }
    
    
    // MARK:- テキストフィールド

    
    // テキストフィールド改行でキーボードとじる
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
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
