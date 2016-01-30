//
//  SearchDetailViewController.swift
//  apiTest
//
//  Created by Shinichiro Yamamoto on 2016/01/30.
//  Copyright © 2016年 shinichiro yamamoto. All rights reserved.
//

import UIKit

class SearchDetailViewController: UIViewController {

    
    // SearchResult
    var searchResult = SearchResult()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // コントローラーのタイトルを設定する（絞り込んだエリアの名前）
        self.title = searchResult.name
        
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
