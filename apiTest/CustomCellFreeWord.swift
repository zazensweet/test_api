//
//  CustomCellFreeWord.swift
//  apiTest
//
//  Created by Shinichiro Yamamoto on 2016/01/07.
//  Copyright © 2016年 shinichiro yamamoto. All rights reserved.
//

import UIKit

class CustomCellFreeWord: UITableViewCell {
    
    
    @IBOutlet weak var freeWordTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
