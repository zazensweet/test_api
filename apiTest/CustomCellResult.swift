//
//  CustomCellResult.swift
//  apiTest
//
//  Created by Shinichiro Yamamoto on 2016/01/31.
//  Copyright © 2016年 shinichiro yamamoto. All rights reserved.
//

import UIKit

class CustomCellResult: UITableViewCell {

    
    // 店舗名
    @IBOutlet weak var shopName: UILabel!
    
    // イメージ
    @IBOutlet weak var shopImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
